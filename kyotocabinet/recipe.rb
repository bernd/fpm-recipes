class KyotoCabinet < FPM::Cookery::Recipe
  description 'straightforward implementation of DBM'

  name     'kyotocabinet'
  version  '1.2.72'
  revision 0
  homepage 'http://fallabs.com/kyotocabinet/'
  source   "http://fallabs.com/kyotocabinet/pkg/kyotocabinet-#{version}.tar.gz"
  sha256   'bbdc18e06440e7ad909202410069f408b02449a30c265793190792f1a6ebb2c7'

  section       'database'
  build_depends 'zlib1g-dev'
  depends       'zlib1g'

  def build
    configure :prefix => prefix
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
