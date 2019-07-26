class DockerMachine < FPM::Cookery::Recipe
  description 'Machine management for a container-centric world'

  homepage 'https://docs.docker.com/machine/'

  name 'docker-machine'
  version '0.16.1'
  revision '1'

  source "https://github.com/docker/machine/releases/download/v#{version}/docker-machine-Linux-x86_64"
  sha256 '44a008c14549156222b314b1448c22ef255b446419fcf96570f3f288dff318a9'

  def build
  end

  def install
    chmod 0555, 'docker-machine-Linux-x86_64'
    bin.install 'docker-machine-Linux-x86_64', 'docker-machine'
  end
end
