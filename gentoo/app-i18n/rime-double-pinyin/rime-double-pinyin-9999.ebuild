# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3

DESCRIPTION="Double pinyin solution of rime"
HOMEPAGE="https://github.com/rime/rime-double-pinyin"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="
	${DEPEND}
	app-i18n/rime-data
"
BDEPEND=""

EGIT_REPO_URI="https://github.com/rime/rime-double-pinyin.git"
EGIT_COMMIT="69bf85d"

src_install() {
	insinto /usr/share/${PN}
	doins AUTHORS README.md LICENSE

	insinto /usr/share/rime-data
	doins *.schema.yaml
}
