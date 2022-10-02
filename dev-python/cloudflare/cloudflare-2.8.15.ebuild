# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )
inherit distutils-r1

DESCRIPTION="Python wrapper for the Cloudflare Client API v4"
HOMEPAGE="https://github.com/cloudflare/python-cloudflare "
SRC_URI="https://github.com/cloudflare/python-${PN}/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

PATCHES=( "${FILESDIR}"/cloudflare-2.8.15.patch )

S="${WORKDIR}/python-${P}"

DEPEND=""
RDEPEND="
	${DEPEND}
	dev-python/jsonlines[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/beautifulsoup[${PYTHON_USEDEP}]
"
BDEPEND=""
