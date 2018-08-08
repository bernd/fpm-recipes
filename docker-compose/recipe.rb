class DockerCompose < FPM::Cookery::Recipe
  description 'a tool for defining and running multi-container Docker applications'

  homepage 'https://docs.docker.com/compose/'

  name 'docker-compose'
  version '1.22.0'
  revision '1'

  source "https://github.com/docker/compose/releases/download/#{version}/docker-compose-Linux-x86_64"
  sha256 'f679a24b93f291c3bffaff340467494f388c0c251649d640e661d509db9d57e9'

  def build
  end

  def install
    chmod 0555, 'docker-compose-Linux-x86_64'
    bin.install 'docker-compose-Linux-x86_64', 'docker-compose'
  end
end
