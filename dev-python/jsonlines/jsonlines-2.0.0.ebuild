# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} )
inherit distutils-r1

DESCRIPTION="A Python library to simplify working with jsonlines and ndjson data"
HOMEPAGE="https://github.com/wbolster/jsonlines https://jsonlines.readthedocs.org"
SRC_URI="https://github.com/wbolster/${PN}/archive/${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
