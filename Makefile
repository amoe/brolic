document_root = /var/www/html
cgi_path = $(document_root)/render_atom.cgi
sharedir = /usr/local/share/brolic

install:
	cp render_atom.perl $(cgi_path)
	chmod 0755 $(cgi_path)
	mkdir -p $(sharedir)
	cp templates/*.tmpl $(sharedir)
