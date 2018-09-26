PREFIX?=/usr/local
INSTALL_NAME = appiconsetgen

install: build install_bin

build:
	swift package update
	swift build -c release -Xswiftc -static-stdlib

install_bin:
	mkdir -p $(PREFIX)/bin
	mv .build/release/AppIconSetGen .build/release/$(INSTALL_NAME)
	install .build/release/$(INSTALL_NAME) $(PREFIX)/bin

uninstall:
	rm -f $(PREFIX)/bin/$(INSTALL_NAME)
