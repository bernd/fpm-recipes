class Portecle < FPM::Cookery::Recipe
  description 'user friendly GUI application for creating, managing and examining keystores'

  name 'portecle'
  version '1.10'

  source "http://downloads.sourceforge.net/project/portecle/portecle/1.10/portecle-1.10.zip"
  sha256 '352b97d114e52d4ef5452e887a058a376e347ab36159c2e594efee4b1b5b2e01'

  arch 'all'

  def build
    Dir.chdir("portecle-#{version}") do
      patch(workdir('portecle.desktop.patch'))
    end
  end

  def install
    Dir.chdir("portecle-#{version}") do
      share('icons/hicolor/32x32/apps').install 'portecle.png'
      share('applications').install 'portecle.desktop'
      share('portecle').install Dir['*']
      bin.install workdir('portecle.sh'), 'portecle'

      chmod 0555, [bin('portecle')]
    end
  end
end
