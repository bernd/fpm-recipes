class Snzip < FPM::Cookery::Recipe
  description 'a compression/decompression tool based on snappy'

  name 'snzip'
  version '1.0.4'
  revision '1'

  homepage 'https://github.com/kubo/snzip'
  source "https://bintray.com/artifact/download/kubo/generic/snzip-#{version}.tar.gz"
  sha256 'a45081354715d48ed31899508ebed04a41d4b4a91dca37b79fc3b8ee0c02e25e'

  build_depends 'libsnappy-dev'
  depends 'libsnappy1v5'

  def build
    configure :prefix => prefix
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
