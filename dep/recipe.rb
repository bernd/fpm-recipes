class Dep < FPM::Cookery::Recipe
  description 'Go dependency management tool'

  homepage 'https://github.com/golang/dep'

  name     'dep'
  version  '0.5.0'
  revision '1'

  source "https://github.com/golang/dep/releases/download/v#{version}/dep-linux-amd64"
  sha256 '287b08291e14f1fae8ba44374b26a2b12eb941af3497ed0ca649253e21ba2f83'

  def build
  end

  def install
    chmod 0555, 'dep-linux-amd64'
    bin.install 'dep-linux-amd64', 'dep'
  end
end
