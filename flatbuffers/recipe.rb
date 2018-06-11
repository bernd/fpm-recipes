class Flatbuffers < FPM::Cookery::Recipe
  description 'efficient cross platform serialization library'

  name     'flatbuffers'
  version  '1.9.0'
  revision '1'

  source   "https://github.com/google/flatbuffers/archive/v#{version}.tar.gz"
  homepage 'https://google.github.io/flatbuffers/'
  sha256   '5ca5491e4260cacae30f1a5786d109230db3f3a6e5a0eb45d0d0608293d247e3'

  build_depends 'cmake'

  def build
    sh 'cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .'
    make
  end

  def install
    make :install, DESTDIR: destdir
  end
end
