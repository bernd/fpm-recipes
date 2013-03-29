class JRuby < FPM::Cookery::Recipe
  description 'Java implementation of the Ruby programming language'

  name     'jruby'
  version  '1.7.0'
  revision 0
  homepage 'http://www.jruby.org/'
  source   "http://jruby.org.s3.amazonaws.com/downloads/#{version}/jruby-bin-#{version}.tar.gz"
  md5      '21861e0ecdbf48cda713c8ade82fdddb'
  arch     'all'

  section  'interpreters'

  java = [
    'openjdk-7-jdk', 'openjdk-7-jre', 'openjdk-7-jre-headless',
    'openjdk-6-jdk', 'openjdk-6-jre', 'openjdk-6-jre-headless',
    'java6-runtime', 'oracle-java7-installer'
  ]

  depends java.join(' | ')

  def build
    rm Dir['bin/*.{bat,dll,exe}'], :verbose => true
    rm_rf %w{docs samples share tool}, :verbose => true
  end

  def install
    prefix("jruby-#{version}").install Dir['*']

    with_trueprefix do
      File.open(builddir('post-install'), 'w', 0755) do |f|
        f.write <<-__POSTINST
#!/bin/sh
set -e

BIN_PATH="#{prefix("jruby-#{version}/bin")}"

for bin in jruby jirb jgem jrubyc; do
  update-alternatives --install /usr/bin/$bin $bin $BIN_PATH/$bin 20000
done

exit 0
        __POSTINST
        self.class.post_install File.expand_path(f.path)
      end

      File.open(builddir('pre-uninstall'), 'w', 0755) do |f|
        f.write <<-__PRERM
#!/bin/sh
set -e

BIN_PATH="#{prefix("jruby-#{version}/bin")}"

if [ "$1" != "upgrade" ]; then
  for bin in jruby jirb jgem jrubyc; do
    update-alternatives --remove $bin $BIN_PATH/$bin
  done
fi

exit 0
        __PRERM
        self.class.pre_uninstall File.expand_path(f.path)
      end
    end
  end
end
