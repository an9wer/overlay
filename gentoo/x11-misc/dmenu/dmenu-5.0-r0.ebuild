# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3 savedconfig toolchain-funcs

DESCRIPTION=""
HOMEPAGE="https://tools.suckless.org/dmenu/"
SRC_URI=""

LICENSE="MIT/X Consortium License"
SLOT="0"
KEYWORDS="amd64"
IUSE="xinerama"

DEPEND=""
RDEPEND="
	${DEPEND}
	x11-libs/libXft
	x11-libs/libX11
	xinerama? ( x11-libs/libXinerama )
"
BDEPEND=""

EGIT_REPO_URI="https://git.suckless.org/dmenu"
EGIT_COMMIT="1a13d04"

src_prepare() {
	default

	restore_config config.h
}


src_compile() {
	if use xinerama; then
		emake CC=$(tc-getCC)
	else
		emake CC=$(tc-getCC) XINERAMAFLAGS="" XINERAMALIBS=""
	fi
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	dodoc README
	dodoc LICENSE

	save_config config.h
}
