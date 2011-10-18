class Ruby193 < FPM::Cookery::Recipe
  description 'The Ruby virtual machine'

  name 'ruby'
  version '1.9.3rc1'
  homepage 'http://www.ruby-lang.org/'
  source 'ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-rc1.tar.bz2'
  sha256 '951a8810086abca0e200f81767a518ee2730d6dc9b0cc2c7e3587dcfc3bf5fc8'

  section 'interpreters'

  build_depends 'autoconf', 'libreadline5-dev', 'bison', 'zlib1g-dev',
                'libssl-dev', 'libyaml-dev'

  depends 'libreadline5', 'zlib1g', 'openssl', 'libyaml-0-2'

  def build
    configure :prefix => prefix, 'disable-install-doc' => true
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
