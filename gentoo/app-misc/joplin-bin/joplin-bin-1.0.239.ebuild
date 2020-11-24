# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="a free, open source note taking and to-do application, which can
handle a large number of notes organised into notebooks"
HOMEPAGE="https://joplinapp.org/"
SRC_URI="https://github.com/laurent22/joplin/releases/download/v${PV}/Joplin-${PV}.AppImage"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="
	${DEPEND}
	sys-fs/fuse

"
BDEPEND=""

src_unpack() {
	mkdir ${S}
	cp ${DISTDIR}/Joplin-${PV}.AppImage ${S}
}

src_install() {
	exeinto /usr
	doexe Joplin-${PV}.AppImage 
	newbin Joplin-${PV}.AppImage Joplin
}
