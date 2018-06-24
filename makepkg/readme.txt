makepkg.conf-$hostname is symlinked to /etc/makepkg.conf
changes:
- # of cores
- architecture of current system
- no compression of package
- destinations of built packages and others are changed

compile-all.sh is to automate building of all packages in /home/aidan/abs/
- for details see comments in script

to add a package to /home/aidan/abs, run: `asp checkout $pkgname`
