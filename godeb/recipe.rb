class Godeb < FPM::Cookery::Recipe
  description 'In-flight .deb packages for Go'

  #homepage 'https://github.com/niemeyer/godeb'
  # Fixed version:
  homepage 'https://github.com/mgit-at/godeb'

  name     'godeb'
  version  '20171116'
  revision '1'

  #source 'https://godeb.s3.amazonaws.com/godeb-amd64.tar.gz'
  # From the fixed version
  source 'https://storage.googleapis.com/godeb/godeb-amd64.tar.gz'
  sha256 'f976fd86698db232379c5d0df6cd01ec0fc95e7826325a9d6ed1c4d96aae2bb3'

  def build
  end

  def install
    bin.install 'godeb'
  end
end
