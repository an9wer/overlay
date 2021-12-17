# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3 savedconfig toolchain-funcs

DESCRIPTION="Tab interface for application supporting Xembed"
HOMEPAGE="https://tools.suckless.org/tabbed/"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

DEPEND=""
RDEPEND="
	${DEPEND}
	x11-libs/libX11
	x11-libs/libXft
"
BDEPEND=""

EGIT_REPO_URI="https://git.suckless.org/tabbed"
EGIT_COMMIT="dabf6a2"

src_prepare() {
	default

	restore_config config.h
}

src_compile() {
	emake CC=$(tc-getCC)
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	dodoc README
	dodoc LICENSE

	save_config config.h
}
