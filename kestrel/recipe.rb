class Kestrel < FPM::Cookery::Recipe
  description 'simple, distributed message queue system'

  name     'kestrel'
  version  '2.1.5'
  revision 0
  homepage 'http://robey.github.com/kestrel/'
  source   "http://robey.github.com/kestrel/download/kestrel-#{version}.zip"
  md5      '256503b15fb7feec37e100f5ef92f94d'
  arch     'all'

  depends [
    'openjdk-7-jdk', 'openjdk-7-jre', 'openjdk-7-jre-headless',
    'openjdk-6-jdk', 'openjdk-6-jre', 'openjdk-6-jre-headless',
    'java6-runtime', 'oracle-java7-jre', 'oracle-java7-jdk'
  ].join(' | ')

  def build
    builddir.install workdir('kestrel.upstart')

    inline_replace builddir('kestrel.upstart') do |s|
      s.gsub! '%%VERSION%%', version
    end

    Dir.chdir("kestrel-#{version}") do
      inline_replace 'config/production.scala' do |s|
        s.gsub! 'listenAddress = "0.0.0.0"', 'listenAddress = "127.0.0.1"'
      end
    end
  end

  def install
    var('log/kestrel').mkpath
    var('spool/kestrel').mkpath

    etc('default').install_p workdir('kestrel.default'), 'kestrel'
    etc('init').install_p builddir('kestrel.upstart'), 'kestrel.conf'

    Dir.chdir("kestrel-#{version}") do
      etc('kestrel').install Dir['config/*.scala']
      share("kestrel-#{version}").install Dir['*']

      rm_rf share("kestrel-#{version}/config"), :verbose => true

      with_trueprefix do
        File.open(builddir('post-install'), 'w', 0755) do |f|
          f.write <<-__POSTINST
#!/bin/sh
set -e

INST_PATH="#{share("kestrel-#{version}")}"

ln -sf /etc/kestrel $INST_PATH/config

exit 0
          __POSTINST
          self.class.post_install File.expand_path(f.path)
        end
      end
    end
  end
end
