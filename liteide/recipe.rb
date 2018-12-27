class LiteIDE < FPM::Cookery::Recipe
  description 'A simple, open source, cross-platform Go IDE'

  name     'liteide'
  version  '35.3'
  revision '1'

  source   "https://github.com/visualfc/liteide/releases/download/x#{version}/liteidex#{version}.linux64-qt5.5.1.tar.gz"
  homepage 'https://github.com/visualfc/liteide'
  sha256   'e19a918b805eac8ec0c3fd3177b5e1bff11c7793d3ccb04883fc352f9c3b0b42'

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
