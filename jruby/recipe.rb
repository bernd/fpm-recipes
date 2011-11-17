class JRuby < FPM::Cookery::Recipe
  description 'Java implementation of the Ruby programming language'

  name     'jruby'
  version  '1.6.4'
  revision 3
  homepage 'http://www.jruby.org/'
  source   "http://jruby.org.s3.amazonaws.com/downloads/#{version}/jruby-bin-#{version}.tar.gz"
  md5      '0e96b6f4d1c6f12b5ac480cd7ab7da78'
  arch     'all'

  section  'interpreters'

  depends  'openjdk-6-jre | java6-runtime'

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
