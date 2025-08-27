#!/data/data/com.termux/files/usr/bin/bash
set -e
pkg update -y && pkg install -y openssh termux-services
sv-enable sshd || true
mkdir -p ~/.ssh
cat id_ed25519.pub >> ~/.ssh/authorized_keys 2>/dev/null || true
chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys
ZT_IP=$(ip addr | awk '/zt/{f=1} f && /inet /{print $2}' | cut -d/ -f1 | head -n1)
cat > ~/.ssh/sshd_config <<EOF
Port 2222
ListenAddress ${ZT_IP}
PasswordAuthentication no
PubkeyAuthentication yes
EOF
pkill sshd 2>/dev/null || true
sshd -f ~/.ssh/sshd_config
echo "OK: Termux SSH on ${ZT_IP}:2222"
