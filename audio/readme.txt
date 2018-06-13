copy alsa-base.conf to /etc/modprobe.d/ to set usb audio interface as default sound input/output

do disable pc speaker beep add 'modprobe.blacklist=pcspkr' to GRUB_CMDLINE_LINUX_DEFAULT line in /etc/default/grub (is a file)
