class Glide < FPM::Cookery::Recipe
  description 'Package Management for Golang'

  homepage 'https://glide.sh/'

  name     'glide'
  version  '0.10.2'
  revision '1'

  source "https://github.com/Masterminds/glide/releases/download/#{version}/glide-#{version}-linux-amd64.tar.gz"
  sha256 '0eedb7f47ff4d184ab334f8dd8be843f8e98774b6ccd92cbe71a6e6c7a3d5da8'

  def build
  end

  def install
    bin.install 'glide'
  end
end
