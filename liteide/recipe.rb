class LiteIDE < FPM::Cookery::Recipe
  description 'A simple, open source, cross-platform Go IDE'

  name     'liteide'
  version  '30.2'
  revision '1'

  source   "https://freefr.dl.sourceforge.net/project/liteide/X#{version}/liteidex#{version}.linux64-qt4.tar.bz2"
  homepage 'https://github.com/visualfc/liteide'
  sha256   '1046336e5c3b22efe41722d45146b005f768fc9cfd46901899d664fafd0b913e'

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
    bin.install 'liteide.sh', 'liteide'
  end
end
