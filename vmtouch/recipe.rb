class VMTouch < FPM::Cookery::Recipe
  description 'the virtual memory toucher'

  name     'vmtouch'
  version  '2012.06.12'
  revision 0
  source   'https://github.com/hoytech/vmtouch.git', :with => :git, :sha => '004b567d'
  homepage 'http://hoytech.com/vmtouch/'

  def build
    make
  end

  def install
    make :install, 'DESTDIR' => destdir

    man8.install 'vmtouch.8'
  end
end
