class DockerMachine < FPM::Cookery::Recipe
  description 'Machine management for a container-centric world'

  homepage 'https://docs.docker.com/machine/'

  name 'docker-machine'
  version '0.16.0'
  revision '1'

  source "https://github.com/docker/machine/releases/download/v#{version}/docker-machine-Linux-x86_64"
  sha256 '3d2cae5f66df636116153c8a96310c0cdef0060b1ecfe86116cec825bbf393d8'

  def build
  end

  def install
    chmod 0555, 'docker-machine-Linux-x86_64'
    bin.install 'docker-machine-Linux-x86_64', 'docker-machine'
  end
end
