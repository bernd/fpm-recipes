class Flatbuffers < FPM::Cookery::Recipe
  description 'efficient cross platform serialization library'

  name     'flatbuffers'
  version  '1.5.0'
  revision '1'

  source   "https://github.com/google/flatbuffers/archive/v#{version}.tar.gz"
  homepage 'https://google.github.io/flatbuffers/'
  sha256   '85362cb54042e96329cb65396a5b589789b3d42e4ed7c2debddb7a2300a05f41'

  build_depends 'cmake'

  def build
    sh 'cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .'
    make
  end

  def install
    make :install, DESTDIR: destdir
  end
end
