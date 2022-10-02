# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} )
inherit distutils-r1

DESCRIPTION="Cloudflare DNS Authenticator plugin for Certbot"
HOMEPAGE="https://github.com/certbot/certbot"
SRC_URI="https://github.com/certbot/certbot/archive/v${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"

S="${WORKDIR}/certbot-${PV}/${PN}"

DEPEND=""
RDEPEND="
	${DEPEND}
	>=app-crypt/certbot-1.1.0[${PYTHON_USEDEP}]
	>=app-crypt/acme-0.29.0[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]
	>=dev-python/cloudflare-1.5.1[${PYTHON_USEDEP}]
"
BDEPEND=""
