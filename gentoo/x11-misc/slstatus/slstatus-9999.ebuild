# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3 savedconfig toolchain-funcs

DESCRIPTION="A suckless status monitor for window managers that use WM_NAME
(e.g. dwm) or stdin to fill the status bar"
HOMEPAGE="https://tools.suckless.org/slstatus/"
SRC_URI=""

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="
	${DEPEND}
	x11-libs/libX11
"
BDEPEND=""

EGIT_REPO_URI="https://git.suckless.org/slstatus"
EGIT_COMMIT="84a2f11"

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
