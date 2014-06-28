class Kafka < FPM::Cookery::Recipe
  description 'A high-throughput distributed messaging system'

  v = '0.8.1.1'
  name     'kafka'
  version  "2.8.0-#{v}"
  revision 0
  homepage 'http://kafka.apache.org/'
  source   "http://apache.cs.utah.edu/kafka/#{v}/kafka_#{version}.tgz"
  md5      'fb479c09370298a57bd91b68e0d6696f'
  arch     'all'
  section  'databases'

  depends 'default-jre-headless'

  post_install   'post-install'
  post_uninstall 'post-uninstall'

  config_files %w(
    /etc/default/kafka
    /etc/kafka/consumer.properties
    /etc/kafka/log4j.properties
    /etc/kafka/producer.properties
    /etc/kafka/server.properties
    /etc/kafka/zookeeper.properties
  )

  def build
    rm_rf 'bin/windows'

    inline_replace 'config/log4j.properties' do |s|
      s.gsub! 'log4j.DailyRollingFileAppender', 'log4j.RollingFileAppender'
      s.gsub! %r(File=(\S+\.log)), 'File=/var/log/kafka/\1'
      s.gsub! '=TRACE,', '=INFO,'

      %w(kafkaAppender stateChangeAppender requestAppender controllerAppender).each do |log|
        s << "log4j.appender.#{log}.MaxFileSize=10MB\n"
        s << "log4j.appender.#{log}.MaxBackupIndex=10\n"
      end
    end

    inline_replace 'config/server.properties' do |s|
      s.gsub! 'log.dir=/tmp/kafka-logs', 'log.dir=/var/lib/kafka/logs'
      s.gsub! 'kafka.csv.metrics.dir=/tmp/kafka_metrics', 'kafka.csv.metrics.dir=/var/lib/kafka/metrics'
      s.gsub! '#log.retention.bytes', 'log.retention.bytes'
    end

    inline_replace 'config/zookeeper.properties' do |s|
      s.gsub! 'dataDir=/tmp/zookeeper', 'dataDir=/var/lib/kafka/zookeeper'
      s.gsub! /^# disable the per-ip.*/, '# Set per-ip limit'
      s.gsub! 'maxClientCnxns=0', 'maxClientCnxns=10'
      s << "# http://zookeeper.apache.org/doc/r3.3.4/zookeeperStarted.html#sc_InstallingSingleMode\n"
      s << "tickTime=2000"
    end

    File.open('kafka.sh', 'w', 0755) do |f|
      f.write <<-__EOF
#!/bin/sh

exec /bin/sh /usr/share/kafka-#{version}/bin/kafka-run-class.sh kafka.Kafka /etc/kafka/server.properties
      __EOF
    end

    File.open('kafka-zookeeper.sh', 'w', 0755) do |f|
      f.write <<-__EOF
#!/bin/sh

exec /bin/sh /usr/share/kafka-#{version}/bin/kafka-run-class.sh org.apache.zookeeper.server.quorum.QuorumPeerMain /etc/kafka/zookeeper.properties
      __EOF
    end
  end

  def install
    share("kafka-#{version}").install Dir['*']

    etc('default').install workdir('kafka.default'), 'kafka'
    etc('init').install workdir('kafka.upstart'), 'kafka.conf'
    etc('init').install workdir('kafka-zookeeper.upstart'), 'kafka-zookeeper.conf'
    etc('kafka').install Dir['config/*']
    etc('security/limits.d').install workdir('kafka.limits'), 'kafka.conf'

    bin.install 'kafka.sh', 'kafka'
    bin.install 'kafka-zookeeper.sh', 'kafka-zookeeper'
  end
end
