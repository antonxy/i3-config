USER := $(SUDO_USER)
HOME := $(shell eval echo ~$(USER))

.PHONY: install

install: config
	install -m 0644 config $(HOME)/.i3/
	install -d /opt/scripts
	install scripts/* /opt/scripts
	i3-msg reload

