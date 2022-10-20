===
FAQ
===

Number of files written to disk with ``TimeDriver``
---------------------------------------------------

One of the arguments that users have to pass to ``TimeDriver.drive()`` is ``n``,
the number of magnetisation configurations that are written to disk. This
parameter **only** controls the number of files written to disk and does not
influence the internal numeric time step that the micromagnetic calculator (e.g.
OOMMF) is using. Hence, two simulations with ``t=1e-9, n=1`` and ``t=1e-9,
n=1000`` will result in the same final configuration.
