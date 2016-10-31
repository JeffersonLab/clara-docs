
***********************
CRE and CLAS12 binaries
***********************

CLARA run-time environment (CRE) binary distribution is presented for the Clara Java binding.
First dedicate a directory where software will be installed. Lets call it `work-dir`. In this directory CLARA and CLAS12
specific run-time binary files will be installed.


Now click (or ctrl+click) the link to download CLARA run-time environment and CLAS12 services package.

`CLARA run-time environment and CLAS12 plugin <https://userweb.jlab.org/~gurjyan/clara-cre/clara-cre.tar.gz>`_

Copy the downloaded directory to your `work-dir`:

.. code-block:: console

    > cp clara-cre.tar.gz `work-dir`
    > cd `work-dir`
    > tar xvzf clara-cre.tar.gz

At the final stage set the CLARA_HOME environmental variable that points to the CLARA run-time environment (CRE) under the work-dir.

.. code-block:: console

    > setenv CLARA_HOME = work-dir/clara-cre
    > rehash (hash -r)

That's it. Now you are ready to process CLAS12 data.