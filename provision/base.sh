#!/usr/bin/env bash

echo "export LANG=C.UTF-8" >> /home/vagrant/.bashrc

echo ">>> Installing Base Packages"

# Update
sudo apt-get update > /dev/null 2>&1

# Install base packages
# -qq implies -y --force-yes
sudo apt-get install -qq curl unzip git build-essential tree

# Common fixes for git
git config --global http.postBuffer 65536000

# Cache http credentials for one day while pull/push
git config --global credential.helper 'cache --timeout=86400'

# Create a self-signed SSL certificate for xip.io
echo ">>> Installing *.xip.io self-signed SSL"

SSL_DIR="/etc/ssl/xip.io"
DOMAIN="*.xip.io"
PASSPHRASE="devine"

SUBJ="
C=US
ST=Connecticut
O=Vaprobash
localityName=New Haven
commonName=$DOMAIN
organizationalUnitName=
emailAddress=
"

sudo mkdir -p "$SSL_DIR"

sudo openssl genrsa -out "$SSL_DIR/xip.io.key" 1024
sudo openssl req -new -subj "$(echo -n "$SUBJ" | tr "\n" "/")" -key "$SSL_DIR/xip.io.key" -out "$SSL_DIR/xip.io.csr" -passin pass:$PASSPHRASE
sudo openssl x509 -req -days 365 -in "$SSL_DIR/xip.io.csr" -signkey "$SSL_DIR/xip.io.key" -out "$SSL_DIR/xip.io.crt"
