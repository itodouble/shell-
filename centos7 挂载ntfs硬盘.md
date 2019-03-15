安装ntfs
```
rpm -ivh https://mirrors.aliyun.com/epel/7/x86_64/Packages/n/ntfs-3g-2017.3.23-6.el7.x86_64.rpm
```
硬盘插上机器后 查找哪个是的
```
ls /dev/|grep sdc
```

挂载到mnt
```
mount -t ntfs-3g /dev/sdc1 /mnt
```
