class Darner < FPM::Cookery::Recipe
  description 'a very simple message queue server'

  name 'darner'
  version '0.2.0'
  source 'https://github.com/wavii/darner.git', :with => :git, :tag =>"v#{version}"

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
