class Elasticsearch < FPM::Cookery::Recipe
  description 'Open Source, Distributed, RESTful Search Engine'

  name     'elasticsearch'
  version  '0.19.1'
  revision 0
  homepage 'http://www.elasticsearch.org/'
  source   "https://github.com/downloads/elasticsearch/elasticsearch/elasticsearch-#{version}.tar.gz"
  sha256   '099c234a22b50ee11633650789fc415cba67f11960cfe6080d49dcd8e2337352'
  arch     'all'

  java = [
    'openjdk-7-jdk', 'openjdk-7-jre', 'openjdk-7-jre-headless',
    'openjdk-6-jdk', 'openjdk-6-jre', 'openjdk-6-jre-headless'
  ]

  depends java.join(' | ')

  section      'database'
  config_files '/etc/elasticsearch/elasticsearch.yml',
               '/etc/elasticsearch/logging.yml',
               '/etc/security/limits.d/elasticsearch.conf',
               '/etc/init/elasticsearch.conf',
               '/etc/default/elasticsearch'

  post_install   'post-install'
  post_uninstall 'post-uninstall'

  def build
    rm_f Dir['bin/*.bat']
    mv 'bin/plugin', 'bin/elasticsearch-plugin'

    inline_replace %w{bin/elasticsearch bin/elasticsearch-plugin} do |s|
      s.gsub! %{ES_HOME=`dirname "$SCRIPT"`/..}, 'ES_HOME=/usr/share/elasticsearch/'
    end

    inline_replace 'bin/elasticsearch.in.sh' do |s|
      s << "\n"
      s << "ES_JAVA_OPTS=\"-Des.config=/etc/elasticsearch/elasticsearch.yml\"\n"
    end

    inline_replace 'config/elasticsearch.yml' do |s|
      s.gsub! "# path.conf: /path/to/conf\n", "path.conf: /etc/elasticsearch\n"
      s.gsub! "# path.logs: /path/to/logs\n", "path.logs: /var/log/elasticsearch\n"
      s.gsub! "# path.data: /path/to/data\n", "path.data: /var/lib/elasticsearch\n"
    end
  end

  def install
    bin.install Dir['bin/elasticsearch{,-plugin}']
    etc('elasticsearch').install Dir['config/*']
    etc('init').install_p workdir('elasticsearch.upstart'), 'elasticsearch.conf'
    etc('default').install_p workdir('elasticsearch.default'), 'elasticsearch'
    etc('security/limits.d').install_p workdir('elasticsearch.limits'), 'elasticsearch.conf'
    share('elasticsearch').install Dir['{bin/elasticsearch.in.sh,lib,plugins,*.*}']
    var('lib/elasticsearch').mkpath
    var('log/elasticsearch').mkpath
  end
end
