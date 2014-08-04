# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 python3_3 python3_4 )

inherit distutils-r1

DESCRIPTION="Media asset management for Python"
HOMEPAGE="http://github.com/miracle2k/webassets/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc examples test"

DEPEND="
	${PYTHON_DEPS}
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/tox[${PYTHON_USEDEP}]
	)
"
RDEPEND="
	${PYTHON_DEPS}
	~dev-nodejs/clean-css-1.0.2
	~dev-nodejs/coffee-script-1.6.2
	dev-nodejs/handlebars
	dev-nodejs/less
	~dev-nodejs/requirejs-2.1.11
	dev-nodejs/stylus
	dev-nodejs/typescript
	~dev-nodejs/uglify-js-2.3.1
	dev-python/closure[${PYTHON_USEDEP}]
	dev-python/cssutils[${PYTHON_USEDEP}]
	dev-python/glob2[${PYTHON_USEDEP}]
	>=dev-python/jinja-2.5[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/yuicompressor[${PYTHON_USEDEP}]
	~dev-ruby/compass-0.12.6
	~dev-ruby/sass-3.2.19
	$(python_gen_cond_dep 'dev-python/clevercss[${PYTHON_USEDEP}]' 'python2*')
	$(python_gen_cond_dep 'dev-python/cssmin[${PYTHON_USEDEP}]' 'python2*')
	$(python_gen_cond_dep 'dev-python/pillow[${PYTHON_USEDEP}]' 'python2*')
	$(python_gen_cond_dep 'dev-python/pyScss[${PYTHON_USEDEP}]' 'python2*')
	$(python_gen_cond_dep 'dev-python/slimmer[${PYTHON_USEDEP}]' 'python2*')
"

python_compile_all() {
	use doc && emake -C doc html
}

python_test() {
	tox || die 'tox'
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/_build/html/. )
	use examples && local EXAMPLES=( examples/. )

	distutils-r1_python_install_all
}
