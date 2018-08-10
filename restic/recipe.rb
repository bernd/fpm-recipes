class Restic < FPM::Cookery::Recipe
  description 'Fast, secure, efficient backup program'

  homepage 'https://restic.github.io/'

  name     'restic'
  version  '0.9.2'
  revision '1'

  source "https://github.com/restic/restic/releases/download/v#{version}/restic_#{version}_linux_amd64.bz2"
  sha256 '1ad8a76a9f966da5f7a319c49a6db071a60ebaa24d69e6d86d53d6f2bcaf11ed'

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
