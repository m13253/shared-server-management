
.PHONY: all install uninstall

DESTDIR=

all:
	@echo Please run 'sudo make install'.

install:
	mkdir -p $(DESTDIR)/usr/local/bin/
	install -m0644 usr/local/bin/shared-start-stop-helper $(DESTDIR)/usr/local/bin/shared-start-stop-helper
	install -m0755 usr/local/bin/shared-start-stop $(DESTDIR)/usr/local/bin//shared-start-stop
	mkdir -p $(DESTDIR)/etc/systemd/system/
	install -m0644 etc/systemd/system/shared-start-stop.service $(DESTDIR)/etc/systemd/system/
	mkdir -p $(DESTDIR)/etc/init.d/
	install -m0755 etc/init.d/shared-start-stop $(DESTDIR)/etc/init.d/shared-start-stop

uninstall:
	rm -f $(DESTDIR)/etc/init.d/shared-start-stop
	rm -f $(DESTDIR)/etc/systemd/system/shared-start-stop.service
	rm -f $(DESTDIR)/usr/local/bin/shared-start-stop
	rm -f $(DESTDIR)/usr/local/bin/shared-start-stop-helper
