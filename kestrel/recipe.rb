class Kestrel < FPM::Cookery::Recipe
  SCALA_VERSION = '2.9.2'

  description 'simple, distributed message queue system'

  name     'kestrel'
  version  '2.4.1'
  revision 0
  homepage 'http://robey.github.com/kestrel/'
  source   "http://robey.github.com/kestrel/download/kestrel-#{version}.zip"
  md5      '623e325823a97dd6e5d58f7a3d114c9f'
  arch     'all'

  depends 'default-jre-headless'

  config_files %w(
    /etc/default/kestrel
    /etc/kestrel/development.scala
    /etc/kestrel/production.scala
    /etc/security/limits.d/kestrel.conf
  )

  post_install   'post-install'
  post_uninstall 'post-uninstall'

  def build
    Dir.chdir("kestrel-#{version}") do
      inline_replace 'config/production.scala' do |s|
        s.gsub! 'listenAddress = "0.0.0.0"', 'listenAddress = "127.0.0.1"'
      end
    end

    File.open('kestrel.sh', 'w', 0755) do |f|
      f.write <<-__EOF
#!/bin/sh

set -e

if [ -f /etc/default/kestrel ]; then
  . /etc/default/kestrel
fi

cd /usr/share/kestrel-#{version}

exec /usr/bin/java $KESTREL_JAVA_OPTS -jar kestrel_#{SCALA_VERSION}-#{version}.jar
      __EOF
    end
  end

  def install
    var('log/kestrel').mkpath
    var('spool/kestrel').mkpath

    etc('default').install_p workdir('kestrel.default'), 'kestrel'
    etc('init').install_p workdir('kestrel.upstart'), 'kestrel.conf'
    etc('security/limits.d').install workdir('kestrel.limits'), 'kestrel.conf'

    bin.install 'kestrel.sh', 'kestrel'

    Dir.chdir("kestrel-#{version}") do
      etc('kestrel').install Dir['config/*.scala']
      share("kestrel-#{version}").install Dir['*']

      rm_rf share("kestrel-#{version}/config"), :verbose => true

      # Do this AFTER the config dir has been removed!
      safesystem("ln -s /etc/kestrel #{share("kestrel-#{version}").to_s}/config")
    end
  end
end
