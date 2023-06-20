# Anyconnect在linux上无法连接解决



环境：

Ubuntu18.04

anyconnect-linux64-4.6.02074-predeploy-k9

问题：

连接时出现：

```
VPN> AnyConnect cannot verify the VPN server: vpn.rochester.edu
    - Certificate is from an untrusted source.
Connecting to this server may result in a severe security compromise!

Most users do not connect to untrusted VPN servers unless the
reason for the error condition is known.

Connect Anyway? [y/n]: 
```

解决方法：

参考https://sites.socsci.uci.edu/~jstern/uci_vpn_ubuntu/

```
$ cd /opt/.cisco/certificates
$ sudo mv ca ca.orig
$ sudo ln -sf /etc/ssl/certs/ ca
$ sudo /etc/init.d/vpnagentd restart
```

