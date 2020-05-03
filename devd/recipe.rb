class Devd < FPM::Cookery::Recipe
  description 'A local webserver for developers'

  name 'devd'
  version '0.9'

  source "https://github.com/cortesi/devd/releases/download/v#{version}/devd-#{version}-linux64.tgz"
  sha256 'a8f47477ae479717c6f5ebe80674e6daa4b9f98ef0220cbe28f072130b8f20ad'

  def build
  end

  def install
    bin.install 'devd'
  end
end
