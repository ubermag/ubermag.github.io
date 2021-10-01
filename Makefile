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
	git clone -b stable --depth 1 "https://github.com/ubermag/discretisedfield.git" packages/discretisedfield
	git clone -b stable --depth 1 "https://github.com/ubermag/micromagneticdata.git" packages/micromagneticdata
	git clone -b stable --depth 1 "https://github.com/ubermag/micromagneticmodel.git" packages/micromagneticmodel
	git clone -b stable --depth 1 "https://github.com/ubermag/micromagnetictests.git" packages/micromagnetictests
	git clone -b stable --depth 1 "https://github.com/ubermag/oommfc.git" packages/oommfc
	git clone -b stable --depth 1 "https://github.com/ubermag/ubermag.git" packages/ubermag
	git clone -b stable --depth 1 "https://github.com/ubermag/mag2exp.git" packages/mag2exp
	git clone -b stable --depth 1 "https://github.com/ubermag/ubermagtable.git" packages/ubermagtable
	git clone -b stable --depth 1 "https://github.com/ubermag/ubermagutil.git" packages/ubermagutil
	git clone --depth 1 "https://github.com/ubermag/workshop.git" packages/workshop
	git clone --depth 1 "https://github.com/ubermag/devtools.git" packages/devtools

	for PKG in discretisedfield mag2exp micromagneticdata micromagneticmodel micromagnetictests oommfc ubermagtable ubermagutil ubermag ; do \
		cp -r "packages/$$PKG/docs" "source/documentation/ipynb/$$PKG" ; \
	done
	cp -r packages/workshop/tutorials source/workshop/tutorials

clean:
	rm -rf packages source/workshop/tutorials source/documentation/ipynb source/api/_autosummary

.PHONY: help prepare clean Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
