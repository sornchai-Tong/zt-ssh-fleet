#!/usr/bin/env bash
set -e
sudo apt update && sudo apt install -y openssh-server
mkdir -p ~/.ssh
cat id_ed25519.pub >> ~/.ssh/authorized_keys 2>/dev/null || true
chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys
ZT_IP=$(ip -4 addr show | awk '/zt/{f=1} f && /inet /{print $2}' | cut -d/ -f1 | head -n1)
sudo bash -c "cat >/etc/ssh/sshd_config.d/zt.conf <<EOF
PasswordAuthentication no
PubkeyAuthentication yes
ListenAddress ${ZT_IP}
Port 22
EOF"
sudo systemctl restart ssh && sudo systemctl enable ssh
echo "OK: Linux SSH on ${ZT_IP}:22"
