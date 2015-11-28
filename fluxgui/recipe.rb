class Fluxgui < FPM::Cookery::Recipe
  description 'Better lightning for Ubuntu'

  name     'fluxgui'
  version  '20140503.1'
  source   'https://github.com/Kilian/f.lux-indicator-applet', :with => :git, :ref => '7fc8de3'
  homepage 'https://github.com/Kilian/f.lux-indicator-applet'

  def build
  end

  def install
    sh "python setup.py install --prefix /usr --root #{destdir} --install-lib /usr/lib/python2.7/dist-packages"
  end
end
