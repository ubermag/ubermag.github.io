========
Workshop
========

This workshop will guide you through the basics and some advanced features of using ``ubermag`` for micromagnetic simulations. The workshop has been presented ... . A recording of the sessions is available on `YouTube <https://youtube.com/channel/UC7MSqVQSMFV42R1jAYmKGLg>`_.

You can execute all notebooks in the cloud without the need to install anything. Please use the respective ``Binder`` badges shown on the individual tutorial pages.

Session 1
=========

In this session, we are going to familiarise ourselves with micromagnetics,
Python, and Jupyter and we are going to spend most of the time looking at
slides. Slides can be found in `slides` directory in the workshop `repository
<https://github.com/ubermag/workshop>`_. After slides, we are going to write our
first Ubermag simulation and have a look at some Python basics.

.. toctree::
    :maxdepth: 1
    :caption: Session 1
    :numbered:

    tutorials/first-ubermag-simulation
    tutorials/python-basics
    
We believe we do not need much Python knowledge in order to run ubermag.
However, more you feel confident writing Python, more benefits you can get from
ubermag. There are many resources online you can choose from. We can recommend
the online one by Hans Fangohr:

- https://fangohr.github.io/teaching/python/book.html

Session 2
=========

In the previous session, we introduced some very basic concepts of Ubermag
simulations, had a look at some basic Python syntax, and familiarised ourselves
with Jupyter environment. In session 2, we are going to have a look into more
details of Ubermag simulations, so we can start simulating some real-world
problems. In the first half of the session, we are going to analyse the skeleton
of Ubermag simulation and quickly go through the three main concepts
(magnetisation field, energy equation, and dynamics equation). In each tutorial,
we introduce some data analysis and visualisation concepts, which are then going
to be the main focus of session 3. After the break, we are going to simulate
vortex dynamics, drive domain walls with a spin-polarised current, and have a
look at the exercise.

.. toctree::
    :maxdepth: 1
    :caption: Session 2
    :numbered:
    
    tutorials/magnetisation-field
    tutorials/energy-equation
    tutorials/dynamics-equation
    tutorials/vortex-dynamics
    tutorials/spatially-varying-parameters1
    tutorials/spatially-varying-parameters2
    tutorials/periodic-boundary-conditions
    tutorials/driving-dw
    tutorials/dw-pair-conversion

Session 3
=========

The main topic of this session is going to be data analysis and visualisation.
However, similar to the previous sessions, we are going to go through tutorials,
which are going to introduce a mixture of simulation techniques and
micromagnetic concepts as well.

.. toctree::
    :maxdepth: 1
    :caption: Session 3
    :numbered:
    
    tutorials/choosing-runner
    tutorials/multiple-terms
    tutorials/rkky
    tutorials/time-dependent-field
    tutorials/negative-A
    tutorials/energy-term-computations
    tutorials/field-operations1
    tutorials/field-operations2
    tutorials/file-formats
    tutorials/line
    tutorials/table-basics
    tutorials/table-visualisation
    tutorials/table-interactive-plot
    tutorials/region-visualisation
    tutorials/mesh-visualisation
    tutorials/mpl-visualisation
    tutorials/k3d-visualisation
    tutorials/interactive-plotting
    tutorials/various-topics

Session 4
=========

Here we look at some new features of Ubermag regarding data analysis as well as
simulation techniques.

.. toctree::
    :maxdepth: 1
    :caption: Session 4
    :numbered:
    
    tutorials/angle-hls-plot
    tutorials/hysteresis
    tutorials/dirname
    tutorials/fixed-subregions
    tutorials/parallel
    tutorials/mindriver-steps
    tutorials/subfields
    tutorials/space-time-field
    tutorials/sine-hysteresis
    tutorials/integrals
