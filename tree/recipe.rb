class Tree < FPM::Cookery::Recipe
  description 'displays directory tree, in color'

  name     'tree'
  version  '1.7.0'
  revision '1'
  license  'GPLv2'

  homepage 'http://mama.indstate.edu/users/ice/tree/'
  source   "#{homepage}/src/tree-1.7.0.tgz"
  sha256   '6957c20e82561ac4231638996e74f4cfa4e6faabc5a2f511f0b4e3940e8f7b12'

  section  'universe/utils'

  def build
    patch(workdir('patches/Makefile.patch'))
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
