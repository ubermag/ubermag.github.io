=======
mumax3c
=======

To use mumax3 as a calculator instead of OOMMF use the following import at the
top of your notebook

.. code-block:: python

   import mumax3c as mc

and replace ``oc`` with ``mc`` in the examples.

Note, that ``mumax3c`` (the interface to mumax3) does not support everything
supported by ``oommfc`` (and OOMMF). Refer to :doc:`compatibility` for
details.
