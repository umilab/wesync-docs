Wesync Infrastructure
========================

This is a list of the infrastructure that powers the Wesync project.
Unless otherwise noted, the default is that it's a VM hosted by :user:`calmh`.

GitHub
------

All repos, issue trackers and binary releases are hosted at `GitHub <https://github.com/umilab>`__.

Main & Documentation Websites
------------------------------

Static HTML, served by Caddy.

- `wesync.net <https://weloobe.com/products/wesync/>`__
- `apt.wesync.net <https://apt.wesync.net>`__ (Debian packages)
- `docs.wesync.net <https://docs.wesync.net/>`__ (Sphinx for site generation)
- `upgrades.wesync.net <https://upgrades.wesync.net/meta.json>`__ (upgrade metadata)

Forum Website
-------------

Powered by Discourse.

- `forum.wesync.net <https://forum.wesync.net/>`__

Global Discovery Servers
------------------------

Runs the ``stdiscosrv`` instances that serve global discovery requests. The
discovery setup is a load balanced cluster and the members can change
without prior notice. As of the time of writing they are all hosted at
DigitalOcean.

- discovery.wesync.net (multiple A and AAAA records, for queries)
- discovery-v4.wesync.net (multiple A records, for IPv4 announces)
- discovery-v6.wesync.net (multiple AAAA records, for IPv6 announces)

Relay Pool Server
-----------------

Runs the `strelaypoolsrv <https://github.com/umilab/wesync/tree/main/cmd/strelaypoolsrv>`__
daemon to handle dynamic registration and announcement of relays.

- `relays.wesync.net <https://relays.wesync.net>`__

Relay Servers
-------------

Hosted by friendly people on the internet.

Usage Reporting Server
----------------------

Runs the `ursrv <https://github.com/umilab/wesync/tree/main/cmd/ursrv>`__
daemon with PostgreSQL and Nginx.

- `data.wesync.net <https://data.wesync.net/>`__

Build Servers
-------------

Runs TeamCity and does the core builds.

- `build.wesync.net <https://build.wesync.net/>`__

There are various build agents; Linux, Windows, and Mac. These are currently
provided by :user:`calmh` or Kastelo.


Signing Server
--------------

Signs and uploads the release bundles to GitHub.

- secure.wesync.net

Monitoring
----------

The infrastructure is monitored and its status is publicly accessible on the following urls:

- `status.wesync.net <https://status.wesync.net>`__ (Apex Ping)
- `monitor.wesync.net <https://monitor.wesync.net>`__ (Grafana)

