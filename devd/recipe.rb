class Devd < FPM::Cookery::Recipe
  description 'A local webserver for developers'

  name 'devd'
  version '0.6'

  source "https://github.com/cortesi/devd/releases/download/v#{version}/devd-#{version}-linux64.tgz"
  sha256 '93bf7590cc5aa42cf8521795e32992ba479ba2aed825fb6dac2b27d02e293575'

  def build
  end

  def install
    bin.install 'devd'
  end
end
