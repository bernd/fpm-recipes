class Noti < FPM::Cookery::Recipe
  description 'Trigger notifications when a process completes'

  name     'noti'
  version  '3.1.0'
  revision '1'

  source "https://github.com/variadico/noti/releases/download/#{version}/noti#{version}.linux-amd64.tar.gz"
  sha256 '959410e065ed36554c8c2e2b94c803de5dc8c149b2e88c220b814cb31b23f684'

  def build
  end

  def install
    bin.install 'noti'
  end
end
