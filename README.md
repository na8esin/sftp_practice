`ssh-keygen -t ed25519 -f id_ed25519`

# ホストマシンから
ip確認
`doc exec sshd ip -4 a show dev eth0`
もしくは
```
SSH_IP=`docker inspect --format='{{json .NetworkSettings.Networks.sftp_practice_default.IPAddress}}' sftp_practice-sshd-1 | tr -d '"'`
```
もっと短くならないの？

`ssh -i ./id_ed25519 -p 2222 linuxserver.io@$SSH_IP`

```
sftp -i ./id_ed25519 -P 2222 linuxserver.io@$SSH_IP

put sample.txt
```

# 別にsshでcpすれば良くない？
`ssh -i ./id_ed25519 -p 2222 linuxserver.io@$SSH_IP cp sample.txt sample5.txt`
それはその通り。どっちにしてもrubyのsftpライブラリにはcpないし。

## pythonのsftpライブラリは？
https://github.com/paramiko/paramiko/issues/2336