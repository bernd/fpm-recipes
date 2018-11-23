class DockerCompose < FPM::Cookery::Recipe
  description 'a tool for defining and running multi-container Docker applications'

  homepage 'https://docs.docker.com/compose/'

  name 'docker-compose'
  version '1.23.1'
  revision '1'

  source "https://github.com/docker/compose/releases/download/#{version}/docker-compose-Linux-x86_64"
  sha256 'c176543737b8aea762022245f0f4d58781d3cb1b072bc14f3f8e5bb96f90f1a2'

  def build
  end

  def install
    chmod 0555, 'docker-compose-Linux-x86_64'
    bin.install 'docker-compose-Linux-x86_64', 'docker-compose'
  end
end
