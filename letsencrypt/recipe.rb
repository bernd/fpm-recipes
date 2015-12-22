class Letsencrypt < FPM::Cookery::VirtualenvRecipe
  description "Let's Encrypt client"

  name     'letsencrypt'
  version  '0.1.1'
  revision '1'

  homepage   'https://letsencrypt.org'

  build_depends 'python-virtualenv', 'python-setuptools', 'libpython2.7-dev', 'libffi-dev', 'libssl-dev'
  depends 'dialog'

  virtualenv_fix_name         false
  virtualenv_install_location '/opt'

  def after_dependency_installation
    sh 'pip install virtualenv-tools'
  end
end
