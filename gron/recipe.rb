class Gron < FPM::Cookery::Recipe
  description 'make JSON greppable'

  homepage 'https://github.com/tomnomnom/gron'

  name     'gron'
  version  '0.5.1'
  revision '1'

  source "https://github.com/tomnomnom/gron/releases/download/v#{version}/gron-linux-amd64-#{version}.tgz"
  sha256 'f874724398de74f14f047366c3e2cb1be690dbd2000b22b1b1f515d78fce3982'

  def build
  end

  def install
    bin.install 'gron'
  end
end
