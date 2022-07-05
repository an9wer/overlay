# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3 savedconfig toolchain-funcs

DESCRIPTION="An efficient dynamic menu for X"
HOMEPAGE="https://tools.suckless.org/dmenu/"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE="xinerama app blog pass"

DEPEND=""
RDEPEND="
	${DEPEND}
	x11-libs/libXft
	x11-libs/libX11
	xinerama? ( x11-libs/libXinerama )
	pass? ( app-admin/pass x11-misc/xdotool )
"
BDEPEND=""

EGIT_REPO_URI="https://git.suckless.org/dmenu"
EGIT_COMMIT="d78ff08"

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

	if use app; then
		newbin ${FILESDIR}/dmenu_app dmenu_app
		newbin ${FILESDIR}/dmenu_app_run dmenu_app_run
	fi

	if use blog; then
		newbin ${FILESDIR}/dmenu_blog dmenu_blog
		newbin ${FILESDIR}/dmenu_blog_run dmenu_blog_run
	fi

	if use pass; then
		newbin ${FILESDIR}/dmenu_pass dmenu_pass
		newbin ${FILESDIR}/dmenu_pass_run dmenu_pass_run
	fi

	save_config config.h
}
