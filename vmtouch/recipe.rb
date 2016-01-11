class VMTouch < FPM::Cookery::Recipe
  description 'the virtual memory toucher'

  name     'vmtouch'
  version  '1.0.2'
  revision '1'

  homepage 'http://hoytech.com/vmtouch/'
  source   "https://github.com/hoytech/vmtouch/archive/vmtouch-#{version}.tar.gz"
  sha256   '48d41e5b805a0fcac46c12feeb4650e4b9def44b75d528d7c66c2f8b3a747c39'

  def build
    make
  end

  def install
    bin.install 'vmtouch'
    man8.install 'vmtouch.8'
  end
end
