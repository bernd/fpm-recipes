class Eedis < FPM::Cookery::Recipe
  description 'protocol-compatable Server replacement for Redis, written in Erlang'

  name     'edis'
  version  '0'
  revision 0
  homepage 'http://inaka.github.com/edis/'
  source   'https://github.com/inaka/edis.git', :with => :git

  section      'database'
  config_files '/etc/edis/edis.config'

  def build
    make
  end

  def install
    bin.install 'bin/edis'

    etc('edis').install 'priv/edis.config'
    etc('init.d').install_p 'priv/edis.init.d', 'edis'
  end
end
