=========
Changelog
=========

0.61.2 (Mar 17, 2022)
=====================

Bug fixes
---------

``oommfc``
  - The old docker image of oommf (2.0a2 was used by default (`#84
    <https://github.com/ubermag/oommfc/pull/84>`__).
  - Two time-dependent Zeeman terms have the same time dependence and/or result
    in a runtime error (`#198 <https://github.com/ubermag/help/issues/198>`__).

0.61.0 (Feb 22, 2022)
=====================

General
-------

- Support Cnv, D2d, and T(O) crystallographic class DMI and magneto-elastic
  (MEL) extensions in conda-installed Ubermag on Windows, in addition to MacOS
  and Linux.

New functionality
-----------------

``discretisedfield``
  - Support for ``filter_field`` in plotting method ``Field.mpl.lighness``.
  - HTML representation for ``Region``, ``Mesh``, ``Field``, and
    ``FieldRotator`` inside Jupyter notebook (`#105
    <https://github.com/ubermag/discretisedfield/pull/105>`__).
  - Datatype for ``Field`` can be specified (`#114
    <https://github.com/ubermag/discretisedfield/pull/114>`__, `#118
    <https://github.com/ubermag/discretisedfield/pull/118>`__).
  - New implementation for the Field initialisation significantly improves
    performance when initialising a field with a dictionary. Speedups of up to
    ~10_000 can be obtained if the dictionary does not contain callables. (`#114
    <https://github.com/ubermag/discretisedfield/pull/114>`__, `#117
    <https://github.com/ubermag/discretisedfield/pull/117>`__)
  - New implementation for reading and writing ``ovf`` (``omf``) files with huge
    performance improvements. For a ``Field`` containing 1 million cells we
    obtained the following execution times (on a standard notebook):

    +------+----------+----------------------------+------------------------------+
    | mode | filesize | reading                    | writing                      |
    |      |          +---------+--------+---------+----------+---------+---------+
    |      |          | old     | new    | speedup | old      | new     | speedup |
    +======+==========+=========+========+=========+==========+=========+=========+
    | bin4 | 2.9M     | 1730 ms | 21 ms  |      82 | 63000 ms | 56 ms   |    1125 |
    +------+----------+---------+--------+---------+----------+---------+---------+
    | bin8 | 5.8M     | 1860 ms | 52 ms  |      52 | 64000 ms | 84 ms   |     762 |
    +------+----------+---------+--------+---------+----------+---------+---------+
    | text | 15M      | 4920 ms | 401 ms |      12 | 69000 ms | 4510 ms |      15 |
    +------+----------+---------+--------+---------+----------+---------+---------+
    
    The new default is ``bin8`` (binary represenation with double precision)
    instead of ``txt`` (`#121
    <https://github.com/ubermag/discretisedfield/pull/121>`__).

``oommfc``
  - Enables Cnv, D2d, and T(O) crystallographic class DMI and magneto-elastic
    (MEL) extensions on Windows hosts (no more need for Docker).
    ``ExeOOMMFRunner`` can be used on Windows. *Limitation*: On Windows it is
    not possible to run multiple simulations in parallel without using Docker.
  - OOMMF output is now by default written in binary format (double precision).
    There is a new option in the driver's ``drive`` method (``ovf_format``) to
    change the output format (`#77
    <https://github.com/ubermag/oommfc/pull/77>`__).
  - OOMMF can now run silently without anything printed. To use it pass the
    option ``verbose=0`` to ``<DRIVER>.drive``. The default is ``verbose=1``
    which prints one summary line about the used runner and the runtime. This is
    the old behaviour. (`#80 <https://github.com/ubermag/oommfc/pull/80>`__).

Backwards-incompatible changes
------------------------------

``discretisedfield``
  - Keywords for ``Field.mpl()`` renamed to ``scalar_kw`` and ``vector_kw``
    (`#108 <https://github.com/ubermag/discretisedfield/pull/108>`__).
  
``micromagneticmodel``
  - Variable names for time-dependent fields and currents changed (for
    consistency reasons).

Bug fixes
---------

``discretisedfield``
  - Simultaneous use of ``filter_field`` and ``symmetric_clim`` in
    ``Field.mpl.scalar`` resulted in wrong colorbar limits (`#106
    <https://github.com/ubermag/discretisedfield/issues/106>`__).

``oommfc``
  - Specifying two Zeeman fields with H defined via a ``df.Field`` broke the
    simulation (`#191 <https://github.com/ubermag/help/issues/191>`__)
  - The name of the hysteresis field of the ``HysteresisDriver`` has been
    renamed to ``B_hysteresis``. This solves an issue of having two magnetic
    fields with the same name if a hysteresis simulation is performed with an
    additional zeeman field.

0.60.0 (Oct 1, 2021)
====================

General
-------

- Unified website containing all documentation: https://ubermag.github.io
- Versions in sync across all packages
- Switch to Jupyter lab 3 (should improve situation with ``K3d`` inside Jupyter lab).

New functionality
-----------------

``discretisedfield``
  - Fourier transform for ``discretisedfield.Field`` (`reference
    <https://ubermag.github.io/api/_autosummary/discretisedfield.Field.html#discretisedfield.Field.fftn>`__).
  - Custom labels for vector components in ``discretisedfield.Field``
    (`reference
    <https://ubermag.github.io/api/_autosummary/discretisedfield.Field.html#discretisedfield.Field.components>`__).
  - New plotting interface for ``discretisedfield.Field`` and
    ``discretisedfield.Region`` for both ``matplotlib`` and ``K3d``. Plotting
    functions can be accessed as ``Field.mpl.*`` (and for convenience
    ``Field.mpl()``) for ``matplotlib`` and similarly for ``K3d``.
  - Improved lightness plotting and new contour line plot.
  - Full support for complex values in ``discretisedfield.Field``.
  - Rotations of ``discretisedfield.Field`` objects (`documentation
    <https://ubermag.github.io/documentation/ipynb/discretisedfield/field-rotations.html>`__).
  - ``discretisedfield.Field`` now supports all ``numpy ufuncs``.
  - Calculation of the demag tensor and demag field in
    ``discretisedfield.tools`` (`reference
    <https://ubermag.github.io/api/_autosummary/discretisedfield.tools.demag_tensor.html>`__).

``mag2exp``
  - New subpackage ``mag2exp`` to simulate experimental measurement
    (`documentation <https://ubermag.github.io/documentation/mag2exp.html>`__).

``micromagneticmodel``
  - Generalisation of OOMMF extensions ``DMI_Cnv`` and ``DMI_D2d`` to support
    grains oriented along ``x``, ``y``, or ``z`` (new names, e.g. ``DMI_Cnv_z``)
    (`documentation
    <https://ubermag.github.io/documentation/ipynb/micromagneticmodel/energy-terms.html#5.-Dzyaloshinskii-Moriya-energy>`__).
  - Support for arbitrary time-dependence for external magnetic fields
    (``micromagneticmodel.Zeeman``) and spin-polarised currents
    (``micromagneticmodel.Slonczewski`` and ``micromagneticmodel.ZhangLi``)
    (`documentation <https://ubermag.github.io/documentation/ipynb/oommfc/time-dependent-field-current.html>`__).

``oommfc``
  - Support for OOMMF extension ``Xf_ThermHeunEvolver``,
    ``Xf_ThermSpinXferEvolver``, and ``UHH_ThetaEvolve`` for simulations at finite
    temperature.
  - Control over the default runner in ``oommfc`` via ``oommfc.runner`` object
    (`documentation
    <https://ubermag.github.io/documentation/ipynb/oommfc/controlling-default-runner.html>`__).

``ubermag``
  - Convenient control over logging of all subpackages via
    ``ubermag.setup_logging`` (`documentation <https://ubermag.github.io/documentation/ipynb/ubermag/logging.html>`__).

``ubermagtable``
  - Fourier transform for ``ubermagtable`` (`documentation
    <https://ubermag.github.io/documentation/ipynb/ubermagtable/table-fft.html>`__).

Bug fixes
---------

``discretisedfield``
  - Wrong colourbar positioning in ``discretisedfield.mpl*`` in figures containing
    multiple subplots.
  - Fixed aspect ratio for ``quiver`` plots in ``discretisedfield.Field``.

``micromagneticmodel``
  - Creating a term ``micromagneticmodel.Slonczewski`` twice with the same
    dictionary for ``P`` or ``Lambda`` results in a ``ValueError``

``oommfc``
  - Removing a current term and driving the system caused a ``TypeError`` (`#135
    <https://github.com/ubermag/help/issues/135>`__).
  - ``oommfc.compute`` now works when current terms are specified in
    ``system.dynamics`` (`#139 <https://github.com/ubermag/help/issues/139>`__).
  - Wrong compute number in ``oommfc``.
  - ``oommfc`` is choosing the wrong runner when using ``pyenv`` (`#172
    <https://github.com/ubermag/help/issues/172>`__).

``ubermagtable``
  - Error in reading ODT files when using magnetoelastic extension (`#14
    <https://github.com/ubermag/ubermagtable/issues/14>`__).
  - Multiple columns with the same name in ``ubermagtable`` (`#118
    <https://github.com/ubermag/help/issues/118>`__).

0.51 (Feb 10, 2021)
===================

- New subpackage ``discretisedfield.tools`` containing functions to operate on
  ``discretisedfield.Field`` objects.
- New integration syntax.
