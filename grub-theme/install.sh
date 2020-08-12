rm -rf /boot/grub/themes/grub-cyberpunk
cp -TR ./theme /boot/grub/themes/grub-cyberpunk
grub-mkconfig -o /boot/grub/grub.cfg
