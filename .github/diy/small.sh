#!/bin/bash
function git_sparse_clone() {
branch="$1" rurl="$2" localdir="$3" && shift 3
git clone -b $branch --depth 1 --filter=blob:none --sparse $rurl $localdir
cd $localdir
git sparse-checkout init --cone
git sparse-checkout set $@
mv -n $@ ../
cd ..
rm -rf $localdir
}

function mvdir() {
mv -n `find $1/* -maxdepth 0 -type d` ./
rm -rf $1
}
git clone --depth 1 https://github.com/kenzok8/wall && mv -n wall/* ./ ; rm -rf {UnblockNeteaseMusic,adguardhome,alist,dockerd,filebrowser,gost,lucky,sagernet-core,smartdns,ucl,upx-static,upx} && rm -rf wall
#git clone --depth 1 https://github.com/jerrykuku/luci-app-vssr
git clone --depth 1 -b main https://github.com/xiaorouji/openwrt-passwall passwall1 && mv -n passwall1/luci-app-passwall  ./; rm -rf passwall1
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall2 passwall2 && mv -n passwall2/luci-app-passwall2 ./;rm -rf passwall2
git clone https://github.com/XiaoliChan/helloworld -b main && rm -rf helloworld/v2raya && mvdir helloworld
#git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall-packages passwall-packages && mv -n passwall-packages/{sing-box,shadowsocks-rust} ./; rm -rf passwall-packages
#svn export https://github.com/immortalwrt/packages/trunk/devel/gn
git clone --depth 1 https://github.com/kiddin9/openwrt-packages && mv -n openwrt-packages/luci-app-bypass ./ ; rm -rf openwrt-packages
git clone --depth 1 https://github.com/sirpdboy/luci-app-ddns-go ddnsgo && mv -n ddnsgo/luci-app-ddns-go ./; rm -rf ddnsgo

sed -i \
-e 's?include \.\./\.\./\(lang\|devel\)?include $(TOPDIR)/feeds/packages/\1?' \
-e 's?\.\./\.\./luci.mk?$(TOPDIR)/feeds/luci/luci.mk?' \
*/Makefile

rm -rf ./*/.git ./*/.gitattributes ./*/.svn ./*/.github ./*/.gitignore
#find . -type f -name Makefile -exec sed -i 's/PKG_BUILD_FLAGS:=no-mips16/PKG_USE_MIPS16:=0/g' {} +
exit 0
