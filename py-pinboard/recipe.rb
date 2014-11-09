class PythonPinboard < FPM::Cookery::PythonRecipe
  name    'pinboard'
  version '0.5.7'

  homepage 'https://github.com/lionheart/pinboard.py'

  build_depends 'python-setuptools'
  depends       'python'
end
