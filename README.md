# zt-ssh-fleet
Manage SSH connections across devices using ZeroTier + Termux/Linux/Win11
จัดการ SSH ข้ามเครื่องผ่าน ZeroTier (Android/Termux, Linux/WSL, Windows 11)

## ใช้ยังไง (Quickstart)
1) สร้างกุญแจ: `ssh-keygen -t ed25519 -C "tong@zt"`
2) ติดตั้ง ZeroTier ทุกเครื่องและ join NETWORK_ID
3) รันสคริปต์ติดตั้ง SSH ตาม OS ในโฟลเดอร์ `scripts/`
4) คัดลอก `ssh-config.example` ไปเป็น `~/.ssh/config` แล้วแก้ IP/USER
5) ทดสอบ: `ssh helio-g99` (ตัวอย่าง alias)

## โครงสร้าง
- `inventory.yml` รายชื่อเครื่องและ IP
- `scripts/*` สคริปต์ตั้งค่า/กระจายกุญแจ
- `ssh-config.example` แม่แบบ alias SSH
