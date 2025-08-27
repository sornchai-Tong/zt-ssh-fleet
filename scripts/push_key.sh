#!/usr/bin/env bash
set -e
if [ -z "$1" ]; then
  echo "ใช้แบบนี้: $0 <host-alias-ใน-ssh-config>"
  echo "เช่น: $0 helio-g99"
  exit 1
fi

ssh-copy-id -i ~/.ssh/id_ed25519.pub "$1"
echo "✅ copied key to $1 แล้ว ลอง ssh $1 ได้เลย"
