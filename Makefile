#
# Makefile for OpenOCD Windows build
#

ifneq ($(MSYSTEM),MINGW64)
$(error ERROR: execute by Mingw-w64 shell)
endif

PARALLEL ?= -j4
TODAY := $(shell date +%Y%m%d)
RELEASE_DIR := release
OUT_DIR := out
INST_DIR := openocd-w64

all:	config build install package

clean:
	cd $(OUT_DIR); make clean

distclean:
	-rm -rf $(OUT_DIR) $(INST_DIR)

$(OUT_DIR):
	mkdir $(OUT_DIR)
	cd openocd; ./bootstrap
	cd $(OUT_DIR); ../openocd/configure --prefix=$(shell pwd)/$(INST_DIR)

config: $(OUT_DIR)

build: $(OUT_DIR)
	cd $(OUT_DIR); make $(PARALLEL)

install: $(OUT_DIR)
	-rm -rf $(INST_DIR)
	cd $(OUT_DIR); make install

$(INST_DIR): install

$(RELEASE_DIR):
	mkdir $(RELEASE_DIR)

package: $(INST_DIR) $(RELEASE_DIR)
	-rm -f $(INST_DIR)/bin/*.dll
	cp `ldd $(INST_DIR)/bin/openocd.exe|grep mingw64|awk '{print $$3}'` $(INST_DIR)/bin
	tar zcvf $(RELEASE_DIR)/openocd-w64-prebuilt-$(TODAY).tar.gz $(INST_DIR)

prepare:
	pacman -S libtool pkg-config autoconf automake texinfo \
		mingw-w64-x86_64-toolchain \
		mingw-w64-x86_64-libusb \
		mingw-w64-x86_64-hidapi \
		mingw-w64-x86_64-libftdi

.PHONY: all clean config build install package prepare
