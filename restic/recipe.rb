class Restic < FPM::Cookery::Recipe
  description 'Fast, secure, efficient backup program'

  homepage 'https://restic.github.io/'

  name     'restic'
  version  '0.9.3'
  revision '1'

  source "https://github.com/restic/restic/releases/download/v#{version}/restic_#{version}_linux_amd64.bz2"
  sha256 '3c882962fc07f611a6147ada99c9909770d3e519210fd483cde9609c6bdd900c'

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
