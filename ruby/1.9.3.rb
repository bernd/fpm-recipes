class Ruby193 < FPM::Cookery::Recipe
  description 'The Ruby virtual machine'

  name 'ruby'
  version '1.9.3.0'
  homepage 'http://www.ruby-lang.org/'
  source 'http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p0.tar.bz2'
  sha256 'ca8ba4e564fc5f98b210a5784e43dfffef9471222849e46f8e848b37e9f38acf'

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
