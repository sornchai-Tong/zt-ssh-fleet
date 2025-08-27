#!/usr/bin/env bash
# ใช้: ./scripts/push_key.sh helio-g99
host="$1"
[ -z "$host" ] && { echo "ระบุ host จาก ~/.ssh/config ด้วย"; exit 1; }
ssh-copy-id -i ~/.ssh/id_ed25519.pub "$host"
