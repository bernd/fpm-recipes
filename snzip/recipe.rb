class Snzip < FPM::Cookery::Recipe
  description 'a compression/decompression tool based on snappy'

  name 'snzip'
  version '1.0.3'
  revision '1'

  homepage 'https://github.com/kubo/snzip'
  source "https://bintray.com/artifact/download/kubo/generic/snzip-#{version}.tar.gz"
  sha256 'c83f1301cb1f1b64a25ef10e5fcfc2f6f66fa092ae833c524cad219c0ef2e990'

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
