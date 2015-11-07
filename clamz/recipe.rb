class Clamz < FPM::Cookery::Recipe
  description 'Downloader for the Amazon.com MP3 music store'

  name     'clamz'
  version  '2:0.5'
  homepage 'http://code.google.com/p/clamz/'
  source   'http://clamz.googlecode.com/files/clamz-0.5.tar.gz'
  sha256   '5a63f23f15dfa6c2af00ff9531ae9bfcca0facfe5b1aa82790964f050a09832b'

  platforms [:debian, :ubuntu] do
    build_depends 'libgcrypt11-dev', 'libcurl4-gnutls-dev', 'libexpat1-dev'
  end

  platforms :centos do
    build_depends 'expat-devel', 'curl-devel', 'libgcrypt-devel'
  end

  def build
    configure :prefix => prefix
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
