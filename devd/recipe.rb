class Devd < FPM::Cookery::Recipe
  description 'A local webserver for developers'

  name 'devd'
  version '0.5'

  source "https://github.com/cortesi/devd/releases/download/v#{version}/devd-#{version}-linux64.tgz"
  sha256 'cb006410cec4b3e580d80ad67a7442add1dbe818448284d0fc0e72f9597d48e5'

  def build
  end

  def install
    bin.install 'devd'
  end
end
