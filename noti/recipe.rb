class Noti < FPM::Cookery::Recipe
  description 'Trigger notifications when a process completes'

  name     'noti'
  version  '2.2.2'
  revision '1'

  source "https://github.com/variadico/noti/releases/download/v#{version}/noti#{version}.linux-amd64.tar.gz"
  sha256 '544178e74c0dc42434527db1d530f07440f4d2ff6a0e36584d311bf17629508e'

  def build
  end

  def install
    bin.install 'noti'
  end
end
