copy alsa-base.conf to /etc/modprobe.d/ to set usb audio interface as default sound input/output

do disable pc speaker beep add 'modprobe.blacklist=pcspkr' to GRUB_CMDLINE_LINUX_DEFAULT line in /etc/default/grub (is a file)

on 19/10/2019, alsa stopped recognizing usb audio interface
alsa-base.conf needed to be changed to blacklist snd_hda_intel
	old file is saved as alsa-base.conf-old

