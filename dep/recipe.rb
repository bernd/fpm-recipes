class Dep < FPM::Cookery::Recipe
  description 'Go dependency management tool'

  homepage 'https://github.com/golang/dep'

  name     'dep'
  version  '0.4.1'
  revision '1'

  source "https://github.com/golang/dep/releases/download/v#{version}/dep-linux-amd64"
  sha256 '31144e465e52ffbc0035248a10ddea61a09bf28b00784fd3fdd9882c8cbb2315'

  def build
  end

  def install
    chmod 0555, 'dep-linux-amd64'
    bin.install 'dep-linux-amd64', 'dep'
  end
end
