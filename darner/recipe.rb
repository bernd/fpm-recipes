class Darner < FPM::Cookery::Recipe
  description 'a very simple message queue server'

  name 'darner'
  version '0.0.df419f3'
  source 'https://github.com/wavii/darner.git', :with => :git, :ref => 'df419f3'

  build_depends 'cmake', 'libboost-all-dev', 'leveldb'
  depends 'leveldb', 'libboost-filesystem1.46.1', 'libboost-program-options1.46.1',
          'libboost-system1.46.1', 'libboost-thread1.46.1', 'libsnappy1'

  def build
    safesystem 'cmake .'
    make
  end

  def install
    bin.install 'darner'
    bin.install 'db', 'darner-bench'
  end
end
