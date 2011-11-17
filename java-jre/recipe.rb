require 'rbconfig'

class Java7JRE < FPM::Cookery::Recipe
  description 'Oracle Java(TM) Runtime (JRE)'

  name     'oracle-java7-jre'
  version  '7.1'
  revision 1
  homepage 'http://java.com/'
  sha256   '76bfa6d7b80e077a399bf69fbc8e031ee8f4094be0b6d1e30e247e7341ae2d40'

  case RbConfig::CONFIG['arch']
  when /x86_64/
    source   'http://oracleotn.rd.llnwd.net/otn-pub/java/jdk/7u1-b08/jre-7u1-linux-x64.tar.gz'
  else
    source   'http://oracleotn.rd.llnwd.net/otn-pub/java/jdk/7u1-b08/jre-7u1-linux-i586.tar.gz'
  end

  section      'interpreters'
  post_install 'post-install'
  pre_uninstall 'pre-uninstall'

  def build
  end

  def install
    install_dir = prefix('lib/jvm/java-7-oracle-7u1')
    install_dir.mkpath
    cp_r Dir['*'], install_dir.to_s
  end
end
