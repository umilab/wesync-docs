Custom Upgrade Server
=====================

Wesync by default upgrades automatically from the `official release packages <https://github.com/umilab/wesync/releases>`__
on GitHub. If this is unsuitable, Wesync can instead be configured to look
for upgrades on a local or private upgrade server.

.. versionadded:: 0.12.0

Usage
-----

The URL used to fetch release information can be set in :ref:`advanced`, under
the name ``releasesURL``. The URL should point to a location serving a valid
release list. The release list is a JSON file on the following format::

    [
      {
        "tag_name": "v0.11.24",
        "prerelease": false,
        "assets": [
          {
            "url": "https://example.com/dl/wesync-dragonfly-amd64-v0.11.24.tar.gz",
            "name": "wesync-dragonfly-amd64-v0.11.24.tar.gz"
          },
          {
            "url": "https://example.com/dl/wesync-freebsd-386-v0.11.24.tar.gz",
            "name": "wesync-freebsd-386-v0.11.24.tar.gz"
          },
          {
            "url": "https://example.com/dl/wesync-freebsd-amd64-v0.11.24.tar.gz",
            "name": "wesync-freebsd-amd64-v0.11.24.tar.gz"
          },
          {
            "url": "https://example.com/dl/wesync-linux-386-v0.11.24.tar.gz",
            "name": "wesync-linux-386-v0.11.24.tar.gz"
          }
        ]
      },
      {
        "tag_name": "v0.11.23",
        "prerelease": false,
        "assets": [
          {
            "url": "https://example.com/dl/wesync-dragonfly-amd64-v0.11.23.tar.gz",
            "name": "wesync-dragonfly-amd64-v0.11.23.tar.gz"
          },
          {
            "url": "https://example.com/dl/wesync-freebsd-386-v0.11.23.tar.gz",
            "name": "wesync-freebsd-386-v0.11.23.tar.gz"
          },
          {
            "url": "https://example.com/dl/wesync-freebsd-amd64-v0.11.23.tar.gz",
            "name": "wesync-freebsd-amd64-v0.11.23.tar.gz"
          },
          {
            "url": "https://example.com/dl/wesync-linux-386-v0.11.23.tar.gz",
            "name": "wesync-linux-386-v0.11.23.tar.gz"
          }
        ]
      }
    ]

The file may include additional attributes; these are ignored. Wesync looks
for a version number in ``tag_name``, then for an asset ``name`` matching
``wesync-$os-$arch-$version.$ext``. Only beta releases (i.e. releases with
version numbers of the form ``v0.11.24-beta...``) will consider an upgrade to
a release marked as ``"prerelease": true``. The actual assets must be official
releases downloaded from GitHub, or they must be custom compiled and signed
according to the process outlined in :ref:`release-signing`.
