class GRV < FPM::Cookery::Recipe
  description 'Terminal interface for viewing git repositories'

  homepage 'https://github.com/rgburke/grv'

  name     'grv'
  version  '0.1.2'
  revision '1'

  source "https://github.com/rgburke/grv/releases/download/v#{version}/grv_v#{version}_linux64"
  sha256 'c23dc24f52fb8a937cd67b18ae0637758e2a84f67473418bc7901db107b70659'

  def build
  end

  def install
    chmod 0555, "grv_v#{version}_linux64"
    bin.install "grv_v#{version}_linux64", 'grv'
  end
end
