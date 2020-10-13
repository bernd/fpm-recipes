class DockerCompose < FPM::Cookery::Recipe
  description 'a tool for defining and running multi-container Docker applications'

  homepage 'https://docs.docker.com/compose/'

  name 'docker-compose'
  version '1.27.4'
  revision '1'

  source "https://github.com/docker/compose/releases/download/#{version}/docker-compose-Linux-x86_64"
  sha256 '04216d65ce0cd3c27223eab035abfeb20a8bef20259398e3b9d9aa8de633286d'

  def build
  end

  def install
    chmod 0555, 'docker-compose-Linux-x86_64'
    bin.install 'docker-compose-Linux-x86_64', 'docker-compose'
  end
end
