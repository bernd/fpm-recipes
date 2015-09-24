class Lein < FPM::Cookery::Recipe
  description 'Leiningen is for automating Clojure projects without setting your hair on fire.'

  name     'Leiningen'
  version  '2.1.3'
  homepage 'http://github.com/technomancy/leiningen'
  source   "https://leiningen.s3.amazonaws.com/downloads/leiningen-#{version}-standalone.jar"

  section 'universe/java'
  depends 'java6-runtime'

  def build
  end

  def install
    opt('lein/self-installs/').install builddir("leiningen-#{version}-standalone.jar/leiningen-#{version}-standalone.jar")
    bin.install workdir('lein')
  end
end
