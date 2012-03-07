class Ruby193 < FPM::Cookery::Recipe
  description 'The Ruby virtual machine'

  name 'ruby'
  version '1:1.9.3.125'
  revision 1
  homepage 'http://www.ruby-lang.org/'
  source 'http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p125.tar.bz2'
  sha256 'c67a59443052b5a9219eb4cee3892bdfbc6f250f0c8e214e02256a4cc7ef5526'

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
