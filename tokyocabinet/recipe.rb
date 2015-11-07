class TokyoCabinet < FPM::Cookery::Recipe
  description 'modern implementation of DBM'

  name     'tokyocabinet'
  version  '1.4.48'
  revision 0
  homepage 'http://fallabs.com/tokyocabinet/'
  source   "http://fallabs.com/tokyocabinet/tokyocabinet-#{version}.tar.gz"
  sha256   'a003f47c39a91e22d76bc4fe68b9b3de0f38851b160bbb1ca07a4f6441de1f90'

  section       'database'
  build_depends 'zlib1g-dev', 'libbz2-dev'
  depends       'zlib1g', 'libbz2-1.0'

  def build
    configure :prefix => prefix
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
