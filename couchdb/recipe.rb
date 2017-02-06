class CouchDB < FPM::Cookery::Recipe
  description 'RESTful document oriented database'

  name     'couchdb'
  version  '2.0.0'
  revision '1'

  source "http://apache.mirror.iphh.net/couchdb/source/#{version}/apache-couchdb-#{version}.tar.gz"
  sha256 'ccaf3ce9cb06c50a73e091696e557e2a57c5ba02c5b299e1ac2f5b959ee96eca'

  build_depends 'build-essential', 'pkg-config', 'erlang', 'libicu-dev',
	        'libmozjs185-dev', 'libcurl4-openssl-dev', 'help2man',
		'python-sphinx'

  pre_install    'pre-install'
  post_install   'post-install'
  pre_uninstall  'pre-uninstall'
  post_uninstall 'post-uninstall'
  
  # Execute the following to make sure the build works:
  #     sudo touch /usr/lib/erlang/man/man1/gcov-tool-5.1.gz
  # See: https://bugs.launchpad.net/ubuntu/+source/erlang/+bug/1600780
  def build
    sh './configure -u couchdb -c'
    make :release
  end

  def install
    share('couchdb').install Dir['rel/couchdb/*']
    root('lib/systemd/system').install workdir('couchdb.service')
  end
end
