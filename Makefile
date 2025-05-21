.PHONY: all download setup-user install-binary install-systemd enable disable uninstall clean help

# Installation paths
BINARY_PATH = ${BASE}/usr/local/bin/gitea
SYSTEMD_PATH = ${BASE}/etc/systemd/system
CONFIG_PATH = ${BASE}/etc/gitea
DATA_PATH = ${BASE}/var/lib/gitea

# Default target
all: help

help:
	@echo "GitLooseLeaf - Modified Gitea with multi-protocol support"
	@echo ""
	@echo "Usage:"
	@echo "  make download	   - Download the latest gitea binary"
	@echo "  make setup-user	 - Create git user and required directories"
	@echo "  make install-binary - Install Gitea binary"
	@echo "  make install-systemd - Install systemd service files"
	@echo "  make enable		 - Enable and start Gitea service"
	@echo "  make disable		- Disable and stop Gitea service"
	@echo "  make install		- Complete installation (all above steps)"
	@echo "  make uninstall	  - Remove Gitea"
	@echo "  make clean		  - Clean up downloaded files"
	@echo ""
	@echo "Note: Many commands require root privileges (use sudo)"

# Download latest Gitea binary
download:
	@echo "Downloading latest Gitea binary..."
	mkdir -p downloads
	GITEA_URL="https://github.com/go-i2p/go-gitlooseleaf/releases/download/nightly/gitea-Linux"; \
	wget -O downloads/gitea "$$GITEA_URL" || curl -L -o downloads/gitea "$$GITEA_URL"
	chmod +x downloads/gitea

# Setup git user and directories
setup-user:
	@echo "Setting up git user and directories..."
	id -u git &>/dev/null || adduser \
		--system \
		--shell /bin/bash \
		--gecos 'Git Version Control' \
		--group \
		--disabled-password \
		--home /home/git \
		git
	mkdir -p $(DATA_PATH)/custom
	mkdir -p $(DATA_PATH)/data
	mkdir -p $(DATA_PATH)/log
	mkdir -p $(CONFIG_PATH)
	chown -R git:git $(DATA_PATH)/
	chmod -R 750 $(DATA_PATH)/
	chown root:git $(CONFIG_PATH)
	chmod 770 $(CONFIG_PATH)

# Install Gitea binary
install-binary: download
	@echo "Installing Gitea binary..."
	cp downloads/gitea $(BINARY_PATH)
	chmod +x $(BINARY_PATH)
	setcap CAP_NET_BIND_SERVICE=+eip $(BINARY_PATH)

# Install systemd service files
install-systemd:
	@echo "Installing systemd service files..."
	mkdir -p $(SYSTEMD_PATH)/gitea.service.d
	cp etc/systemd/system/gitea.service $(SYSTEMD_PATH)/
	cp etc/systemd/system/gitea.service.d/user-config.conf $(SYSTEMD_PATH)/gitea.service.d/
	systemctl daemon-reload

# Enable and start Gitea service
enable:
	@echo "Enabling and starting Gitea service..."
	systemctl enable gitea.service
	systemctl start gitea.service
	@echo "Gitea service started successfully!"
	@echo "Please configure your email in $(SYSTEMD_PATH)/gitea.service.d/user-config.conf"
	@echo "Then restart with: systemctl restart gitea.service"

# Disable and stop Gitea service
disable:
	@echo "Disabling and stopping Gitea service..."
	systemctl disable gitea.service
	systemctl stop gitea.service

# Complete installation
install: setup-user install-binary install-systemd enable
	@echo "Installation complete!"
	@echo "You can now access Gitea at:"
	@echo "- HTTPS: https://$(shell hostname):3000"
	@echo "- I2P/Tor: Check logs for actual addresses: journalctl -u gitea"

# Uninstall Gitea
uninstall: disable
	@echo "Uninstalling Gitea..."
	rm -f $(BINARY_PATH)
	rm -f $(SYSTEMD_PATH)/gitea.service
	rm -rf $(SYSTEMD_PATH)/gitea.service.d
	systemctl daemon-reload
	@echo "Gitea has been uninstalled."
	@echo "Note: User and data directories were not removed."
	@echo "To completely remove, delete: $(CONFIG_PATH) and $(DATA_PATH)"

# Clean up
clean:
	@echo "Cleaning up..."
	rm -rf downloads