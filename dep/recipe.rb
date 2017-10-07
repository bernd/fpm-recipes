class Dep < FPM::Cookery::Recipe
  description 'Go dependency management tool'

  homepage 'https://github.com/golang/dep'

  name     'dep'
  version  '0.3.1'
  revision '1'

  source "https://github.com/golang/dep/releases/download/v#{version}/dep-linux-amd64"
  sha256 '408b970c0acacad309d350fc46d718e4a8885b588eca71f4d73e5d6c521ef944'

  def build
  end

  def install
    chmod 0555, 'dep-linux-amd64'
    bin.install 'dep-linux-amd64', 'dep'
  end
end
