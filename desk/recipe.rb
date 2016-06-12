class Desk < FPM::Cookery::Recipe
  description 'Lightweight workspace manager for the shell'

  name 'desk'
  version '0.6.0'

  source "https://github.com/jamesob/desk/archive/v#{version}.tar.gz"
  sha256 '620bfba5b285d4d445e3ff9e399864063d7b0e500ef9c70d887fb7b157576c45'

  def build
  end

  def install
    bin.install 'desk'
    etc('bash_completion.d').install 'shell_plugins/bash/desk'
  end
end
