Pontoon Debian v2022.04.26
==========================

Release Details
---------------

* Migration from: :doc:`./pontoon-v2022.02.09`
* Built from commit: `c86e0ed7ddf9bae4d4343acec2ce16e8688851ab <https://github.com/mozilla/pontoon/commit/c86e0ed7ddf9bae4d4343acec2ce16e8688851ab>`_
* Tarball URL: https://github.com/wanadev/pontoon-debian/releases/download/v2022.04.26.0/pontoon_2022.04.26.0.tar.gz


Migration Instructions
----------------------

There is no specific migration instruction, just follow the :doc:`./migration`.


Changelog
---------

* [security] Restore CSP and CSRF protection on /graphql (`#2422`_)
* [security] Validate Repository URLs before they are stored into the DB (`#2446`_, `#2455`_)
* [enhancement] Add support for key-value JSON (`#2322`_)
* [enhancement] Add notifications for approved & rejected suggestions (`#2094`_)
* [enhancement] Make distinction between Pretranslated and Fuzzy strings (`#2237`_)
* [enhancement] Clarify visibility of data in the profile page (`#2488`_)
* [bugfix] Avoid resetting errors & warning during editor mount (`#2251`_)
* [bugfix] Update MS Terminology Request / Response according to the new API version (`#2447`_)
* [bugfix] Fix project and locale insights data (`#2457`_)
* [bugfix] Prevent AttributeError on Tour for AnonymousUsers (`#2467`_)
* [bugfix] Fixes bug where hitting the Enter key in the numpad area now enters a newline instead of submitting the suggestion (`#2475`_)
* [bugfix] Fixes a Pontoon UI crash that occure when clicking 2 strings quickly one after another (`#2474`_)
* [bugfix] Delete translation memory entries of implicitly rejected translations (`#2491`_)
* [ui] Correct 'unaproved' to 'unapproved' typo (`#2426`_)
* [ui] Switch pretranslated/fuzzy checkbox colors (`#2473`_)
* [ui] Rename Deadline to Target Date (`#2434`_)
* [misc] Refactoring of the frontend and the way it is built; the Pontoon Debian
  build script has been updated accordingly (`#2423`_, `#2430`_, `#2432`_,
  `#2437`_, `#2443`_, `#2444`_, `#2450`_)
* Update dependencies (`#2425`_, `#2431`_, `#2435`_, `#2472`_)

.. _#2422: https://github.com/mozilla/pontoon/pull/2422

.. _#2446: https://github.com/mozilla/pontoon/pull/2446
.. _#2455: https://github.com/mozilla/pontoon/pull/2455

.. _#2322: https://github.com/mozilla/pontoon/issues/2322

.. _#2094: https://github.com/mozilla/pontoon/issues/2094

.. _#2237: https://github.com/mozilla/pontoon/issues/2237

.. _#2488: https://github.com/mozilla/pontoon/pull/2488

.. _#2251: https://github.com/mozilla/pontoon/issues/2251

.. _#2447: https://github.com/mozilla/pontoon/issues/2447

.. _#2457: https://github.com/mozilla/pontoon/issues/2457

.. _#2467: https://github.com/mozilla/pontoon/pull/2467

.. _#2475: https://github.com/mozilla/pontoon/issues/2475

.. _#2474: https://github.com/mozilla/pontoon/issues/2474

.. _#2491: https://github.com/mozilla/pontoon/issues/2491

.. _#2426: https://github.com/mozilla/pontoon/issues/2426

.. _#2473: https://github.com/mozilla/pontoon/pull/2473

.. _#2434: https://github.com/mozilla/pontoon/issues/2434

.. _#2423: https://github.com/mozilla/pontoon/issues/2423
.. _#2430: https://github.com/mozilla/pontoon/pull/2430
.. _#2432: https://github.com/mozilla/pontoon/pull/2432
.. _#2437: https://github.com/mozilla/pontoon/pull/2437
.. _#2443: https://github.com/mozilla/pontoon/pull/2443
.. _#2444: https://github.com/mozilla/pontoon/pull/2444
.. _#2450: https://github.com/mozilla/pontoon/pull/2450

.. _#2425: https://github.com/mozilla/pontoon/pull/2425
.. _#2431: https://github.com/mozilla/pontoon/pull/2431
.. _#2435: https://github.com/mozilla/pontoon/pull/2435
.. _#2472: https://github.com/mozilla/pontoon/pull/2472
