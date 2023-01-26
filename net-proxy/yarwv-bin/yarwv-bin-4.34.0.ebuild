# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit fcaps

DESCRIPTION="A platform for building proxies to bypass network restrictions"
HOMEPAGE="https://www.v2ray.com/"
SRC_URI="https://github.com/v2fly/v2ray-core/releases/download/v${PV}/v2ray-linux-64.zip -> yarwv-linux-amd64.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE="+ctl +dat"

DEPEND=""
RDEPEND="
	${DEPEND}
	!net-proxy/yarwv
"
BDEPEND=""

S="${WORKDIR}"

src_prepare() {
	mv v2ray yarwv
	dd if=/dev/zero of=yarwv bs=1KiB count=1 conv=notrunc oflag=append

	if use ctl; then
		mv v2ctl yarwvctl
		dd if=/dev/zero of=yarwvctl bs=1KiB count=1 conv=notrunc oflag=append
	fi
}

src_install() {
	dobin yarwv

	if use ctl; then
		dobin yarwvctl
	fi

	if use dat; then
		insinto /usr/share/yarwv
		doins *.dat
	fi

	insinto /etc/yarwv
	doins *.json

	newinitd "${FILESDIR}/yarwv.initd" yarwv
}

pkg_postinst() {
	fcaps CAP_NET_ADMIN /usr/bin/yarwv
	fcaps CAP_NET_BIND_SERVICE /usr/bin/yarwv
}
