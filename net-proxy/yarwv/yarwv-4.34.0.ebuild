# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit fcaps go-module

DESCRIPTION="A platform for building proxies to bypass network restrictions"
HOMEPAGE="https://www.v2ray.com/"
SRC_URI="https://github.com/v2fly/v2ray-core/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE="+ctl"

DEPEND=""
RDEPEND="
	${DEPEND}
	!net-proxy/v2ray-bin
"
BDEPEND="dev-lang/go"

S="${WORKDIR}/v2ray-core-${PV}"

src_compile() {
	ego build -v -trimpath -o "bin/${PN}" -ldflags "-s -w" ./main
	if use ctl; then
		ego build -v -trimpath -o "bin/${PN}ctl" -ldflags "-s -w" -tags confonly ./infra/control/main
	fi
}

src_install() {
	dobin bin/${PN}
	if use ctl; then
		dobin bin/${PN}ctl
	fi

	insinto /etc/${PN}
	doins release/config/*.json

	newinitd "${FILESDIR}/${PN}.initd" ${PN}
}

pkg_postinst() {
	fcaps CAP_NET_ADMIN /usr/bin/${PN}
	fcaps CAP_NET_BIND_SERVICE /usr/bin/${PN}
}
