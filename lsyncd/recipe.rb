class Lsyncd < FPM::Cookery::Recipe
  description 'Live Syncing (Mirror) Daemon'

  name     'lsyncd'
  version  '2.1.6'
  revision '1'

  homepage 'https://github.com/axkibe/lsyncd'
  source   "https://github.com/axkibe/lsyncd/archive/release-#{version}.tar.gz"
  sha256   '02c241ee71b6abb23a796ac994a414e1229f530c249b838ae72d2ef74ae0f775'

  build_depends 'liblua5.1-0-dev', 'cmake'
  depends       'liblua5.1-0', 'rsync', 'lua5.1'

  def build
    sh "cmake -D CMAKE_INSTALL_PREFIX=#{prefix} ."
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
