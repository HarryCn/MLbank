#!/bin/bash
rm -rf $0
clear
echo
echo '修复阿里云无网络-优化TCP连接(替换防火墙规则，默认VPN端口为443，Mproxy为8080【如不同自行替换源文件】)'
echo '回车开始'
read
iptables -F
service iptables save
systemctl restart iptables.service
iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -o eth0 -j MASQUERADE >/dev/null 2>&1
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 8080 -j ACCEPT >/dev/null 2>&1
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j ACCEPT >/dev/null 2>&1
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 7788 -j ACCEPT >/dev/null 2>&1
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 53 -j ACCEPT >/dev/null 2>&1
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT >/dev/null 2>&1
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 137 -j ACCEPT >/dev/null 2>&1
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 138 -j ACCEPT >/dev/null 2>&1
iptables -A INPUT -p udp --dport 138 -j ACCEPT >/dev/null 2>&1
iptables -A INPUT -p udp --dport 137 -j ACCEPT >/dev/null 2>&1
iptables -A INPUT -p udp --dport 53 -j ACCEPT >/dev/null 2>&1
iptables -t nat -A POSTROUTING -j MASQUERADE >/dev/null 2>&1
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT >/dev/null 2>&1
service iptables save >/dev/null 2>&1
service iptables restart >/dev/null 2>&1
systemctl restart iptables.service >/dev/null 2>&1
echo '
net.ipv4.ip_forward = 1
net.ipv4.conf.default.rp_filter = 1
net.ipv4.conf.default.accept_source_route = 0
kernel.sysrq = 0
kernel.core_uses_pid = 1
net.ipv4.tcp_syncookies = 1
net.bridge.bridge-nf-call-ip6tables = 0
net.bridge.bridge-nf-call-iptables = 0
net.bridge.bridge-nf-call-arptables = 0
kernel.msgmnb = 65536
kernel.msgmax = 65536
kernel.shmmax = 68719476736
kernel.shmall = 4294967296
fs.file-max = 51200
net.core.rmem_max = 67108864
net.core.wmem_max = 67108864
net.core.netdev_max_backlog = 250000
net.core.somaxconn = 4096
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_tw_recycle = 0
net.ipv4.tcp_fin_timeout = 30
net.ipv4.tcp_keepalive_time = 1200
net.ipv4.ip_local_port_range = 10000 65000
net.ipv4.tcp_max_syn_backlog = 8192
net.ipv4.tcp_max_tw_buckets = 5000
net.ipv4.tcp_fastopen = 3
net.ipv4.tcp_rmem = 4096 87380 67108864
net.ipv4.tcp_wmem = 4096 65536 67108864
net.ipv4.tcp_mtu_probing = 1' >/etc/sysctl.conf
sysctl -p
vpn
exit 0;