## ubuntu18 nodejs 安装失败

when run

`node -v`

get

`node: /lib/x86_64-linux-gnu/libc.so.6: version 'GLIBC_2.28' not found (required by node)`



solution：


```shell
$ sudo apt-get remove nodejs
$ sudo apt-get remove npm

$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
$ chmod +x ~/.nvm/nvm.sh
$ source ~/.bashrc 
$ nvm install 16
```

