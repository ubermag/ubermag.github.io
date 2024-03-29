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
	mkdir source/documentation/notebooks
	mkdir source/examples/notebooks
	mkdir source/getting-started/notebooks

	git clone -b latest --depth 1 "https://github.com/ubermag/discretisedfield.git" packages/discretisedfield
	git clone -b latest --depth 1 "https://github.com/ubermag/micromagneticdata.git" packages/micromagneticdata
	git clone -b latest --depth 1 "https://github.com/ubermag/micromagneticmodel.git" packages/micromagneticmodel
	git clone -b latest --depth 1 "https://github.com/ubermag/micromagnetictests.git" packages/micromagnetictests
	git clone -b latest --depth 1 "https://github.com/ubermag/oommfc.git" packages/oommfc
	git clone -b latest --depth 1 "https://github.com/ubermag/ubermag.git" packages/ubermag
	git clone -b latest --depth 1 "https://github.com/ubermag/mag2exp.git" packages/mag2exp
	git clone -b latest --depth 1 "https://github.com/ubermag/ubermagtable.git" packages/ubermagtable
	git clone -b latest --depth 1 "https://github.com/ubermag/ubermagutil.git" packages/ubermagutil
	git clone -b latest --depth 1 "https://github.com/ubermag/tutorials.git" packages/tutorials

	for PKG in discretisedfield mag2exp micromagneticdata micromagneticmodel micromagnetictests oommfc ubermagtable ubermagutil ubermag ; do \
		rsync -a "packages/$$PKG/docs/" "source/documentation/notebooks/$$PKG" ; \
	done
	rsync -a packages/tutorials/getting-started/ source/getting-started/notebooks
	rsync -a packages/tutorials/examples/ source/examples/notebooks
	cp packages/tutorials/demo.ipynb source/demo.ipynb

prepare-local:
	if [ ! -d source/documentation/notebooks ]; then \
		mkdir source/documentation/notebooks; \
	fi

	for PKG in discretisedfield mag2exp micromagneticdata micromagneticmodel micromagnetictests oommfc ubermagtable ubermagutil ubermag ; do \
		rsync -a "../$$PKG/docs/" "source/documentation/notebooks/$$PKG" ;\
	done

	if [ ! -d source/getting-started/notebooks ]; then \
		mkdir source/getting-started/notebooks; \
	fi
	rsync -a ../tutorials/getting-started/ source/getting-started/notebooks

	if [ ! -d source/examples/notebooks ]; then \
		mkdir source/examples/notebooks; \
	fi
	rsync -a ../tutorials/examples/ source/examples/notebooks

	rsync -a ../tutorials/demo.ipynb source/demo.ipynb

clean:
	rm -rf packages source/documentation/notebooks source/examples/notebooks source/getting-started/notebooks source/api/_autosummary source/demo.ipynb

.PHONY: help prepare clean Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
