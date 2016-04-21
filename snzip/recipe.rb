class Snzip < FPM::Cookery::Recipe
  description 'snappy cli'

  name 'snzip'
  version '1.0.3'

  source "https://bintray.com/artifact/download/kubo/generic/snzip-#{version}.tar.gz"
  sha256 'c83f1301cb1f1b64a25ef10e5fcfc2f6f66fa092ae833c524cad219c0ef2e990'

  def build
    configure :prefix => prefix
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
