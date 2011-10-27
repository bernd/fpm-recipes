class ZeroMQ < FPM::Cookery::Recipe
  description 'The Intelligent Transport Layer'

  name     'zeromq'
  version  '2.1.10'
  homepage 'http://www.zeromq.org'
  source   'http://download.zeromq.org/zeromq-2.1.10.tar.gz'
  sha256   'c6727ee334b572b25269c7fed24a926cde236b3655e22f21c057aad4df5a4b79'

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
