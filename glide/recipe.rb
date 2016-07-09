class Glide < FPM::Cookery::Recipe
  description 'Package Management for Golang'

  homepage 'https://glide.sh/'

  name     'glide'
  version  '0.11.0'
  revision '1'

  source "https://github.com/Masterminds/glide/releases/download/v#{version}/glide-v#{version}-linux-amd64.tar.gz"
  sha256 '32daf53dc8c06bd2e5de319072a16678684fdba3540f967e672252b0995bc8be'

  def build
  end

  def install
    bin.install 'glide'
  end
end
