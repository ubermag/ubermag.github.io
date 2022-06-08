=========
Changelog
=========

0.62.1 (Jun 09, 2022)
=====================

Fixed
-----

``discretisedfield``
  - Importing ``discretisedfield`` fails on some platforms because ``openh264`` is
    missing. (`#146 <https://github.com/ubermag/discretisedfield/pull/146>`__)

0.62.0 (May 22, 2022)
=====================

Added
-----

``discretisedfield``
  - Support for exporting ``Field`` object to the ``xarray.DataArray`` with
    ``to_xarray`` instance method (`#123
    <https://github.com/ubermag/discretisedfield/pull/123>`__).
  - Support for initiating ``Field`` object from the ``xarray.DataArray`` with
    ``from_xarray`` class method (`#123
    <https://github.com/ubermag/discretisedfield/pull/123>`__).
  - New implementation for initialising a field from an other field with much
    better performance (example: initial field with ``n=(100, 100, 10)``, new
    field with ``n=(10, 10, 10)``, speedup ~1000). This method does e.g. also
    speed up the ``Field.plane`` method (`#135
    <https://github.com/ubermag/discretisedfield/pull/135>`__).
  - The ``__contains__`` operator for the region (the `in` operator ``region1 in
    region2``) uses a new method to calculate the distance between the points to
    improve stability when edge points of the regions are very close and
    differences are mainly related to floating-point inaccuracies. This is done
    by introducing a new region property ``tolerance_factor`` (with a default
    value ``1e-12``) that is internally multiplied with the minimum of the edge
    lengths to obtain values for relative and absolute tolerance (`#135
    <https://github.com/ubermag/discretisedfield/pull/135>`__).
  - Refactoring of the matplotlib-based plotting methods for ``df.Field``
    (``df.Field.mpl...``) improve performance of the plot creation (`#133
    <https://github.com/ubermag/discretisedfield/pull/133>`__).
  - Refactoring of ``df.Region.mpl`` to show the correct aspect ratio of the
    region. This automatically also applies to the matplotlib-based plotting
    methods of ``df.Mesh``. A new keyword ``box_aspect`` (default
    ``box_aspect='auto'``) can be used to set an arbitrary aspect ratio by
    passing a tuple. For the default value ``'auto'`` the aspect of the region
    is used. You may run into problems with overlapping ticks or axis labels.
    These cannot currently be dealt with easily in an automatic fashion and
    require manual adjustment after the plot is created (by passing an axis
    object) if proper axis ticks and labels are required (`#134
    <https://github.com/ubermag/discretisedfield/pull/134>`__).
  - New implementation for reading and writing ``vtk`` files. Files can now be
    written in textual (``txt``), binary (``bin``) or xml (``xml``)
    representation. The field data is now stored to vtk cell data (previously:
    point data). Some subsequent plotting operations in other tools (e.g.
    plotting isosurfaces) typically requires a conversion from cell data to
    point data in that tools first (e.g. by using a filter in Paraview).
    ``discretisedfield`` can still read the old vtk files (with the values
    stored as point data) and tries to do that automatically when the provided
    file can't be read with the new method. In particular for writing huge
    speedups compared to the old implementation are possible (example: ``n=(200,
    200, 100)`` written in binary representation, speedup > 1000). By default
    data is written in binary format. (`#129
    <https://github.com/ubermag/discretisedfield/pull/129>`__)
  - A ``units`` property has been added to the ``Field`` class to store the
    units of the field values. Note, that units are mostly used for plotting and
    are removed during all mathematical operations. Units are automatically read
    from ``ovf`` files if present. (`#141
    <https://github.com/ubermag/discretisedfield/pull/141>`__)
  - An additional class method ``coordinate_field`` has been added to the
    ``Field`` class. It takes a mesh and creates a 3d vector field with values
    equal to the coordinates of the respective cell midpoints. (`#144
    <https://github.com/ubermag/discretisedfield/pull/144>`__)

``micromagneticdata``
  - Support for converting all magnetisation data of a ``Drive`` into an
    ``xarray.DataArray`` with ``to_xarray`` instance method. (`#18
    <https://github.com/ubermag/micromagneticdata/pull/18>`__)
  - Multiple drives of the same type (with the same independent variable
    ``drive.x`` can be combined into a new ``micromagneticdata.CombinedDrive``.
    Combining is also supported via ``drive1 << drive2`` which "appends"
    ``drive1`` to ``drive2``. The combined drive allows iteration over all
    magnetisation snapshots of the individual drives. (`#22
    <https://github.com/ubermag/micromagneticdata/pull/22>`__)

``oommfc``
  - When using the ``TimeDriver`` with ``verbose=2`` a simple status bar is
    displayed to show the simulation progress. Note, that the shown information
    is only a rough hint as the progress is measured based on the total number
    of steps ``n`` and the number of files already written to disk. (`#100
    <https://github.com/ubermag/oommfc/pull/100>`__)

``ubermagutil``
  - Utility functionality for setting up basic logging moved to ``ubermagutil``
    from ``ubermag``. (`#27 <https://github.com/ubermag/ubermagutil/pull/27>`__,
    `#133 <https://github.com/ubermag/ubermag/pull/133>`__)

Removed
-------

``ubermag``
  - Utility functionality for setting up basic logging moved to ``ubermagutil``
    from ``ubermag``. (`#27 <https://github.com/ubermag/ubermagutil/pull/27>`__,
    `#133 <https://github.com/ubermag/ubermag/pull/133>`__)

Fixed
-----

``discretisedfield``
  - Changes in the calculation of the demag tensor to avoid zero-division problems
    and ``nan`` values in the demag field. (`#137
    <https://github.com/ubermag/discretisedfield/pull/137>`__)
  - Wrong normalisation of the lightness component in lightness plots if not all
    angles are covered. (`commit 2de6360
    <https://github.com/ubermag/discretisedfield/pull/140/commits/2de6360ee23a2d59c4c710cbdb677794c4d44e31>`__)

``oommfc``
  - Using the ``DockerOOMMFRunner`` did not work in combination with SELinux
    because the directiories inside the docker image were not readable/writable.
    The ``DockerOOMMFRunner`` now has an additional optional argument to enable
    read/write access with SELinux (`#95
    <https://github.com/ubermag/oommfc/issues/95>`__).

0.61.2 (Mar 17, 2022)
=====================

Fixed
-----

``oommfc``
  - The old docker image of oommf (2.0a2) was used by default (`#84
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

Added
-----

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

Changed
-------

``discretisedfield``
  - Keywords for ``Field.mpl()`` renamed to ``scalar_kw`` and ``vector_kw``
    (`#108 <https://github.com/ubermag/discretisedfield/pull/108>`__).
  
``micromagneticmodel``
  - Variable names for time-dependent fields and currents changed (for
    consistency reasons).

Fixed
-----

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

Added
-----

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

Fixed
-----

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

Compatibility ``ubermag`` - ``OOMMF``
======================================

+---------+----------------------+--------+-------+--------------------+
| Ubermag | Ubermag release date | oommfc | OOMMF | OOMMF Docker image |
+=========+======================+========+=======+====================+
| 0.61.2  | 2022-03-17           | 0.61.1 | 2.0a3 | oommf/oommf:20a3   |
+---------+----------------------+--------+-------+--------------------+
| 0.61.0  | 2022-02-22           | 0.61.0 | 2.0a3 | oommf/oommf:20a3   |
+---------+----------------------+--------+-------+--------------------+
| 0.60.0  | 2021-10-01           | 0.60.0 | 2.0a2 | oommf/oommf:20a2   |
+---------+----------------------+--------+-------+--------------------+
| 0.51    | 2021-02-10           | 0.10.1 | 2.0a1 | ubermag/oommf      |
+---------+----------------------+--------+-------+--------------------+
