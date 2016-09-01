class Glide < FPM::Cookery::Recipe
  description 'Package Management for Golang'

  homepage 'https://glide.sh/'

  name     'glide'
  version  '0.12.1'
  revision '1'

  source "https://github.com/Masterminds/glide/releases/download/v#{version}/glide-v#{version}-linux-amd64.tar.gz"
  sha256 'dea13aa328f0b6948062935dccb935add1a27394f2af30b007412c9535dbe8fd'

  def build
  end

  def install
    bin.install 'glide'
  end
end
