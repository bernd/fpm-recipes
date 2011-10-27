class Freemind < FPM::Cookery::Recipe
  description 'free mind-mapping software written in Java'

  name     'freemind'
  version  '0.9.0'
  revision 0
  homepage 'http://freemind.sourceforge.net/'
  source   "http://dfn.dl.sourceforge.net/project/freemind/freemind/#{version}/freemind-bin-#{version}.zip"
  sha256   'd710f8adc580cd0e9ca95efc28a80904bd0983b8a5badac344922b8505fbb2b5'
  arch     'all'

  platforms [:debian, :ubuntu] do
    depends  'openjdk-6-jre | java6-runtime'
  end

  platforms [:fedora, :redhat, :centos] do
    depends 'java-1.6.0-openjdk'
  end

  def build
    rm Dir['*.{bat,exe}'], :verbose => true
    rm_rf 'doc', :verbose => true
  end

  def install
    prefix("freemind-#{version}").install Dir['*']

    bin.mkdir
    File.open(bin('freemind'), 'w') do |f|
      with_trueprefix do
        f.write <<-__SHELL
#!/bin/bash
exec #{prefix("freemind-#{version}/freemind.sh")} "$@"
        __SHELL
      end
    end
    chmod 0555, [bin('freemind'), prefix("freemind-#{version}/freemind.sh")]
  end
end
