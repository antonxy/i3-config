USER := $(SUDO_USER)
HOME := $(shell eval echo ~$(USER))

.PHONY: install

install: config
	install -m 0644 config $(HOME)/.i3/
	install -d /opt/scripts
	install scripts/* /opt/scripts
	install -D -m 0644 i3status $(HOME)/.config/i3status/config
	install -D -m 0644 dunstrc $(HOME)/.config/dunst/dunstrc
	i3-msg reload

