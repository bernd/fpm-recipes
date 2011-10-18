class Mutt < FPM::Cookery::Recipe
  description 'small but very powerful text-based mail client'

  name     'mutt'
  version  '1.5.20'
  revision '1'
  homepage 'http://www.mutt.org'
  source   'ftp://ftp.mutt.org/mutt/devel/mutt-1.5.20.tar.gz'
  sha256   '9579fc079d74ff5c89223ff09df402ef4e508ba8ca925c49e74aa09c02a9a796'

  conflicts 'mutt'
  replaces  'mutt'

  exclude   'etc/mime.types*'

  config_files '/etc/Muttrc'

  def build
    configure :prefix => prefix,
              'enable-hcache' => true,
              'enable-imap' => true,
              'with-ssl' => true,
              :sysconfdir => etc
    make
  end

  def install
    inline_replace 'Makefile' do |s|
      s.gsub! '$(MAKE) $(AM_MAKEFLAGS) install-exec-hook', '# disabled install-exec-hook'
    end
    make :install, 'DESTDIR' => destdir
  end
end
