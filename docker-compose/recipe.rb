class DockerCompose < FPM::Cookery::Recipe
  description 'a tool for defining and running multi-container Docker applications'

  homepage 'https://docs.docker.com/compose/'

  name 'docker-compose'
  version '1.25.5'
  revision '1'

  source "https://github.com/docker/compose/releases/download/#{version}/docker-compose-Linux-x86_64"
  sha256 '1cb7ecccc17c8d5f1888f9e2b3211b07e35c86d0010a6c0f711fe65ef5b69528'

  def build
  end

  def install
    chmod 0555, 'docker-compose-Linux-x86_64'
    bin.install 'docker-compose-Linux-x86_64', 'docker-compose'
  end
end
