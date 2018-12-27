class Flatbuffers < FPM::Cookery::Recipe
  description 'efficient cross platform serialization library'

  name     'flatbuffers'
  version  '1.10.0'
  revision '1'

  source   "https://github.com/google/flatbuffers/archive/v#{version}.tar.gz"
  homepage 'https://google.github.io/flatbuffers/'
  sha256   '3714e3db8c51e43028e10ad7adffb9a36fc4aa5b1a363c2d0c4303dd1be59a7c'

  build_depends 'cmake'

  def build
    sh 'cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .'
    make
  end

  def install
    make :install, DESTDIR: destdir
  end
end
