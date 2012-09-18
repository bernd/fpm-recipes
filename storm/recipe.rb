class Strom < FPM::Cookery::Recipe
  description 'Distributed and fault-tolerant realtime computation: stream processing, continuous computation, distributed RPC, and more'

  name     'storm'
  version  '0.8.1'
  homepage 'http://www.elasticsearch.org/'
  source   "https://github.com/downloads/nathanmarz/storm/storm-#{version}.zip"
  sha256   'fd086855e0a012076af08446e7cfcdcec58fc28f3fc0b196f4d748a3ac68bee4'
  arch     'all'

  java = [
    'openjdk-7-jdk', 'openjdk-7-jre', 'openjdk-7-jre-headless',
    'openjdk-6-jdk', 'openjdk-6-jre', 'openjdk-6-jre-headless'
  ]

  depends java.join(' | ')

  def build
    inline_replace 'storm-0.8.1/log4j/storm.log.properties' do |s|
	s.gsub! "log4j.appender.A1.File = ${storm.home}/logs/${logfile.name}",
	        "log4j.appender.A1.File = /var/log/storm/${logfile.name}"
    end
  end

  def install
    %w(storm-nimbus.conf storm-supervisor.conf storm-ui.conf storm-drpc.conf).each do  |upfile|
	etc('init').install_p workdir("conf/#{upfile}"), upfile
    end 
    %w(storm storm-nimbus storm-supervisor storm-ui storm-drpc).each do |dfile|
	etc('default').install_p workdir("conf/#{dfile}"), dfile
    end
    %w(bin conf lib log4j public README.markdown RELEASE *.jar CHANGELOG.md LICENSE.html).each do |f|
	opt('storm/').install Dir["storm-#{version}/#{f}"]
    end
    var('lib/storm').mkpath
    var('log/storm').mkpath
  end
end
