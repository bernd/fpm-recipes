require 'rbconfig'

class Java7JRE < FPM::Cookery::Recipe
  description 'Oracle Java(TM) Runtime (JRE)'

  name     'oracle-java7-jre'
  version  '7.2'
  revision 1
  homepage 'http://java.com/'

  case RbConfig::CONFIG['arch']
  when /x86_64/
    source   'http://download.oracle.com/otn-pub/java/jdk/7u2-b13/jre-7u2-linux-x64.tar.gz'
    sha256   'f2ac504f54e5c0952c07ce4a7718d23c627d514cf1250c0749dcdb6a55f9d53a'
  else
    source   'http://download.oracle.com/otn-pub/java/jdk/7u2-b13/jre-7u2-linux-i586.tar.gz'
    sha256   '00018d12a74a8b65cfbeccbce78223ffad46aadfa13209beeae7d98bb6bc69c3'
  end

  section      'interpreters'
  post_install 'post-install'
  pre_uninstall 'pre-uninstall'

  def build
  end

  def install
    install_dir = prefix('lib/jvm/java-7-oracle-jre')
    install_dir.mkpath
    cp_r Dir['*'], install_dir.to_s
  end
end
