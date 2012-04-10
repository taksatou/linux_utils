.PHONY: install

PREFIX ?= $(HOME)
SRCTOP ?= ./
TARGET ?= common

install:
	mkdir -p $(PREFIX)/bin
	for i in $(TARGET); do \
	cp $(SRCTOP)/bin/$$i/* $(PREFIX)/bin/; \
	done;
