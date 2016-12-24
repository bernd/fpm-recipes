class Noti < FPM::Cookery::Recipe
  description 'Trigger notifications when a process completes'

  name     'noti'
  version  '2.5.0'
  revision '1'

  source "https://github.com/variadico/noti/releases/download/v#{version}/noti#{version}.linux-amd64.tar.gz"
  sha256 'ba8941a0d0838425b82ffc89698d92e94b13ddbe13f1270da57eb76ae4b262ee'

  def build
  end

  def install
    bin.install 'noti'
  end
end
