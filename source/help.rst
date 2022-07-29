====
Help
====

If you want to report a bug or request a new feature please refer to the
relevant sections in :doc:`contributing` (:ref:`bugs`, :ref:`feature-requests`).

If you encounter a problem that is not explained in the `workshop
<workshop/index.html>`__ or the `documentation <documentation/index.html>`__ you
can raise an issue in our `help repository <https://github.com/ubermag/help>`__
or ask on our `mailing list
<https://listserv.gwdg.de/mailman/listinfo/ubermag-users>`__. We encourage
everyone using ``ubermag`` to `subscribe
<https://listserv.gwdg.de/mailman/listinfo/ubermag-users>`__ to the mailing list
and help others. We also announce new releases on the mailing list.

..  MABYE THIS LINK COULD DIRECTLY OPEN A NEW ISSUE BASED ON A (YET TO BE CREATED) TEMPLATE

Please first have a look at the `existing issues
<https://github.com/ubermag/help/issues?q=is%3Aissue+>`__ and the `mailing list
archive <https://listserv.gwdg.de/pipermail/ubermag-users/>`__: perhaps your
question has been answered already.

------------------------------------
How to prepare your request for help
------------------------------------

Please provide:

- A detailed description of your problem
- Explain what you have tried already
- Ideally, upload a ``Jupyter notebook`` (zipped for GitHub issues) containing
  what you have achieved so far (**NOTE: remove any confidential information**)
- On GitHub, please enclose inline-code snippets with single backticks and
  multi-line (code) blocks with lines containing three backticks (optionally
  specifying the programming language) as shown in the following examples::

    Here is some `inline_code`.

  .. admonition:: rendered output is similar to

     Here is some ``inline_code``.

  ::

    To get the current ubermag version, we can use:
    ```python
    # multi-line python
    import ubermag
    print(ubermag.__version__)
    ```
    In a notebook cell `print` can be omitted.

  .. admonition:: rendered output is similar to

    To get the current ubermag version, we can use:

    .. code-block:: python

       # multi-line python
       import ubermag
       print(ubermag.__version__)

    In a notebook cell ``print`` can be omitted.

  ::

    Here is a second multi-line block without specifying a programming language
    ```
    # any other code
    # e.g. mif-file excerpt
    ```

  .. admonition:: rendered output is similar to

    Here is a second multi-line block without specifying a programming language

    .. code-block::

       # any other code
       # e.g. mif-file excerpt

By providing the above listed information you greatly enhance the chance to get
help. (Your careful documentation of the issue may also help others who run into the same problem.)
Please be patient if we do not reply immediately.

For more suggestions on how to phrase your questions please refer to:
https://fangohr.github.io/computing/smartquestion.html

-----------
Help others
-----------

If you have more experience in using ``ubermag`` or any of its sub-packages and
want to help others, we very much welcome anyone answering open questions in the
help repository: You may not be able to contribute to the ``ubermag`` software, 
but if you can help fellow ``ubermag`` users, you contribute to the ``ubermag`` 
project and community buiding, and you create time for the ``ubermag`` developers 
to focus on the tasks you would like them to work on.
