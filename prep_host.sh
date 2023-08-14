#!/bin/bash

#builtin admin for truenas
sudo groupadd -g 544 builtin_administrators
sudo usermod -aG builtin_administrators "$USER"

#ISCSI
sudo apt update && sudo apt install open-iscsi
sudo iscsiadm -m discovery -t sendtargets -p {IPADDRESS} #discover target
sudo iscsiadm -m node -T {BASENAME}:{TARGETNAME} -p {IPADDRESS} -l #establish session

sudo fdisk -l
sudo fdisk {DISK} #e.g. /dev/sdb -> create partition
sudo mkfs.ext4 {PARTITION_NAME} #e.g. /dev/sdb1

sudo mkdir ~./compose/container-configs

echo >> "{PARTITION_NAME} {HOME}/compose/container-configs ext4 defaults 0 0"




sudo iscsiadm -m node -T {BASENAME}:{TARGETNAME} -p {IPADDRESS} -u #kill session
sudo iscsiadm -m node -o delete -T {BASENAME}:{TARGETNAME} #remove node