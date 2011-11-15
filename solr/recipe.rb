# Adapted from the formula in brew2deb.

class Solr < FPM::Cookery::Recipe
  description 'Enterprise search platform'

  name     'solr'
  version  '3.4.0'
  homepage 'http://lucene.apache.org/solr/'
  source   "http://www.eng.lsu.edu/mirrors/apache/lucene/solr/#{version}/apache-solr-#{version}.tgz"
  md5      '949b145669a6c9517b2fef32b58f679e'

  section 'database'

  build_depends 'sun-java6-jdk'
  depends       'sun-java6-jre'

  def build
    warfile = File.expand_path('example/webapps/solr.war')

    FileUtils.mkdir_p 'war'
    Dir.chdir 'war' do
      system 'jar', 'xvf', warfile
    end
  end

  def install
    solr_home = share('solr')
    (solr_home/'lib').install Dir['dist/*.{war,jar}']

    Dir.chdir('example') do
      (solr_home/'jetty').install Dir['{start.jar,etc,lib,webapps}']
    end

    lucene_home = share('lucene')
    share('lucene/lib').install Dir['war/WEB-INF/lib/lucene-*.jar']

    bin.install Dir[workdir('solr*')]

    var('log/solr').mkpath
  end
end
