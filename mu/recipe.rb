class MU < FPM::Cookery::Recipe
  description 'a collection of utilities for indexing and searching Maildirs'

  name    'mu'
  version '0.9.13'

  homepage 'https://github.com/djcb/mu'
  source   "https://github.com/djcb/mu-releases/raw/master/mu-#{version}.tar.gz"
  sha256   '1e5fba4b15ff6db96320031ddd1b9015e09772ab464d3ec5586188c0293a26a4'

  build_depends 'pkg-config', 'libglib2.0-dev', 'libgmime-2.6-dev', 'libxapian-dev'
  depends 'libgmime-2.6-0', 'libpcre3', 'libuuid1', 'libxapian22'

  def build
    configure '--disable-mu4e',
              '--disable-gtk',
              '--disable-webkit',
              '--disable-guile'

    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
