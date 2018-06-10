class MU < FPM::Cookery::Recipe
  description 'a collection of utilities for indexing and searching Maildirs'

  name    'mu'
  version '1.0'

  homepage 'https://github.com/djcb/mu'
  source   "https://github.com/djcb/mu/releases/download/v#{version}/mu-#{version}.tar.xz"
  sha256   '966adc4db108f8ddf162891f9c3c24ba27f78c31f86575a0e05fbf14e857a513'

  build_depends 'pkg-config', 'libglib2.0-dev', 'libgmime-2.6-dev', 'libxapian-dev'
  depends 'libgmime-2.6-0', 'libpcre3', 'libuuid1', 'libxapian22v5'

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
