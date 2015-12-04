class Desk < FPM::Cookery::Recipe
  description 'Lightweight workspace manager for the shell'

  name 'desk'
  version '20151203.1'

  source 'https://github.com/jamesob/desk', :with => :git, :ref => '3463b8a'

  def build
  end

  def install
    bin.install 'desk'
    etc('bash_completion.d').install 'shell_plugins/bash/desk'
  end
end
