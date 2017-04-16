class LiteIDE < FPM::Cookery::Recipe
  description 'A simple, open source, cross-platform Go IDE'

  name     'liteide'
  version  '31'
  revision '1'

  source   "https://github.com/visualfc/liteide/releases/download/x#{version}/liteidex#{version}.linux64-qt4.tar.bz2"
  homepage 'https://github.com/visualfc/liteide'
  sha256   'c4dcb049e0de2ac402c1e244f27e4698d9c6821d63d074fb1ec9696592e041ba'

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
