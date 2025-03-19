SHELL = /bin/bash
ROOT = $(shell git rev-parse --show-toplevel)
SCRIPT_DIR = $(ROOT)/scripts

.PHONY: help
help: ## Display this help
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: convert-fancy
convert-fancy: ## Convert fancy PNG to ICNS
	$(SCRIPT_DIR)/convert.sh fancy

.PHONY: convert-thick
convert-thick: ## Convert thick PNG to ICNS
	$(SCRIPT_DIR)/convert.sh thick

.PHONY: refresh-icons
refresh-icons: ## Refresh the icon cache
	$(SCRIPT_DIR)/refresh.sh

.PHONY: install-fancy
install-fancy: convert-fancy ## Install fancy icon
	cp $(ROOT)/icons/wezterm-fancy.icns $(ROOT)/icons/wezterm.icns
	$(MAKE) refresh-icons

.PHONY: install-thick
install-thick: convert-thick ## Install thick icon
	cp $(ROOT)/icons/wezterm-thick.icns $(ROOT)/icons/wezterm.icns
	$(MAKE) refresh-icons

.PHONY: install-button-black
install-button-black: ## Install black button icon
	cp $(ROOT)/icons/button-black.icns $(ROOT)/icons/button.icns
	$(MAKE) refresh-icons

.PHONY: install-button-gaming
install-button-gaming: ## Install gaming button icon
	cp $(ROOT)/icons/button-gaming.icns $(ROOT)/icons/button.icns
	$(MAKE) refresh-icons

.PHONY: install-button-white
install-button-white: ## Install white button icon
	cp $(ROOT)/icons/button-white.icns $(ROOT)/icons/button.icns
	$(MAKE) refresh-icons
