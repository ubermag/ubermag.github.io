=======
ubermag
=======

The meta-package ``ubermag`` does not directly provide any additional functionality. It is generally not intended for being used directly. Its main purpose is to ensure that a consistent set of ubermag subpackages is installed.

The meta-package can also be used to run the tests of all ubermag subpackages:

.. code-block:: python

   import ubermag
   ubermag.test()
