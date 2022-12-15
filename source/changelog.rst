=========
Changelog
=========

0.66.0 (Oct 20, 2022)
=====================

Added
-----

``discretisedfield``
  - Reading and writing for ``Field`` objects now supports ``pathlib.Path``
    objects. Furthermore, the code has been reorganised (mostly invisible for
    end users, a new ``io`` submodule has been added). (`#158
    <https://github.com/ubermag/discretisedfield/pull/158>`__)
  - Subregions are saved in a json file
    (``<field-name>.<extension>.subregions.json``) when saving a field and
    automatically loaded when a field is loaded from disk and the json file
    exists. (`#158 <https://github.com/ubermag/discretisedfield/pull/158>`__,
    `#163 <https://github.com/ubermag/discretisedfield/pull/163>`__)

``micromagneticdata``
  - Subregion information is loaded when accessing magnetisation fields (if
    available). (`#35 <https://github.com/ubermag/micromagneticdata/pull/35>`__)
  - Callbacks can be registered in the drive object to apply any sort of
    processing (e.g. calculating the normalised field or topological charge
    density) before returning individual fields in a drive. (`#35
    <https://github.com/ubermag/micromagneticdata/pull/35>`__)
  - Support for slicing in getitem in Drive, e.g. ``drive[::2]`` will return a
    new drive object that only contains every second magnetisation file. (`#35
    <https://github.com/ubermag/micromagneticdata/pull/35>`__)

``oommfc``
  - Subregion information is loaded when using ``compute`` (if available).
    (`#116 <https://github.com/ubermag/oommfc/pull/116>`__)

Changed
-------

``discretisedfield``
  - Plotting for ``Mesh`` class moved to new submodule similar to ``Region`` and
    ``Field``. Therefore ``mesh.mpl_subregions`` has to be replaced with
    ``mesh.mpl.subregions``. (`#164
    <https://github.com/ubermag/discretisedfield/pull/164>`__)
  - New implementation for Holoviews-based plotting to improve creation speed
    for large objects. (`#194
    <https://github.com/ubermag/discretisedfield/pull/194>`__, `#196
    <https://github.com/ubermag/discretisedfield/pull/196>`__)

``micromagneticdata``
  - Holoviews plotting now reads data from disk when it is accessed in the plot.
    This greatly improves the initial rendering of the plot and can avoid memory
    problems. Note that on slow file systems updating the plot when moving a
    slider might take more time. (`#35
    <https://github.com/ubermag/micromagneticdata/pull/35>`__)

Fixed
-----

``discretisedfield``
  - Missing initialisation when computing ``field.orientation`` for a field with
    zero norm in some cells. (`commit 4a8fca4
    <https://github.com/ubermag/discretisedfield/commit/ee26389c5768f092aa358701ba409014d01bbc6e>`__)

0.65.0 (Jul 17, 2022)
=====================

Changed
-------

``discretisedfield``
  - Import ``discretisedfield.tools`` into ``discretisedfield``. (`#159
    <https://github.com/ubermag/discretisedfield/pull/159>`__)
  - Scale the size and shape of the colorbar on ``mpl`` plots so the colorbar
    dynamically changes with axes size (`#159
    <https://github.com/ubermag/discretisedfield/pull/159>`__)

``micromagneticdata``
  - Rewrite of the ``to_xarray`` method to improve performance and reduced
    memory consumption. The maximum memory consumption is now roughly equivalent
    to the on-disk size of the data. The old method had a roughly doubled peak
    memory consumption. (`#33
    <https://github.com/ubermag/micromagneticdata/pull/33>`__)

``micromagneticmodel``
  - Fix the LaTex representation of Landau-Lifshitz-Gilbert equation in the
    presence of Zhang-Li and Slonczewski torque terms. (`#52
    <https://github.com/ubermag/micromagneticmodel/pull/52>`__)

0.64.0 (Jul 03, 2022)
=====================

``mumax3c``
  A new package ``mumax3c`` has been added and allows users to use
  mumax\ :sup:`3` as a new calculator in addition to OOMMF.

0.63.0 (Jun 29, 2022)
=====================

Added
-----

``discretisedfield``
  - Support for interactive plots based on Holoviews with ``Field.hv``
    convenience method, ``Field.hv.scalar``, ``Field.hv.vector``, and
    ``Field.hv.contour``. Refer to the package documentation for details. (`#140
    <https://github.com/ubermag/discretisedfield/pull/140>`__)

``micromagneticdata``
  - Two new drive classes ``OOMMFDrive`` and ``Mumax3Drive`` have been added.
    Users should not create these directly. Instead the generic ``Drive`` class
    should be used which automatically creates an object of the correct sub-type
    depending on the information found for the respective drive. (`#29
    <https://github.com/ubermag/micromagneticdata/pull/29>`__)
  - Interactive Holoviews-based plotting for drives with ``drive.hv`` property.
    It provides the same functionality as ``Field.hv``. (`#26
    <https://github.com/ubermag/micromagneticdata/pull/26>`__)

``micromagneticmodel``
  - User-defined name for a Zeeman energy term is displayed in its LaTex
    representation in the Jupyter notebook. (`#45
    <https://github.com/ubermag/micromagneticmodel/pull/45>`__)
  - Containers (``system.energy`` and ``system.dynamics``) have a new method
    ``get(type=...)`` to get all terms in the container that have the specified
    type. (`# 50
    <https://github.com/ubermag/micromagneticmodel/pull/50/files>`__)
  - Containers (``system.energy`` and ``system.dynacmics``) now support
    ``container[index]`` (``__getitem__``) to obtain a term by its index. (`#50
    <https://github.com/ubermag/micromagneticmodel/pull/50/files>`__)

``oommfc``
  - The input for OOMMF (``mif`` file and related files) can now be created
    without starting the actual simulation using ``Driver.write_mif(...)``.
    (`#104 <https://github.com/ubermag/oommfc/pull/104>`__)
  - A drive (call to OOMMF) can be sent to a scheduling system such as Slurm
    using ``Drive.schedule(...)``. All input files (``mif`` file and related
    files) are created from the running Python program. The user must pass the
    submission command of the scheduling system and a "header" file that defines
    system resources as required for the scheduling system. Furthermore, it is
    the user's responsibility to ensure that OOMMF is available inside the
    scheduled job (e.g. by loading the correct conda environment in the header
    file). The command line to call OOMMF is added to the header file, the file
    is saved to the drive directory and subsequently a job is submitted to the
    scheduling system. (`#104 <https://github.com/ubermag/oommfc/pull/104>`__)
  - The ``OOMMFRunner`` classes take an additional argument ``dry_run`` to
    return the OOMMF command call instead of calling OOMMF from a subprocess.
    (`#104 <https://github.com/ubermag/oommfc/pull/104>`__)

``ubermagutil``
  - Context manager to change directories. (`#29
    <https://github.com/ubermag/ubermagutil/pull/29>`__)
  - Generic utilities to show progress information for calculators. Users
    generally don't use any of this functionality directly. (`#31
    <https://github.com/ubermag/ubermagutil/pull/31>`__)

Changed
-------

``discretisedfield``
  - Vector fields with zero values can now be normalised. The rescaling of the
    vectors is only done for non-zero values. (`#149
    <https://github.com/ubermag/discretisedfield/pull/149/files>`__)

``mag2exp``
  - All functions do now operate on ``discretisedfield.Field`` objects instead
    of ``micromagneticmodel.System`` objects. Therefore, measurements can be
    simulated for data that has not been created with a micromagnetic simulation
    as long as the data can be represented as a ``discretisedfield.Field``
    object. (`#31 <https://github.com/ubermag/mag2exp/pull/31>`__)

``micromagneticmodel``
  - Comparison of ``micromagneticmodel.Term`` objects (e.g.
    ``micromagneticmodel.Exchange``) now takes into account all attributes of
    the two terms. Previously, only the names of the two terms were compared.
    (`#46 <https://github.com/ubermag/micromagneticmodel/pull/46>`__)

``oommfc``
  - The ``overhead`` function now runs the simulations in a temporary directory.
    (`#110 <https://github.com/ubermag/oommfc/pull/110>`__)

Fixed
-----

``discretisedfield``
  - Wrong normalisation of the lightness component in lightness plots if not all
    angles are covered. (`commit 2de6360
    <https://github.com/ubermag/discretisedfield/pull/140/commits/2de6360ee23a2d59c4c710cbdb677794c4d44e31>`__)
  - Checks if a point is inside a ``Region`` (``point in region``) give wrong
    results if the points are inside the region in some spatial direction and at
    the region boundary (outside within the numerical precision) in the other
    spatial directions failed despite the point being in the region. (`#153
    <https://github.com/ubermag/discretisedfield/pull/153>`__)

``micromagneticdata``
  - ``data[index]`` returns a drive for drive numbers ``index`` larger than the
    maximum drive number on disk (by computing module of index). (`#24
    <https://github.com/ubermag/micromagneticdata/pull/24>`__)

``oommfc``
  - The progress bar did not stop on ``KeyboardInterrupt``. (`#103
    <https://github.com/ubermag/oommfc/pull/103>`__)
  - Upon completion (interrupt) the progress bar counter is set to the correct
    value instead of the maximum value. (`#101
    <https://github.com/ubermag/oommfc/pull/101>`__)

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
