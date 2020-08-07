#!/bin/bash
rm -rf /boot/grub/themes/grub-nyarch
cp -TR ./theme /boot/grub/themes/grub-nyarch
# mv /etc/default/grub /etc/default/grub.old
# cp ./grub /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

