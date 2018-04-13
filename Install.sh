#!/bin/bash

ROOT_UID=0

if [ "$UID" -eq "$ROOT_UID" ]; then

  # Copy Griffin
  cp -a Griffin /boot/grub/themes

  # Set Griffin
  grep "GRUB_THEME=" /etc/default/grub 2>&1 >/dev/null && sed -i '/GRUB_THEME=/d' /etc/default/grub
  echo "GRUB_THEME=\"/boot/grub/themes/Griffin/theme.txt\"" >> /etc/default/grub

  # update grub
  update-grub

  echo -e "/n All done!"
  notify-send "All done!" -i face-smile

else
  echo -e "/n Please run this script by root..."
  notify-send "Please run this script by root..." -i notification
fi


