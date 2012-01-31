class JRuby < FPM::Cookery::Recipe
  description 'Java implementation of the Ruby programming language'

  name     'jruby'
  version  '1.6.6'
  revision 0
  homepage 'http://www.jruby.org/'
  source   "http://jruby.org.s3.amazonaws.com/downloads/#{version}/jruby-bin-#{version}.tar.gz"
  md5      '78b1dcaf198e79f98b37cf09c362a956'
  arch     'all'

  section  'interpreters'

  depends  'openjdk-6-jre | java6-runtime | oracle-java7-jre | oracle-java7-jdk'

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
