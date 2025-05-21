#! /usr/bin/env sh

# AS ROOT

adduser \
   --system \
   --shell /bin/bash \
   --gecos 'Git Version Control' \
   --group \
   --disabled-password \
   --home /home/git \
   git

mkdir -p /var/lib/gitea/{custom,data,log}
chown -R git:git /var/lib/gitea/
chmod -R 750 /var/lib/gitea/
mkdir /etc/gitea
chown root:git /etc/gitea
chmod 770 /etc/gitea
killall gitea
sleep 3s
GITEA_URL=https://github.com/go-i2p/go-gitlooseleaf/releases/download/nightly/gitea-Linux
wget -O /usr/local/bin/gitea "$GITEA_URL"
chmod +x /usr/local/bin/gitea
setcap CAP_NET_BIND_SERVICE=+eip /usr/local/bin/gitea
su - git
