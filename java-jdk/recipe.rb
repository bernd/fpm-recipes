require 'rbconfig'

class Java7JDK < FPM::Cookery::Recipe
  description 'Oracle Java(TM) Development Kit (JDK)'

  name     'oracle-java7-jdk'
  version  '7.2'
  revision 0
  homepage 'http://java.com/'

  case RbConfig::CONFIG['arch']
  when /x86_64/
    source   'http://download.oracle.com/otn-pub/java/jdk/7u2-b13/jdk-7u2-linux-x64.tar.gz'
    sha256   '411a204122c5e45876d6edae1a031b718c01e6175833740b406e8aafc37bc82d'
  else
    source   'http://download.oracle.com/otn-pub/java/jdk/7u2-b13/jdk-7u2-linux-i586.tar.gz'
    sha256   '74faad48fef2c368276dbd1fd6c02520b0e9ebdcb1621916c1af345fc3ba65d1'
  end

  section      'interpreters'
  post_install 'post-install'
  pre_uninstall 'pre-uninstall'

  def build
  end

  def install
    install_dir = prefix('lib/jvm/java-7-oracle-jdk')
    install_dir.mkpath
    cp_r Dir['*'], install_dir.to_s
  end
end
