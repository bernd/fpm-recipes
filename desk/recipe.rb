class Desk < FPM::Cookery::Recipe
  description 'Lightweight workspace manager for the shell'

  name 'desk'
  version '0.4.0'

  source "https://github.com/jamesob/desk/archive/v#{version}.tar.gz"
  sha256 '1589cb02d1104b4008d9d1a1ee1a315d0bf5a8e8d6f8408d9f60201a4f04c896'

  def build
  end

  def install
    bin.install 'desk'
    etc('bash_completion.d').install 'shell_plugins/bash/desk'
  end
end
