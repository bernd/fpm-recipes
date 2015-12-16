# Needs a nodejs 0.10.x
# Get it from here: https://github.com/nodesource/distributions#installation-instructions
#
# Needs MongoDB 3.0
# Get it from here: https://docs.mongodb.org/master/tutorial/install-mongodb-on-ubuntu/

class RocketChat < FPM::Cookery::Recipe
  description 'Slack like online chat'

  name     'rocketchat'
  version  "20151215.1+23aeb61"
  revision '1'

  # This will change for every commit on the master branch. Make sure to host it yourself!
  source 'https://s3.amazonaws.com/rocketchatbuild/rocket.chat-master.tgz'
  sha256 '26da9ffca8afdaa2d09faf673683e0ab558f39907fb95aa4f5631a9f40bda707'

  build_depends 'nodejs', 'graphicsmagick'
  depends       'nodejs', 'graphicsmagick'

  def build
    Dir.chdir('programs/server') do
      sh 'npm install'
    end
  end

  def install
    opt('rocketchat').mkpath
    opt('rocketchat').install Dir['*']

    etc('default').install workdir('default'), 'rocketchat'
    etc('init').install workdir('upstart.conf'), 'rocketchat.conf'
  end
end
