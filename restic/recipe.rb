class Restic < FPM::Cookery::Recipe
  description 'Fast, secure, efficient backup program'

  homepage 'https://restic.github.io/'

  name     'restic'
  version  '0.9.4'
  revision '1'

  source "https://github.com/restic/restic/releases/download/v#{version}/restic_#{version}_linux_amd64.bz2"
  sha256 '0440b6c1c17b58563c729fa133896199406f29356329ca5d048e4d9dcbf7d6fe'

  def extract
    extracted_source = "#{builddir}/restic-#{version}"
    mkdir_p extracted_source
    sh "bzip2 -d -k -c #{cachedir}/restic_#{version}_linux_amd64.bz2 > #{extracted_source}/restic"
    chmod 0555, "#{extracted_source}/restic"
    extracted_source
  end

  def build
  end

  def install
    bin.install 'restic'
  end
end
