
.PHONY: all install uninstall

DESTDIR=

all:
	@echo "Please run 'sudo make install'."

install:
	mkdir -p $(DESTDIR)/usr/local/bin/
	install -m0644 usr/local/bin/shared-start-stop-helper $(DESTDIR)/usr/local/bin/shared-start-stop-helper
	install -m0755 usr/local/bin/shared-start-stop $(DESTDIR)/usr/local/bin//shared-start-stop
	mkdir -p $(DESTDIR)/etc/systemd/system/
	install -m0644 etc/systemd/system/shared-start-stop.service $(DESTDIR)/etc/systemd/system/
	mkdir -p $(DESTDIR)/etc/init.d/
	install -m0755 etc/init.d/shared-start-stop $(DESTDIR)/etc/init.d/shared-start-stop
	mkdir -p $(DESTDIR)/etc/skel/rc.d/
	install -m0644 etc/skel/rc.d/README $(DESTDIR)/etc/skel/rc.d/README
	@echo "If you use systemd, you may need to 'sudo systemctl enable shared-start-stop'."
	@echo "If you use sysvinit, you may need to 'sudo update-rc.d shared-start-stop defaults'."

uninstall:
	rm -Rf $(DESTDIR)/etc/skel/rc.d/
	rm -f $(DESTDIR)/etc/init.d/shared-start-stop
	rm -f $(DESTDIR)/etc/systemd/system/multi-user.target.wants/shared-start-stop.service
	rm -f $(DESTDIR)/etc/systemd/system/shared-start-stop.service
	rm -f $(DESTDIR)/usr/local/bin/shared-start-stop
	rm -f $(DESTDIR)/usr/local/bin/shared-start-stop-helper
	@echo "If you use sysvinit, you may need to 'sudo update-rc.d shared-start-stop remove'."
