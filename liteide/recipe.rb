class LiteIDE < FPM::Cookery::Recipe
  description 'A simple, open source, cross-platform Go IDE'

  name     'liteide'
  version  '32'
  revision '1'

  source   "https://downloads.sourceforge.net/project/liteide/X#{version}/liteidex#{version}-2.linux64-qt4.tar.bz2"
  homepage 'https://github.com/visualfc/liteide'
  sha256   '446904005452a420b5c4ee8b2f8ae97ce2fcefdde98521c969d602453e211702'

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
