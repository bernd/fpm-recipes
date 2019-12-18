class Curlie < FPM::Cookery::Recipe
  description 'The power of curl, the ease of use of httpie.'

  name 'curlie'
  version '1.3.1'
  revision '1'

  homepage 'https://curlie.io/'
  source "https://github.com/rs/curlie/releases/download/v#{version}/curlie_#{version}_linux_amd64.tar.gz"
  sha256 '5536b0643c908066bf40e87708d4c6a534dcf8385df7dc15fa34ac06538846a1'

  def build
  end

  def install
    bin.install 'curlie'
  end
end
