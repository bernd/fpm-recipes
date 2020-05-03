class Godeb < FPM::Cookery::Recipe
  description 'A simple zero-config tool to make locally trusted development certificates with any names you\'d like.'

  name     'mkcert'
  version  '1.4.1'
  revision '1'

  homepage 'https://mkcert.dev'
  source "https://github.com/FiloSottile/mkcert/releases/download/v#{version}/mkcert-v#{version}-linux-amd64"
  sha256 'e116543bfabb4d88010dda8a551a5d01abbdf9b4f2c949c044b862365038f632'

  def build
  end

  def install
    chmod 0555, "mkcert-v#{version}-linux-amd64"
    bin.install "mkcert-v#{version}-linux-amd64", 'mkcert'
  end
end
