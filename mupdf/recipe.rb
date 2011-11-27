require 'rbconfig'

class MuPDF < FPM::Cookery::Recipe
  description 'a lightweight PDF and XPS viewer'

  name     'mupdf'
  version  '0.9'
  homepage 'http://www.mupdf.com/'

  case RbConfig::CONFIG['arch']
  when /x86_64/
    source 'http://mupdf.googlecode.com/files/mupdf-0.9-linux-amd64.tar.gz'
    sha1   'aa4171eac1af3bd6192a62aad2be4fbcc5ebe24c'
  else
    source 'http://mupdf.googlecode.com/files/mupdf-0.9-linux-i386.tar.gz'
    sha1   '0867323557ca4a1e658ca4745e8bbe58cd4d71fb'
  end

  def build
  end

  def install
    bin.install 'mupdf'
    bin.install_p 'pdfclean', 'mupdfclean'
    bin.install_p 'pdfdraw', 'mupdfdraw'
    bin.install_p 'pdfextract', 'mupdfextract'
    bin.install_p 'pdfinfo', 'mupdfinfo'
    bin.install_p 'pdfshow', 'mupdfshow'
    bin.install 'xpsdraw'

    share('doc/mupdf').mkpath
    share('doc/mupdf').install Dir['docs/*']
  end
end
