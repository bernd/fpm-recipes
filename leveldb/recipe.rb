class LevelDB < FPM::Cookery::Recipe
  description 'a fast key-value storage library'

  name     'leveldb'
  version  '1.5.0'
  revision '1'
  homepage 'http://leveldb.googlecode.com/'
  source   "https://leveldb.googlecode.com/files/leveldb-#{version}.tar.gz"
  sha256   'cb73489af84d9d97d3e7d234a2f5e3a0c89ffadb657e7dd9e9047227778e57ba'

  build_depends 'libsnappy-dev'
  depends 'libsnappy1'

  def build
    make
  end

  def install
    lib.install Dir['libleveldb.*']
    include('leveldb').install Dir['include/leveldb/*']
  end
end
