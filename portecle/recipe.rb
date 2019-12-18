class Portecle < FPM::Cookery::Recipe
  description 'user friendly GUI application for creating, managing and examining keystores'

  name 'portecle'
  version '1.11'
  revision '0'

  homepage 'https://github.com/scop/portecle'
  source "https://github.com/scop/portecle/releases/download/v#{version}/portecle-#{version}.zip"
  sha256 '75da1d5552979f3310adf4c93f90da00b56dfa12424ab52047c0c937ab6709bb'

  arch 'all'

  def build
  end

  def install
    Dir.chdir("portecle-#{version}") do
      %w(16x16 32x32 48x48 64x64 96x96 128x128 192x192 256x256 512x512).each do |size|
        share("icons/hicolor/#{size}/apps").install Dir["icons/#{size}/*"]
      end
      rm_rf 'icons'
      share('applications').install 'net.sf.portecle.desktop'
      share('appdata').install 'net.sf.portecle.appdata.xml'
      share('portecle').install Dir['*']
      bin.install workdir('portecle.sh'), 'portecle'

      chmod 0555, [bin('portecle')]
    end
  end
end
