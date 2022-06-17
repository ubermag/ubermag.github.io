=============
Compatibility
=============

------------------
Supported features
------------------

The following table summarises the available features in Ubermag, OOMMF an
|mumax3|. We abbreviate ``micromagneticmodel=mm``, ``oommfc=oc`` and
``mumax3c=mc``.

.. list-table::
   :header-rows: 2

   * - Feature
     - Ubermag
     - OOMMF
     - |mumax3|
   * -
     - ``micromagneticmodel``
     - ``oommfc``
     - ``mumax3c``
   * - Exchange energy
     - ``mm.Exchange``
     - |yes|
     - |yes|
   * - bulk DMI
     - ``mm.DMI(crystalclass='T')``
     - |yes|
     - |partly| [not between subregions]
   * - interfacial DMI
     - ``mm.DMI(crystalclass='Cnv')``
     - |yes|
     - |yes|
   * - RKKW interaction
     - ``mm.RKKW``
     - |yes|
     - |no|
   * - Energy minimisation
     - ``mm.Energy``
     - ``oc.MinDriver``
     - ``mc.MinDriver``
   * - [Energy relaxation]
     - ``mm.Dynamics``
     - ``oc.TimeDriver`` [dynamics equation without precession]
     - ``mc.RelaxDriver``
   * - LLG time evolution
     - ``mm.Dynamics``
     - ``oc.TimeDriver``
     - ``mc.TimeDriver``

-------------------------------------
Compatibility ``ubermag`` - ``OOMMF``
-------------------------------------

+---------+--------------+--------+-------+--------------------+
| Ubermag | release date | oommfc | OOMMF | OOMMF Docker image |
+=========+==============+========+=======+====================+
| 0.61.2  | 2022-03-17   | 0.61.1 | 2.0a3 | oommf/oommf:20a3   |
+---------+--------------+        |       |                    |
| 0.61.0  | 2022-02-22   |        |       |                    |
+---------+--------------+--------+-------+--------------------+
| 0.60.0  | 2021-10-01   | 0.60.0 | 2.0a2 | oommf/oommf:20a2   |
+---------+--------------+--------+-------+--------------------+
| 0.51    | 2021-02-10   | 0.10.1 | 2.0a1 | ubermag/oommf      |
+---------+--------------+--------+-------+--------------------+

.. |mumax3| replace:: mumax\ :sup:`3`

.. role:: red
.. role:: green
.. role:: orange

.. |yes| replace:: :green:`✔`
.. |no| replace:: :red:`✘`
.. |partly| replace:: :orange:`(✔)`
