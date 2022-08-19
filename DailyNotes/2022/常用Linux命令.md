常用命令
Linux更新及安装命令

Debian更新：apt-get update && apt-get upgrade
Centos更新：yum update

Debian安装curl：apt-get install curl
Centos安装curl：yum install curl

Debian安装wget：apt-get install wget
Centos安装wget：yum install wget

Centos安装XZ压缩工具：yum install xz

Debian/Ubuntu 基础命令

更新软件源：apt-get update
更新升级所有软件：apt-get upgrade

清理旧版本的软件缓存：sudo apt-get autoclean
清理所有软件缓存：sudo apt-get clean
删除系统不再使用的孤立软件：sudo apt-get autoremove

查看内核版本：uname -a
查看ubuntu版本：cat /etc/issue

查看当前的内存使用情况：free -m
查看当前有哪些进程：ps -A
杀死一个进程：kill id / killall id / kill -9 id

安装 openssh-server：sudo apt-get install openssh-server
确认sshserver是否启动：ps -e | grep ssh

Centos安装neofetch
Github官网：https://github.com/dylanaraps/neofetch/wiki/Installation

Linux开启原版BBR

echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sysctl -p
lsmod | grep bbr

Linux 常用的一键脚本
V2ray-agent

Github地址：https://github.com/mack-a/v2ray-agent
支持快捷方式启动，安装完毕后，shell输入【vasma】即可打开脚本，脚本执行路径[/etc/v2ray-agent/install.sh]
Latest Version【推荐】

wget -P /root -N --no-check-certificate "https://raw.githubusercontent.com/mack-a/v2ray-agent/master/install.sh" && chmod 700 /root/install.sh && /root/install.sh

Stable-v2.4.16【无gRPC】

wget -P /root -N --no-check-certificate "https://raw.githubusercontent.com/mack-a/v2ray-agent/stable_v2.4.16/install.sh" && chmod 700 /root/install.sh && /root/install.sh

V2ray-233blog

bash <(curl -s -L https://git.io/v2ray.sh)

UnixBench跑分工具测试

UnixBench下载地址：https://code.google.com/archive/p/byte-unixbench/downloads

wget --no-check-certificate http://tools.laobuluo.com/tools/unixbench.sh
chmod +x unixbench.sh
./unixbench.sh

bench.sh 测速脚本

Github地址：https://github.com/teddysun/across

wget -qO- bench.sh | bash
或者
curl -Lso- bench.sh | bash

BestTrace 路由追踪

wget https://cdn.ipip.net/17mon/besttrace4linux.zip
unzip besttrace4linux.zip
chmod +x besttrace
./besttrace 114.114.114.114

流媒体解锁检测脚本

Github地址：https://github.com/sjlleo/netflix-verify
Netflix 解锁检测脚本

wget -O nf https://github.com/sjlleo/netflix-verify/releases/download/2.61/nf_2.61_linux_amd64 && chmod +x nf && clear && ./nf

一键DD纯净系统脚本(萌咖) CentOS/Debian/Ubuntu

系统安装完成后的默认用户名为root，默认密码为: MoeClub.org

bash <(wget --no-check-certificate -qO- 'https://www.moeelf.com/attachment/LinuxShell/InstallNET.sh') -d 11 -v 64 -a # Debian 11 64位

bash <(wget --no-check-certificate -qO- 'https://www.moeelf.com/attachment/LinuxShell/InstallNET.sh') -u 20.04 -v 64 -a # Ubuntu 20.04 64位