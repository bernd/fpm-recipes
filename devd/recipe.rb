class Devd < FPM::Cookery::Recipe
  description 'A local webserver for developers'

  name 'devd'
  version '0.7'

  source "https://github.com/cortesi/devd/releases/download/v#{version}/devd-#{version}-linux64.tgz"
  sha256 '3bf919c081f46d4a0e1e5c8f35d943b949db39811f4b99177d90465ebb17fd4c'

  def build
  end

  def install
    bin.install 'devd'
  end
end
