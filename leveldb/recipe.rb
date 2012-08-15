class LevelDB < FPM::Cookery::Recipe
  description 'a fast key-value storage library'

  name     'leveldb'
  version  '1.5.0'
  homepage 'http://leveldb.googlecode.com/'
  source   "https://leveldb.googlecode.com/files/leveldb-#{version}.tar.gz"

  build_depends 'libsnappy-dev'
  depends 'libsnappy1'

  def build
    make
  end

  def install
    lib.install Dir['libleveldb.*']
  end
end
