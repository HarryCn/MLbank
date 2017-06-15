echo ""
echo -e "\033[1;32m" 
echo "=========================================================================="
echo "                														    "
echo "            wzlink综合脚本 内含一键bbr加速-wzlink修改版 		            "
echo "            wzlink综合脚本 内含一键网络修复-wzlink修改版 		            "
echo "           wzlink综合脚本 内含一键数据库备份-wzlink修改版 	            "
echo "       wzlink综合脚本 内含Html OS V1.0完美复活版-wzlink修改版             "
echo "                                                                          "
echo "                                         版权所有© QQ34731272             "
echo "=========================================================================="
echo -e "\033[0m"
echo
echo "  www.wzlink.win   回车开始"
read
# "=========================================================================="
#Read the native network
echo
echo  -e "     \033[36m 欢迎使用wzlink一键脚本												  "
echo
echo -n -e "     请输入官网网址验证<www.wzlink.win> ："
read PASSWD
readkey=$PASSWD
if [[ ${readkey%%\ *} == www.wzlink.win ]]
    then
        echo 
		echo -n -e "     验证成功！ [本机IP: \033[32m $IP \033[0m]"
    else
        echo
		echo -e '     \033[31m验证失败\033[0m'
		echo
echo "验证失败请重试";
exit
fi
clear
echo -e "\033[1;32m" 
echo "#######请输入相对应序号########"
echo ""
echo "1 wzlink一键脚本（html1.0改版）"
echo ""
echo "2       bbr一键脚本            "
echo ""
echo "3 	  网络修复脚本	    	 "
echo ""
echo "4 	  数据库备份脚本	   	 "
echo -e "\033[0m"
echo "###########感谢使用############"
read a
k=$a
if [ $k = "1" ]; then
echo "正在为您搭建Html OS V1.0完美复活版-wzlink修改版"
wget 6-wz.cn/html1/wz.sh && bash wz.sh
exit
fi
if [ $k = "2" ]; then
echo "正在为您运行bbr一键脚本 "
wget 6-wz.cn/bbr.sh && bash bbr.sh
exit
fi
if [ $k = "3" ]; then
echo "正在为您运行网络修复脚本！"
wget 6-wz.cn/xfwl.sh && bash xfwl.sh
exit
fi
if [ $k = "4" ]; then
echo "正在为您运行数据库备份脚本！"
wget 6-wz.cn/backup.sh && bash backup.sh
exit
fi
# "=========================================================================="
#End of the program