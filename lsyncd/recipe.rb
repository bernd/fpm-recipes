class Lsyncd < FPM::Cookery::Recipe
  description 'Live Syncing (Mirror) Daemon'

  name     'lsyncd'
  version  '2.0.5'
  homepage 'http://code.google.com/p/lsyncd/'
  source   "http://lsyncd.googlecode.com/files/lsyncd-#{version}.tar.gz"
  sha256   '3d76f26623a97de700764090abcc0d1e7ded50f386402567222dfd01a612121e'

  build_depends 'liblua5.1-0-dev'
  depends       'liblua5.1-0', 'rsync', 'lua5.1'

  def build
    configure :prefix => prefix
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
