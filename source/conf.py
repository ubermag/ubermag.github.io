# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#
# import os
# import sys
# sys.path.insert(0, os.path.abspath('..'))

# -- Project information -----------------------------------------------------

project = 'ubermag'
copyright = '2021, Marijan Beg and Hans Fangohr'
author = ('Marijan Beg, Martin Lang, Ryan A. Pepper, Thomas Kluyver, '
          'Jeroen Mulkers, Jonathan Leliaert, and Hans Fangohr')


# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [
    'sphinx.ext.autodoc',
    'sphinx.ext.autosummary',
    'sphinx.ext.githubpages',  # creates .nojekyll file in HTML directory
    'sphinx.ext.mathjax',
    'sphinx.ext.napoleon',
    'matplotlib.sphinxext.plot_directive',
    'nbsphinx',
    'sphinx_copybutton',
]

# matplotlib plot directive
plot_include_source = True
plot_formats = [("png", 90)]
plot_html_show_formats = False
plot_html_show_source_link = False

# arguments for nbsphinx, see
# https://nbsphinx.readthedocs.io/en/0.8.6/usage.html#nbsphinx_execute_arguments
# TODO does not seem to have any effect
nbsphinx_execute_arguments = [
    "--InlineBackend.figure_formats={'svg'}",
    "--InlineBackend.rc=figure.dpi=96",
]

# Strip input prompts from code cells
copybutton_prompt_text = r'>>> |\.\.\. |\$ '
copybutton_prompt_is_regexp = True

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = ['**/*index.ipynb']


# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
html_theme = 'pydata_sphinx_theme'
html_logo = "_static/logoL.png"
html_sidebars = {
    "**": ["sidebar-nav-bs"],
    "installation": [],
    "quickstart": [],
    "help": [],
    "index": [],
}
html_favicon = "_static/favicon.ico"
html_theme_options = {
    "icon_links": [
        {
            "name": "GitHub",
            "url": "https://github.com/ubermag",
            "icon": "fab fa-github-square",
        },
    ],
    "show_toc_level": 1,
    "navbar_end": ["navbar-icon-links.html", "search-field.html"]
}

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['_static']
html_extra_path = ['./quickstart.html']

# -- Custom configuration ----------------------------------------------------

autosummary_generate = True
autosummary_imported_members = True
autosummary_context = {
    'excluded_members': ['__radd__', '__rand__', '__rlshift__', '__rmatmul__',
                         '__rmul__', '__rsub__', '__rtruediv__', '__delattr__',
                         '__format__', '__ge__', '__getattribute__', '__gt__',
                         '__init__', '__init_subclass__', '__le__', '__lt__',
                         '__ne__', '__new__', '__reduce__', '__reduce_ex__',
                         '__setattr__', '__sizeof__', '__str__',
                         '__subclasshook__', '__hash__'],
    'excluded_classes': ['Rotation'],  # hide mag2exp.sans.Rotation (from scipy)
    'included_submodules': ['discretisedfield.plotting',
                            'discretisedfield.tools',
                            'discretisedfield.ovf2vtk',
                            'mag2exp.ltem',
                            'mag2exp.x_ray',
                            'mag2exp.sans',
                            'mag2exp.mfm',
                            'mag2exp.magnetometry',
                            'mag2exp.quick_plots',
                            'micromagneticmodel.abstract',
                            'micromagneticmodel.consts',
                            'micromagneticmodel.examples',
                            'micromagnetictests.calculatortests',
                            'oommfc.oommf',
                            'ubermagtable.util',
                            'ubermagutil.typesystem',
                            'ubermagutil.units']
}

autoclass_content = 'class'
autodoc_inherit_docstrigs = True
autodoc_default_options = {
    'member-order': 'groupwise',
    'exclude-members': '__init__, __weakref__'
}
