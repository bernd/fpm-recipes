class Devd < FPM::Cookery::Recipe
  description 'A local webserver for developers'

  name 'devd'
  version '0.8'

  source "https://github.com/cortesi/devd/releases/download/v#{version}/devd-#{version}-linux64.tgz"
  sha256 '0b56d344a8d3a58726a395e8ccca3d9ef92c63bb82eea11266329190b81d78aa'

  def build
  end

  def install
    bin.install 'devd'
  end
end
