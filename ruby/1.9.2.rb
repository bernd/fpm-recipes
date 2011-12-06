class Ruby192 < FPM::Cookery::Recipe
  description 'The Ruby virtual machine'

  name 'ruby'
  version '1:1.9.2p290'
  revision 1
  homepage 'http://www.ruby-lang.org/'
  source 'ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p290.tar.bz2'
  sha256 '403b3093fbe8a08dc69c269753b8c6e7bd8f87fb79a7dd7d676913efe7642487'

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
