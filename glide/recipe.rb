class Glide < FPM::Cookery::Recipe
  description 'Package Management for Golang'

  homepage 'https://glide.sh/'

  name     'glide'
  version  '0.13.1'
  revision '1'

  source "https://github.com/Masterminds/glide/releases/download/v#{version}/glide-v#{version}-linux-amd64.tar.gz"
  sha256 'c403933503ea40308ecfadcff581ff0dc3190c57958808bb9eed016f13f6f32c'

  def build
  end

  def install
    bin.install 'glide'
  end
end
