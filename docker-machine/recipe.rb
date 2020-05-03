class DockerMachine < FPM::Cookery::Recipe
  description 'Machine management for a container-centric world'

  homepage 'https://docs.docker.com/machine/'

  name 'docker-machine'
  version '0.16.2'
  revision '1'

  source "https://github.com/docker/machine/releases/download/v#{version}/docker-machine-Linux-x86_64"
  sha256 'a7f7cbb842752b12123c5a5447d8039bf8dccf62ec2328853583e68eb4ffb097'

  def build
  end

  def install
    chmod 0555, 'docker-machine-Linux-x86_64'
    bin.install 'docker-machine-Linux-x86_64', 'docker-machine'
  end
end
