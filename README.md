# syncoid-replicate.sh
Replicate zfs virtual disks in Proxmox (for ex from an ssd pool to a hard drive pool for backup)

Download this script and copy to /usr/bin/syncoid-replicate.sh, make executable, and then you can even just put it in crontab to sync VM's 

for example:
``` sh
/usr/bin/syncoid-replicate.sh fastssdpool/vm-102-disk-0 rpool/data/vm-102-disk-0
```
