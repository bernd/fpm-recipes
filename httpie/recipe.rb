class Httpie < FPM::Cookery::VirtualenvRecipe
  description 'user-friendly cURL replacement featuring intuitive UI, JSON support, syntax highlighting'

  name     'httpie'
  version  '0.9.3'
  revision '1'

  homepage   'http://httpie.org'

  build_depends 'python-virtualenv', 'python-setuptools'

  virtualenv_fix_name         false
  virtualenv_install_location '/opt'

  post_install   'postinst'
  pre_uninstall 'prerm'
end
