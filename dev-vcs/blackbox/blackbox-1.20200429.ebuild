# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Safely store secrets in Git/Mercurial/Subversion"
HOMEPAGE="https://github.com/StackExchange/blackbox"
SRC_URI="https://github.com/StackExchange/${PN}/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

#PATCHES=( "${FILESDIR}"/Makefile.patch )

src_install() {
	for bin in $(find bin -type f -iname "*" ! -iname "Makefile"); do
		dobin $bin
	done
	dodoc README.md
	dodoc LICENSE.txt
}
