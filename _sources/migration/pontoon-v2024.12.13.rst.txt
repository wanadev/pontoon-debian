Pontoon Debian v2024.12.13
==========================

Release Details
---------------

* Migration from: :doc:`./pontoon-v2024.01.16`
* Built from commit: `5e90a8ac1ed8b5b6915156cf868534988b650cb3 <https://github.com/mozilla/pontoon/commit/5e90a8ac1ed8b5b6915156cf868534988b650cb3>`_
* Tarball URL: https://github.com/wanadev/pontoon-debian/releases/download/v2024.12.13.0/pontoon_2024.12.13.0.tar.gz


Migration Instructions
----------------------

There is no specific migration instruction, just follow the :doc:`./migration`.


Changelog
---------

⚠️ Breaking changes
~~~~~~~~~~~~~~~~~~~

* Minimal Python version is now Python 3.10 (Python 11 recommended)
* Minimal PostgreSQL version is now PostgreSQL 14 (PostgreSQL 15 recommended)
* Debian 11 support was dropped. If you are still on Debian 11, ugrade it to
  Debian 12 BEFORE upgrading Pontoon.
* The ``ENABLE_INSIGHT_TAB`` setting was renamed to ``ENABLE_INSIGHT``


Important changes
~~~~~~~~~~~~~~~~~

Python 3.12 and Ubuntu 24.04 are now supported.

The Pontoon dev team added a lot of new features and so there are a lot of new settings:

* Pontoon Settings::

    # Enables logging to a file. This is useful for retaining log
    # data for later analysis or troubleshooting.
    LOG_TO_FILE=False

* Badges & Achievements Settings (new section)::

    # Specifies the start date from which user activities count towards badge
    # achievements.  This variable should be in YYYY-MM-DD format.
    BADGES_START_DATE="1970-01-01"

    # A comma-separated list of numeric thresholds for different levels of the
    # Translation Champion badge.
    BADGES_TRANSLATION_THRESHOLDS="5, 50, 250, 1000"

    # A comma-separated list of numeric thresholds for different levels of the
    # Review Master badge.
    BADGES_REVIEW_THRESHOLDS="5, 50, 250, 1000"

    # A comma-separated list of numeric thresholds for different levels of the
    # Community Builder badge.
    BADGES_PROMOTION_THRESHOLDS="1, 2, 5"

* Email Consent & Communications Settings (new section)::

    # Enables Email consent page
    EMAIL_CONSENT_ENABLED=False

    # Title of the Email consent page (mandatory when email consent is enabled)
    EMAIL_CONSENT_TITLE=

    # Main text of the Email consent page. You can use that to explain what type of
    # communication to expect among other things. (mandatory when email consent is
    # enabled)
    EMAIL_CONSENT_MAIN_TEXT=

    # Privacy notice on the Email consent page. It's possible to use HTML and link
    # to external privacy notice page
    EMAIL_CONSENT_PRIVACY_NOTICE=

    # Help text to use under the Email communications checkbox in user settings.
    # It allows to explain what type of communication to expect and to link to
    # deployment-specific privacy notices among other things (optional).
    EMAIL_COMMUNICATIONS_HELP_TEXT=

    # Text to be shown in the footer of the non-transactional emails sent using the
    # Messaging Center, just above the unsubscribe text (optional)
    EMAIL_COMMUNICATIONS_FOOTER_PRE_TEXT=

    # Custom text to be shown in the Monthly activity summary emails after the
    # greeting and before the stats (optional)
    EMAIL_MONTHLY_ACTIVITY_SUMMARY_INTRO=

    # Integer representing a day of the month on which the Monthly activity summary
    # emails will be sent. 1 represents the first day of the month.
    MONTHLY_ACTIVITY_SUMMARY_DAY=1

    # Integer representing a day of the week on which the weekly notification digest
    # email will be sent. 0 represents Monday, 6 represents Sunday.
    NOTIFICATION_DIGEST_DAY=4  # Friday

* Email SMTP Settings::

    # Use implicit TLS for the SMTP connection
    EMAIL_USE_SSL=False

  NOTE: The ``EMAIL_USE_TLS`` setting still exists for explicit TLS connection.

* Terminology Files (.tbx) (new section)::

    # Title to be used in the header of the Terminology (.TBX) files
    TBX_TITLE="Pontoon Terminology"

    # Description to be used in the header of the Terminology (.TBX) files
    TBX_DESCRIPTION="Terms localized in Pontoon"

* Translation APIs Settings::

    # Google Cloud AutoML Translation
    GOOGLE_AUTOML_PROJECT_ID=
    GOOGLE_AUTOML_WARMUP_INTERVAL=300

    # OpenAI AP key to add the ability to refine machine translations using ChatGPT
    OPENAI_API_KEY=

* Client Filtering & (D)DoS Protection (new section)::

    # A comma-separated list of IP addresses or IP ranges (expressed using the CIDR
    # notation, e.g. "192.168.1.0/24") to be blocked from accessing the app, for
    # example because they are DDoS'ing the server.
    BLOCKED_IPS=

    # Optional. Enables traffic throttling based on IP address
    THROTTLE_ENABLED=False

    # Maximum number of requests allowed in THROTTLE_OBSERVATION_PERIOD
    THROTTLE_MAX_COUNT=300

    # A period (in seconds) in which THROTTLE_MAX_COUNT requests are allowed. If
    # longer than THROTTLE_BLOCK_DURATION, THROTTLE_BLOCK_DURATION will be used.
    THROTTLE_OBSERVATION_PERIOD=60

    # A duration (in seconds) for which IPs are blocked
    THROTTLE_BLOCK_DURATION=600


All changes
~~~~~~~~~~~

https://github.com/mozilla/pontoon/compare/42a5285abddad3c3fd79ae3b4b1a7c309308b61a...5e90a8ac1ed8b5b6915156cf868534988b650cb3
