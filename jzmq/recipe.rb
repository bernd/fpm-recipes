class Jzmq < FPM::Cookery::Recipe
  description 'Java bindings for jzmq'

  name     'zeromq'
  version  '1.0.0'
  homepage 'https://github.com/zeromq/jzmq'
  source   'git://github.com/zeromq/jzmq.git', :with => :git, :tag =>'HEAD'

  conflicts 'jzmq'
  replaces  'jzmq'

  def build
   zeromq = "#{File.expand_path("../../../",Dir.pwd)}/zeromq/tmp-dest/usr"
   safesystem('./autogen.sh', "--with-zeromq=#{zeromq}/include")
   configure :prefix => prefix, :with_zeromq => zeromq 
   make :with_zeromq => zeromq
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
