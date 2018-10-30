PANDOC ?= pandoc
PUB    ?= pub

check:
	$(PUB) run test

.PHONY: check
.SECONDARY:
.SUFFIXES:
