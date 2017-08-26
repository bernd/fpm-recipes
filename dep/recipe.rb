class Dep < FPM::Cookery::Recipe
  description 'Go dependency management tool'

  homepage 'https://github.com/golang/dep'

  name     'dep'
  version  '0.3.0'
  revision '1'

  source "https://github.com/golang/dep/releases/download/v#{version}/dep-linux-amd64.zip"
  sha256 '96c191251164b1404332793fb7d1e5d8de2641706b128bf8d65772363758f364'

  def build
  end

  def install
    bin.install 'dep'
  end
end
