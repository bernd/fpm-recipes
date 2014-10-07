class VoltdbPhpClient < FPM::Cookery::Recipe
  homepage    'http://voltdb.com/'
  name        'voltdb-php-client'
  version     '1.2'
  source      'https://github.com/VoltDB/voltdb-client-php', :with => :git, :branch => "native"

  depends       'php5-common'
  build_depends 'php5-dev', 'gcc', 'make'

  def build
      safesystem "rm #{builddir}/voltdb-client-cpp"
      safesystem "git clone -b noexceptions https://github.com/VoltDB/voltdb-client-cpp.git #{builddir}/voltdb-client-cpp"
      Dir.chdir "#{builddir}/voltdb-client-cpp" do
        system 'make'
      end
      system 'phpize'
      system "./configure --with-voltdb=#{builddir}/voltdb-client-cpp"
      make
  end

  def install
    Dir.chdir 'modules' do
      prefix('lib/php5/20100525/').install 'voltdb.so'
      etc('php5/mods-available/').install workdir('voltdb.ini')
    end
  end
end
