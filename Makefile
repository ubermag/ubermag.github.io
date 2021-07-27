# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = source
BUILDDIR      = build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

prepare:
	mkdir packages
	mkdir source/documentation/ipynb
	git clone --depth 1 "https://github.com/ubermag/discretisedfield.git" packages/discretisedfield
	git clone --depth 1 "https://github.com/ubermag/micromagneticdata.git" packages/micromagneticdata
	git clone --depth 1 "https://github.com/ubermag/micromagneticmodel.git" packages/micromagneticmodel
	git clone --depth 1 "https://github.com/ubermag/micromagnetictests.git" packages/micromagnetictests
	git clone --depth 1 "https://github.com/ubermag/oommfc.git" packages/oommfc
	git clone --depth 1 "https://github.com/ubermag/ubermag.git" packages/ubermag
	git clone --depth 1 "https://github.com/ubermag/ubermagtable.git" packages/ubermagtable
	git clone --depth 1 "https://github.com/ubermag/ubermagutil.git" packages/ubermagutil
	git clone --depth 1 "https://github.com/ubermag/workshop.git" packages/workshop

	cp packages/ubermag/docs/changelog.rst source/changelog.rst
	for PKG in discretisedfield micromagneticdata micromagneticmodel micromagnetictests oommfc ubermagtable ubermagutil ; do \
		cp -r "packages/$$PKG/docs/ipynb" "source/documentation/ipynb/$$PKG" ; \
	done
	cp -r packages/workshop/tutorials source/workshop/tutorials

clean:
	rm -rf packages source/changelog.rst source/workshop/tutorials source/documentation/ipynb source/api/_autosummary

.PHONY: help prepare clean Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
