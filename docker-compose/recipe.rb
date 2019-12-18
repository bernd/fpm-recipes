class DockerCompose < FPM::Cookery::Recipe
  description 'a tool for defining and running multi-container Docker applications'

  homepage 'https://docs.docker.com/compose/'

  name 'docker-compose'
  version '1.25.0'
  revision '1'

  source "https://github.com/docker/compose/releases/download/#{version}/docker-compose-Linux-x86_64"
  sha256 'bee6460f96339d5d978bb63d17943f773e1a140242dfa6c941d5e020a302c91b'

  def build
  end

  def install
    chmod 0555, 'docker-compose-Linux-x86_64'
    bin.install 'docker-compose-Linux-x86_64', 'docker-compose'
  end
end
