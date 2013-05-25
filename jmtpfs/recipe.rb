class Jmtpfs < FPM::Cookery::Recipe
  description 'exchanging files between Android devices and Linux'

  name     'jmtpfs'
  version  '0.4'
  homepage 'http://research.jacquette.com/jmtpfs-exchanging-files-between-android-devices-and-linux/'
  source   "http://research.jacquette.com/wp-content/uploads/2012/05/jmtpfs-#{version}.tar.gz"
  license  'GPLv3'
  sha256   'cc063fca9702f230b386845575fe0aa00aedc6665f2db9f6ac9bf75e2abeb4a6'

  build_depends 'libmtp-dev', 'libfuse-dev', 'libmagic-dev'
  depends 'libfuse2', 'libgcc1', 'libmagic1', 'libmtp9', 'libstdc++6'

  def build
    configure :prefix => prefix
    make
  end

  def install
    make :install, 'DESTDIR' => destdir

    doc('jmtpfs').install 'COPYING', 'README'
  end
end
