class PhantomJS < FPM::Cookery::Recipe
  description 'headless WebKit with JavaScript API'

  name    'phantomjs'
  version '1.5.0'

  architectures :i386 do
    source 'http://phantomjs.googlecode.com/files/phantomjs-1.5.0-linux-x86-dynamic.tar.gz'
  end

  architectures :x68_64 do
    source 'http://phantomjs.googlecode.com/files/phantomjs-1.5.0-linux-x86_64-dynamic.tar.gz'
  end

  sha256   '90ccb1a5df9bc6bd2138d335935636e9453f32863f1df5002d703eeee3c51d1d'
  homepage 'http://code.google.com/p/phantomjs'

  def build
  end

  def install
    bin.mkdir
    prefix('phantomjs').mkdir

    cp_r Dir['*'], prefix('phantomjs').to_s

    linktarget = bin('phantomjs')

    with_trueprefix do
      ln_s prefix('phantomjs/bin/phantomjs'), linktarget
    end
  end
end
