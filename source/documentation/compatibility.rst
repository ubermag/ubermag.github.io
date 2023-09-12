================================================
Compatibility: Ubermag - OOMMF - mumax\ :sup:`3`
================================================

------------------
Supported features
------------------

The following table summarises the available features in Ubermag, OOMMF and
|mumax3|. We abbreviate ``micromagneticmodel=mm``, ``oommfc=oc`` and
``mumax3c=mc``.

- Available in the calculator and implemented in Ubermag: |yes|
- Partly implemented in Ubermag: |partly| [explanation]
- Partly available in the calculator: |partly| [explanation]
- Available in the calculator but missing in Ubermag: |missing|
- Not available in the calculator: |no|

-------------------
Energy Terms
-------------------

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
   * - Multiple energy terms of the same type
     - User has to specify unique ``name``s
     - |yes|
     - |partly| [Only Zeeman energy]
   * - Cubic anisotropy
     - ``mm.CubicAnisotropy``
     - |yes|
     - |yes|
   * - Demagnetisation
     - ``mm.Demag``
     - |yes|
     - |yes|
   * - DMI
     - ``mm.DMI``
     - | |yes|
       | ``T``
       | ``O``
       | ``Cnv``
       | ``D2d``
     - |yes| [cannot be used without exchange]
       | ``T`` [not between subregions]
       | ``O`` [not between subregions]
       | ``Cnv``
   * - Exchange
     - ``mm.Exchange``
     - |yes|
     - |yes|
   * - Magneto-elastic
     - ``mm.MagnetoElastic``
     - |yes|
     - |missing|
   * - RKKY interaction - between regions
     - ``mm.RKKY``
     - |yes|
     - |no|
   * - Uniaxial anisotropy
     - ``mm.UniaxialAnisotropy``
     - |yes|
     - |yes|
   * - Zeeman energy / time dependent
     - ``mm.Zeeman``
     - |yes| / |yes|
     - |yes| / |missing|


-------------------
Dynamics Terms
-------------------

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
   * - Damping
     - ``mm.Damping``
     - |yes|
     - |yes|
   * - Precession
     - ``mm.Precession``
     - |yes|
     - |yes|
   * - Slonczewski
     - ``mm.Slonczewski``
     - |yes|
     - |missing|
   * - Zhang-Li
     - ``mm.ZhangLi``
     - |yes|
     - |yes|


-------------------
Drivers & Evolvers
-------------------

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
   * - Energy minimisation
     - ``mm.Energy``
     - ``oc.MinDriver``
     - ``mc.MinDriver``
   * - Energy relaxation
     - ``mm.Dynamics``
     - ``oc.TimeDriver`` [dynamics equation without precession]
     - ``mc.RelaxDriver``
   * - LLG time evolution
     - ``mm.Dynamics``
     - ``oc.TimeDriver``
     - ``mc.TimeDriver``
   * - Evolvers
     - ``mm.Evolver``
     - |yes|
     - |missing|


-------------------
Compatible versions
-------------------

.. list-table::
   :header-rows: 1

   * - Ubermag
     - Release date
     - OOMMF (Docker image)
     - mumax\ :sup:`3`
   * - 0.66.0
     - 2022-10-20
     - 2.0b0 (oommf/oommf:20a3)
     - 3.10
   * - 0.65.0
     - 2022-07-17
     - 2.0a3 (oommf/oommf:20a3)
     - 3.10
   * - 0.64.0
     - 2022-07-03
     - 2.0a3 (oommf/oommf:20a3)
     - 3.10
   * - 0.63.0
     - 2022-06-29
     - 2.0a3 (oommf/oommf:20a3)
     - 3.10
   * - 0.62.1
     - 2022-06-09
     - 2.0a3 (oommf/oommf:20a3)
     - ✘
   * - 0.62.0
     - 2022-05-22
     - 2.0a3 (oommf/oommf:20a3)
     - ✘
   * - 0.61.2
     - 2022-03-17
     - 2.0a3 (oommf/oommf:20a3)
     - ✘
   * - 0.61.0
     - 2022-02-22
     - 2.0a3 (oommf/oommf:20a3)
     - ✘
   * - 0.60.0
     - 2021-10-01
     - 2.0a2 (oommf/oommf:20a2)
     - ✘
   * - 0.51
     - 2021-02-10
     - 2.0a1 (ubermag/oommf)
     - ✘

.. |mumax3| replace:: mumax\ :sup:`3`

.. role:: green
.. role:: red
.. role:: orangepartly
.. role:: orangemissing

.. |yes| replace:: :green:`✔`
.. |partly| replace:: :orangepartly:`(✔)`
.. |missing| replace:: :orangemissing:`(✘)`
.. |no| replace:: :red:`✘`
