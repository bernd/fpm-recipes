class Glide < FPM::Cookery::Recipe
  description 'Package Management for Golang'

  homepage 'https://glide.sh/'

  name     'glide'
  version  '0.12.3'
  revision '1'

  source "https://github.com/Masterminds/glide/releases/download/v#{version}/glide-v#{version}-linux-amd64.tar.gz"
  sha256 '0e2be5e863464610ebc420443ccfab15cdfdf1c4ab63b5eb25d1216900a75109'

  def build
  end

  def install
    bin.install 'glide'
  end
end
