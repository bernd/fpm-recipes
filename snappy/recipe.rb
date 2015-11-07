class Snappy < FPM::Cookery::Recipe
  description 'compression/decompression library'

  name     'snappy'
  version  '1.1.3'
  revision '1'
  homepage 'http://google.github.io/snappy/'
  source   "https://github.com/google/snappy/releases/download/#{version}/snappy-#{version}.tar.gz"
  sha256   '2f1e82adf0868c9e26a5a7a3115111b6da7e432ddbac268a7ca2fae2a247eef3'

  build_depends 'pkg-config', 'zlib1g-dev', 'liblzo2-dev'

  def build
    configure :prefix => prefix
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
