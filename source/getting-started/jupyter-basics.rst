======================
Jupyter lab quickstart
======================

We use Jupyter notebooks for all our examples and highly recommend using
Jupyter notebooks for interactive simulations. For details please refer to
https://jupyter.org. Here, we give a minimal introduction in how to start and
use a Jupyter notebook. We will use the newer interface, called Jupyter lab. We
assume that you have locally installed Ubermag or any of its subpackages as
explained in :doc:`../installation`. Jupyter lab is automatically installed as a
dependency of ``discretisedfield``.

.. tab-set::

   .. tab-item:: Windows

      TODO

   .. tab-item:: Linux/MacOS

      To start Jupyter lab, open a terminal and run the following commands (if
      you use pip+venv instead of conda activate the environment as explained in
      the installation instructions):

      .. code-block:: bash

         $ conda activate ubermag_env  # replace with your environment name
         $ jupyter lab

      This will automatically open a new browser window and start Jupyter lab in
      it. Jupyter lab gives you full access to your files in the directory (and
      all subdirectories) from where you start it.

Once you have started jupyter lab, you will see a browser tab similar to this
one (note that the UI might change over time).

.. image:: ../_static/jupyter-lab.png

Click on "Notebook: Python 3" to start a new Python notebook. You can import the
``ubermag`` meta-package and check the installed version as shown in the
following screenshot.

.. image:: ../_static/notebook-ubermag-version.png

Please refer to the Jupyter documentation or other tutorials available online to
learn more about the Jupyter lab and Jupyter notebooks.

