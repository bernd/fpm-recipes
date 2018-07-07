class DockerMachine < FPM::Cookery::Recipe
  description 'Machine management for a container-centric world'

  homepage 'https://docs.docker.com/machine/'

  name 'docker-machine'
  version '0.15.0'
  revision '1'

  source "https://github.com/docker/machine/releases/download/v#{version}/docker-machine-Linux-x86_64"
  sha256 '44c5c62db13b6eb6a9d3e276c1181401c78327ff6303570936ba2cf5d137b7b5'

  def build
  end

  def install
    chmod 0555, 'docker-machine-Linux-x86_64'
    bin.install 'docker-machine-Linux-x86_64', 'docker-machine'
  end
end
