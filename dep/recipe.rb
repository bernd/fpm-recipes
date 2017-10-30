class Dep < FPM::Cookery::Recipe
  description 'Go dependency management tool'

  homepage 'https://github.com/golang/dep'

  name     'dep'
  version  '0.3.2'
  revision '1'

  source "https://github.com/golang/dep/releases/download/v#{version}/dep-linux-amd64"
  sha256 '322152b8b50b26e5e3a7f6ebaeb75d9c11a747e64bbfd0d8bb1f4d89a031c2b5'

  def build
  end

  def install
    chmod 0555, 'dep-linux-amd64'
    bin.install 'dep-linux-amd64', 'dep'
  end
end
