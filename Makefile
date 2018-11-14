FLUTTER ?= flutter
PANDOC  ?= pandoc
PUB     ?= pub

check:
	$(FLUTTER) test

.PHONY: check
.SECONDARY:
.SUFFIXES:
