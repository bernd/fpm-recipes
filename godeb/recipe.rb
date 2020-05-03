class Godeb < FPM::Cookery::Recipe
  description 'In-flight .deb packages for Go'

  homepage 'https://github.com/niemeyer/godeb'

  name     'godeb'
  version  '20190905'
  revision '1'

  source 'https://godeb.s3.amazonaws.com/godeb-amd64.tar.gz'
  sha256 'f2b3445dda98b31a32381036bf01c7e82df1a5a151e7e838ca1f0d1fb8e80952'

  def build
  end

  def install
    bin.install 'godeb'
  end
end
