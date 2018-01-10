class Godeb < FPM::Cookery::Recipe
  description 'In-flight .deb packages for Go'

  homepage 'https://github.com/niemeyer/godeb'

  name     'godeb'
  version  '20180109'
  revision '1'

  source 'https://godeb.s3.amazonaws.com/godeb-amd64.tar.gz'
  sha256 '4e73d1621495cc2b909893b9d31d74caec9110c0000218d123d8515f87e9c3ff'

  def build
  end

  def install
    bin.install 'godeb'
  end
end
