Installation
============

All packages in Ubermag are available on both ``conda-forge`` and ``PyPI``. All
packages can be installed independently using ``conda`` or ``pip``. To simplify the
installation for users doing micromagnetic simulations we provide a metapackage
called ``ubermag``. During installation of this packages all individual
subpackages and additionally `OOMMF <https://math.nist.gov/oommf/>`_ are
installed.

To install any of the packages please follow the guidelines below and replace ``PACKAGE`` with one of the actual package names:

- ubermag (includes all packages listed below + OOMMF)
- discretisedfield
- micromagneticmodel
- micromagneticdata
- micromagnetictests
- oommfc
- ubermagtable
- ubermagdata
- ubermagutil

Standard installation -- recommended
====================================

We recommend installation using ``conda`` package manager. If you do not already
have it installed, download `Anaconda <https://www.anaconda.com/download>`_ Python
3+ for your operating system and follow the instructions to install it. After
the installation is complete, in Terminal (Linux and MacOS) or in Anaconda
Prompt (Windows), create a new conda environment and activate it.

.. code-block:: bash

   $ conda create -n ENVIRONMENT_NAME python=3.8
   $ conda activate ENVIRONMENT_NAME

Instead of ``ENVIRONMENT_NAME``, choose the name you want. Finally, you can
install any ``PACKAGE`` by running:

.. code-block:: bash

   $ conda install --channel conda-forge PACKAGE

.. topic:: Example for ``ubermag``

   .. code-block:: bash

      $ conda install --channel conda-forge ubermag

Additional advice for Windows users installing the ``ubermag`` meta-package
---------------------------------------------------------------------------

Some OOMMF extensions are not available on Windows. In order to use these
extensions on Windows we recommend installing Docker - you can download it from:
https://www.docker.com/products/docker-desktop. Ubermag will automatically
recognise Docker and use it if required. More details can be found in the
workshop: ``Choosing runner <workshop/choosing-runner.html>``_.

Testing
-------

You can test the installation by running:

.. code-block:: bash

   $ python -c "import PACKAGE; PACKAGE.test()"

.. topic:: Example for ``ubermag``

   .. code-block:: bash

      $ python -c "import ubermag; ubermag.test()"

If no errors are reported, the installation was sucessful.

Update
------

Every ``PACKAGE`` can be updated by running:

.. code::

   $ conda update PACKAGE

.. topic:: Example for ``ubermag``

   .. code-block:: bash

      $ conda update ubermag

Advanced installation
=====================


To use ``ubermag`` for micromagnetic computations, you need to:

1. Install Ubermag.

2. Install a computational backend (such as OOMMF or mumax3).

3. Ensure Ubermag knows where to find the computational backend.

By installing Ubermag using ``conda``, all three steps would be carried out automatically (for OOMMF). However, if for some reason you need more freedom in choosing the computational backend, please follow the steps explained subsequently for your operating system.

Windows
-------

1. Before we install ``ubermag``, we need to install ``Python3`` Anaconda
   package manager. If you do not already have it installed, download `Anaconda
   <https://www.anaconda.com/download>`_ Python 3.8+ for your operating system
   and follow the instructions to install it.

2. Now we have everything required to install ``ubermag``. Run in Command Prompt:

.. code-block:: bash

   $ pip install ubermag

3. To install OOMMF as a computational backend, first, you need to install
   ``tcl`` on your machine. To do this, download the ``.exe`` file from this
   `link <http://www.activestate.com/activetcl/downloads>`_, appropriate for
   your operating system (32-bit or 64-bit). After the download is complete, run
   the downloaded file and follow the instructions to complete the installation.

4. Download the ``.zip`` file for the latest OOMMF version which is appropriate
   for your Windows OS (32-bit or 64-bit) from this `link
   <https://math.nist.gov/oommf/software-20.html>`_. After the download is
   complete, unzip (extract) it. Locate among the the unzipped files
   ``oommf.tcl`` and remember its location - we are going to need it in step 3.

5. In order to help Ubermag find where ``oommf.tcl`` is, we need to set the
   value of environment variable ``OOMMFTCL``. To do this, in Control Panel,
   select ``System`` -> ``Advanced system settings`` (tab ``Advanced``) ->
   ``Environment variables``. In User variables select ``New...`` and type
   ``OOMMFTCL`` for Variable name and
   ``C:\path\you\remembered\from\step2\oommf.tcl`` to Variable value.


MacOS
-----

1. Before we install ``ubermag``, we need to install ``Python3`` Anaconda
   package manager. If you do not already have it installed, download `Anaconda
   <https://www.anaconda.com/download>`_ Python 3.8+ for your operating system
   and follow the instructions to install it.

2. Now we have everything required to install ``ubermag``. Therefore, run in
   terminal:

.. code-block:: bash

   $ pip install ubermag

3. To compile OOMMF on MacOS, make sure you have ``XCode`` (from AppStore) and
   `Git <https://git-scm.com/download/mac>`_ installed.

4. Clone the repository by typing

.. code-block:: bash

   $ git clone https://github.com/fangohr/oommf.git

5. To compile OOMMF, change the directory (``cd oommf``) and run:

.. code-block:: bash

   $ make build-with-all

This command, apart from building OOMMF, will download and compile
Dzyaloshinkii-Moriya extensions for different crystalographic classes. For more
information, please refer to the OOMMF `repository
<https://github.com/fangohr/oommf>`_.

6. Finally, we have to set the environment variable ``OOMMFTCL``, so that
   Ubermag knows where to find OOMMF. Consequently, in your home directory, add
   the path to ``oommf.tcl`` file to the end of the ``.bash_profile`` file. More
   specifically, the line at the end of your file should look like:

.. code-block::

   export OOMMFTCL="/path/to/your/compiled/oommf.tcl"

**Please note that after editing** ``.bash_profile`` **file, you need to refresh
your environment variables** (``source ~/.bashrc``) **or reopen the Terminal
window.**


Linux (Ubuntu)
--------------

1. To install Ubermag, we first have to make sure you have ``pip`` installed.
   **Please note that this command requires root privileges (sudo).**

.. code-block:: bash

   $ apt-get install python3-pip

(Alternatively, you can use Anaconda Python3 distribution. If you do not already
have it installed, download `Anaconda <https://www.anaconda.com/download>`_
Python 3.8+ for your operating system and follow the instructions to install
it.)

2. Now, we can install ``ubermag``

.. code-block:: bash

   $ python3 -m pip install ubermag

3. You can compile OOMMF on your machine by firstly installing the required
   packages. **Please note that this command requires root privileges (sudo).**

.. code-block:: bash

   $ apt-get install git tcl-dev tk-dev

4. Clone the repository:

.. code-block:: bash

   $ git clone https://github.com/fangohr/oommf.git

(If you do not have ``git``, you can install it using ``apt-get install git``.)

5. To compile OOMMF, change the directory (``cd oommf``) and run:

.. code-block:: bash

   $ make build-with-all

This command, apart from building OOMMF, will download and compile
Dzyaloshinkii-Moriya extensions as well. For more information, please refer to
the `OOMMF reporsitory <https://github.com/fangohr/oommf>`_.

6. Finally, we have to set the environment variable ``OOMMFTCL``, so that
   previously installed Ubermag knows where to find OOMMF. Consequently, in your
   home directory, add the path to ``oommf.tcl`` file to the end of the
   ``.bashrc`` file. More specifically, the line at the emd of your file should
   look like:

.. code-block::

   export OOMMFTCL="/path/to/your/oommf.tcl"

**Please note that after editing** ``.bash_profile`` **file, you need to refresh
your environment variables** (``source ~/.bashrc``) **or reopen the Terminal
window.**

Check the installation
----------------------

To check if Ubermag can communicate with your installed OOMMF, you can use these
commands in a Python prompt on any operating system:

.. code-block:: python

    import oommfc
    oommfc.oommf.status()

or from the command line:

.. code-block:: bash

   python3 -c "import oommfc; oommfc.oommf.status()

This will attempt to run a small simulation using OOMMF.

How does Ubermag find OOMMF?
----------------------------

``oommfc`` checks for OOMMF in the following steps until the first method is
successful:

1. Is the ``OOMMFTCL`` variable set? If so, use this value to try to find OOMMF
   there.

2. Is OOMMF in the directory it should be in if both ``oommf`` and ``ubermag``
   were installed using conda.

3. If ``docker`` is available and the docker deamon is running, then OOMMF is
   used in the Docker container. (The required docker image will be downloaded
   if necessary.)
