#!/bin/sh

set -e
set -u

HOSTNAME="$(hostname)"
VAGRANT_HOME="/home/vagrant"
SYNC_FOLDER="/provision-files"

export DEBIAN_FRONTEND=noninteractive

# Append etc.hosts to /etc/hosts
touch /etc/hosts
sed -i -e "/## BEGIN VAGRANT HOSTS/,/## END VAGRANT HOSTS/d" /etc/hosts

echo "## BEGIN VAGRANT HOSTS" >> /etc/hosts
cat $SYNC_FOLDER/etc.hosts >> /etc/hosts
echo "## END VAGRANT HOSTS" >> /etc/hosts

echo "[SUCCESS] added hosts to /etc/hosts"
