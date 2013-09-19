# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 python3_2 python3_3 )

inherit distutils-r1

DESCRIPTION="Tool to submit code to Gerrit"
HOMEPAGE="https://pypi.python.org/pypi/git-review"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="apache-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="
	${DEPEND}
	virtual/python-argparse[${PYTHON_USEDEP}]
	"
