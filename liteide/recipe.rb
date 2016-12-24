class LiteIDE < FPM::Cookery::Recipe
  description 'A simple, open source, cross-platform Go IDE'

  name     'liteide'
  version  '30.3'
  revision '1'

  source   "https://freefr.dl.sourceforge.net/project/liteide/X#{version}/liteidex#{version}.linux64-qt4.tar.bz2"
  homepage 'https://github.com/visualfc/liteide'
  sha256   '7d31d32cf2fd70344d6b6cc69555879de0dde4decc1d420a7fd3904f8da7f41c'

  def build
    File.open('liteide.sh', 'w', 0755) do |file|
      file.write <<-__EOF
        #!/bin/bash

        exec /usr/share/liteide/bin/liteide
      __EOF
    end
  end

  def install
    share('liteide').install Dir['*']
    share('applications').install workdir('liteide.desktop')
    bin.install 'liteide.sh', 'liteide'
  end
end
