class Ccat < FPM::Cookery::Recipe
  description 'Colorizing cat'

  name     'ccat'
  version  '1.1.0'
  revision '1'

  homepage 'https://github.com/jingweno/ccat'

  source "https://github.com/jingweno/ccat/releases/download/v#{version}/linux-amd64-#{version}.tar.gz"
  sha256 'b38e64cc237dd5e99185371861b52e1ab289e0c659174c3276b11c160de8ee9c'

  def build
  end

  def install
    bin.install 'ccat'
  end
end
