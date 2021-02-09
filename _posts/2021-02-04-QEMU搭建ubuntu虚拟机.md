# QEMU搭建ubuntu虚拟机

## 1.下载ubuntu 18.04镜像

地址：

https://releases.ubuntu.com/18.04/

## 2.安装相关软件包
安装网桥相关包
```
sudo apt-get install uml-utilities bridge-utils -y
```
安装qemu依赖包
```
sudo apt-get install libsdl2-dev -y
```

## 3.下载安装qemu

```
wget https://download.qemu.org/qemu-5.0.1.tar.xz
tar xvJf qemu-5.0.1.tar.xz
cd qemu-5.0.1
./configure
make
```
## 4.配置网桥
```
sudo vim /etc/network/interfaces  
```
末尾添加内容如下
```
auto br0
iface br0 inet dhcp
bridge_ports enp5s0
```
enp5s0为host机器连到路由器上的网卡，根据实际情况修改（因为此网卡由路由器分配指定ip所以此处使用dhcp模式，原网卡使用static模式需要进行相应static配置）

如果未设置ipv4转发，修改如下文件
```
sudo vim /etc/sysctl.conf
```
取消如下行的注释
```
net.ipv4.ip_forward = 1
```
保存后重启服务器

创建tap网络启动脚本
```
sudo vim /etc/qemu-ifup
```
添加内容如下
```
#!/bin/sh
#set -x
switch=br0
if [ -n "$1" ];then
        /usr/bin/sudo /usr/bin/tunctl -u `whoami` -t $1
        /usr/bin/sudo /sbin/ip link set $1 up
        sleep 0.5s
        /usr/bin/sudo /sbin/brctl addif $switch $1
        exit 0
else
        echo "Error: no interface specified"
        exit 1
fi
```
```
sudo chmod u+x /etc/qemu-ifup
```
(注：脚本内的命令路径根据实际情况指定)

创建tap网络关闭脚本
```
sudo vim /etc/qemu-ifdown
```
添加内容如下
```
#!/bin/sh
```
```
sudo chmod u+x /etc/qemu-ifdown
```

## 5.创建qcow2格式镜像

```
cd qemu-5.0.1
./qemu-img create -f qcow2 ubuntu.img 20G
```

## 6.安装ubuntu VM
以下命令启动安装，vnc viewer连接5901端口
```
sudo ./x86_64-softmmu/qemu-system-x86_64 -m 4096 -smp 4 -hda ubuntu.img  -cdrom ../ubuntu-18.04.5-desktop-amd64.iso -boot dc  -net nic -net tap -machine usb=on -device usb-tablet -vnc :1
```
执行完后qemu启动，在可视化窗口进行ubuntu安装并配置网络，安装完成后关闭qemu

## 7.启动VM
以下命令启动虚拟机，vnc viewer连接5901端口可看到虚拟机可视化桌面
```
sudo ./x86_64-softmmu/qemu-system-x86_64 -m 4096 -smp 4 -hda ubuntu.img -net nic -net tap -machine usb=on -device usb-tablet -vnc :1
```
不需要图形界面请加参数 -nographic

