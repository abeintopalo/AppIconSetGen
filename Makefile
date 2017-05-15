INSTALL_PATH = /usr/local/bin/appiconsetgen

install:
	swift package --enable-prefetching update
	swift build --enable-prefetching -c release -Xswiftc -static-stdlib
	cp -f .build/release/AppIconSetGen $(INSTALL_PATH)

uninstall:
	rm -f $(INSTALL_PATH)
