# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit fcaps

DESCRIPTION="A platform for building proxies to bypass network restrictions."
HOMEPAGE=" https://www.v2ray.com/"
SRC_URI="https://github.com/v2ray/v2ray-core/releases/download/v${PV}/v2ray-linux-64.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_install() {
	dobin v2ray
	dobin v2ctl

	insinto /usr/share/v2ray
	doins *.dat

	insinto /etc/v2ray
	doins *.json

	newinitd "${FILESDIR}/v2ray.initd" v2ray
}

pkg_postinst() {
	fcaps CAP_NET_ADMIN /usr/bin/v2ray
	fcaps CAP_NET_ADMIN /usr/bin/v2ctl
}
