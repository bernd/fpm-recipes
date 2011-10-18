class ZeroMQ < FPM::Cookery::Recipe
  description 'The Intelligent Transport Layer'

  name     'zeromq'
  version  '2.1.9'
  homepage 'http://www.zeromq.org'
  source   'http://download.zeromq.org/zeromq-2.1.9.tar.gz'
  sha256   'f3542f756687e622beef3a75c8e027fe2d95d4654350cbca4c070ffc58d9ace0'

  conflicts 'libzmq0', 'zeromq-bin'
  replaces  'libzmq0', 'zeromq-bin'

  def build
    configure :prefix => prefix
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
