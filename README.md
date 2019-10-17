# dracut-force-add-loaded-modules

This is a Dracut module that will add all loaded kernel modules to the initramfs. It doesn't do any filtering or other
silly things, just requires that the host building the initramfs has present and correct /proc/modules.


## How to use

These instructions work for Dracut on Arch, but should work on any distro. You might have to slightly adjust the paths
below (look up Dracut package contents on your distro to figure out the correct paths).

- Clone this Git repo into `/usr/lib/dracut/modules.d/99loaded-modules` (this dir should contain `module-setup.sh`).
- Run `sudo chmod +x /usr/lib/dracut/modules.d/99loaded-modules/module-setup.sh`
- In `/etc/dracut.conf` (or in a file under `/etc/dracut.conf.d`), add `add_dracutmodules+=loaded-modules`.
- Optionally, drop `loaded-modules.conf` from this repo into `/etc/dracut.conf.d` if you'd like.
- Regenerate the initramfs and see if the amount of included modules increased (`lsinitrd` can help, try something like
  `lsinitrd /boot/initramfs-test.img | grep usr/lib/modules | wc -l` on images with and without this module).
