class Desk < FPM::Cookery::Recipe
  description 'Lightweight workspace manager for the shell'

  name 'desk'
  version '0.5.0'

  source "https://github.com/jamesob/desk/archive/v#{version}.tar.gz"
  sha256 '4ed7a2547fdb3e442e9456be7ca27c41f3fc580d3fdffd69fcfed84260ca2576'

  def build
  end

  def install
    bin.install 'desk'
    etc('bash_completion.d').install 'shell_plugins/bash/desk'
  end
end
