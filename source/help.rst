====
Help
====

Support
-------

If you encounter a problem that is not explained in the
`workshop <workshop/index.html>`__ or the `documentation
<documentation/index.html>`__ you can raise an issue in our `help repository
<https://github.com/ubermag/help>`__.

..  MABYE THIS LINK COULD DIRECTLY OPEN A NEW ISSUE BASED ON A (YET TO BE CREATED) TEMPLATE

Please first have a look at the `existing issues
<https://github.com/ubermag/help/issues?q=is%3Aissue+>`__, maybe your question
has been answered already.

How to ask
^^^^^^^^^^

Please provide:

- A detailed description of your problem
- Explain what you have tried already
- Ideally, upload a ``Jupyter notebook`` (zipped) containing what you have
  achieved so far (**NOTE: remove any confidential information**)
- Please enclose inline-code snippets with single backticks and multi-line
  (code) blocks with lines containing three backticks (optionally specifying the
  programming language) as shown in the following examples::

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
help. Please be patient if we do not reply immediately.

For more details on how to ask good questions please refer to:
https://fangohr.github.io/computing/smartquestion.html

Help others
^^^^^^^^^^^

If you have more experience in using ``ubermag`` or any of its sub-packages and
want to help others we very much welcome anyone answering open questions in the
help repository.

Bugs
----

If you encounter a bug please open an issue in the `help repository
<https://github.com/ubermag/help>`__.

Please include:

- A detailed explanation of the bug
- How it can be reproduced (explanation or ``Jupyter notebook``)

Fixing a Bug
^^^^^^^^^^^^

Any contribution in the form of a pull request is very much welcomed.

Feature requests
----------------

If something is missing in Ubermag or any of its sub-packages you can open an
issue in the `help repository <https://github.com/ubermag/help>`__.

Please include:

- Detailed explanation
- Why it is required/useful
- An example if possible

If you want to contribute the feature yourself you can create a pull request. Please
get in touch beforehand (e.g. by opening an issue).
