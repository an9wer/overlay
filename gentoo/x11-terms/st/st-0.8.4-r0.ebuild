# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3 savedconfig toolchain-funcs

DESCRIPTION="simple terminal implementation for X"
HOMEPAGE="https://st.suckless.org/"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="
	${DEPEND}
	x11-libs/libXft
	x11-libs/libX11
"
BDEPEND=""

EGIT_REPO_URI="https://git.suckless.org/st"
EGIT_COMMIT="fa253f0"

src_prepare() {
	default

	restore_config config.h
}

src_compile() {
	emake PKG_CONFIG=$(tc-getPKG_CONFIG) CC=$(tc-getCC) st
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	dodoc README
	dodoc LICENSE

	save_config config.h
}
