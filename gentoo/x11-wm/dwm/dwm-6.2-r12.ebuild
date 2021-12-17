# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3 savedconfig toolchain-funcs

DESCRIPTION="A dynamic window manager for X11"
HOMEPAGE="https://dwm.suckless.org/"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE="xinerama"

DEPEND=""
RDEPEND="
	${DEPEND}
	x11-libs/libX11
	x11-libs/libXft
	xinerama? ( x11-libs/libXinerama )
"
BDEPEND=""

EGIT_REPO_URI="https://git.suckless.org/dwm"
EGIT_COMMIT="a786211"

src_prepare() {
	default

	restore_config config.h
}

src_compile() {
	if use xinerama; then
		emake CC=$(tc-getCC) dwm
	else
		emake CC=$(tc-getCC) XINERAMAFLAGS="" XINERAMALIBS="" dwm
	fi
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	dodoc README
	dodoc LICENSE

	save_config config.h
}
