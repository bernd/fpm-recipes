class TokyoCabinet < FPM::Cookery::Recipe
  description 'modern implementation of DBM'

  name     'tokyocabinet'
  version  '1.4.47'
  revision 0
  homepage 'http://fallabs.com/tokyocabinet/'
  source   "http://fallabs.com/tokyocabinet/tokyocabinet-#{version}.tar.gz"
  sha256   'a456193bac4843c0f0caa877b828c8d99dc44495511df10e1b00acf81c538594'

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
