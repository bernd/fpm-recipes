class Gron < FPM::Cookery::Recipe
  description 'make JSON greppable'

  homepage 'https://github.com/tomnomnom/gron'

  name     'gron'
  version  '0.6.0'
  revision '1'

  source "https://github.com/tomnomnom/gron/releases/download/v#{version}/gron-linux-amd64-#{version}.tgz"
  sha256 '891470b44d7faef49683dd11b11a1f296324118e869a76e3fae61cf6b35c6b74'

  def build
  end

  def install
    bin.install 'gron'
  end
end
