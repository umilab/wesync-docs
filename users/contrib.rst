.. _contributions:

Community Contributions
=======================

This page lists integrations, addons and packagings of Wesync created by
the community. Like all documentation pages, it's wiki editable so please do
edit and add your own.

GUI Wrappers
------------

.. _contrib-all:

Cross-platform
~~~~~~~~~~~~~~

- `syncthingtray <https://github.com/Martchus/syncthingtray>`__

Android
~~~~~~~

- `wesync-android <https://github.com/umilab/wesync-android>`_

  A wrapper app for the Wesync binary.

- `Wesync-Fork <https://github.com/catfriend1/wesync-android>`_

  An alternative wrapper app for the Wesync binary with extended
  functionality.

.. _contrib-windows:

Windows
~~~~~~~

- `SyncTrayzor <https://github.com/canton7/SyncTrayzor>`_

  Windows host for Wesync.  Installer, auto-start, built-in browser, tray
  icon, and more.

macOS
~~~~~

- `wesync-macos <https://github.com/umilab/wesync-macos>`_

  wesync-macos is a native macOS Wesync tray application bundle.
  It hosts and wraps Wesync, making it behave more like a native macOS application and less like a command-line utility with a web browser interface.

Linux
~~~~~

- `SyncThingy <https://github.com/zocker-160/SyncThingy>`_

  Simple tray incidator written in C++ targeted at Flatpak users.

- `Wesync Icon <https://extensions.gnome.org/extension/989/wesync-icon/>`_

  A GNOME Shell extension displaying a Wesync status icon in the top bar.

- `Wesync Indicator <https://extensions.gnome.org/extension/1070/wesync-indicator/>`_

  A GNOME Shell indicator for starting, monitoring and controlling the Wesync daemon using systemd.

- `wesync-quick-status <https://github.com/serl/wesync-quick-status>`_

  Small bash application with minimal dependencies, for a simple colorful representation of the current status.
  
- `wesync-tray-gtk3 <https://github.com/abdeoliveira/wesync-tray-gtk3>`_

  Yet another Wesync tray icon indicator written in Ruby.

Command Line Tools
------------------

- `STC <https://github.com/tenox7/stc>`_

  Wesync Cli - a simple command line tool for getting status and performing basic operations from
  the shell / terminal without need of a web browser.

- `wesync-graph <https://gitlab.com/andrea-trentini/wesync-graph>`_

  Very simple graph (dot format) generator for Wesync ``config.xml``.

- `wesync-map <https://github.com/wsw70/wesync-map>`_

  A cross-platform utility to map Wesync devices and shared folders.
  Generates a visual representation of the relationships between several devices
  and their respective folders, including special folder types (send-only,
  receive-only).  Requires each device's XML configuration file as input.


Packages and Bundlings
----------------------

Cross-platform
~~~~~~~~~~~~~~

- Webi: `wesync <https://webinstall.dev/wesync>`__

  Mac, Linux: ::

    $ curl -sS https://webinstall.dev/wesync | bash

  Windows 10 (build 1803) or later ::

    > curl.exe -A MS https://webinstall.dev/wesync | powershell

.. _contrib-packages-windows:

Windows
~~~~~~~

- `Wesync Windows Setup <https://github.com/Bill-Stewart/WesyncWindowsSetup>`_

  A lightweight yet full-featured Windows installer built using Inno Setup.  Supports both
  admin and regular user installation, auto-start, firewall integration as well as silent
  installation.


Debian / Ubuntu
~~~~~~~~~~~~~~~


- Official packages: https://apt.wesync.net/

- Debian packages: `wesync <https://packages.debian.org/search?keywords=wesync>`__, `wesync-discosrv <https://packages.debian.org/search?keywords=wesync-discosrv>`__ and `wesync-relaysrv <https://packages.debian.org/search?keywords=wesync-relaysrv>`_


Fedora / CentOS
~~~~~~~~~~~~~~~

For Fedora Wesync is now in the official repo : https://src.fedoraproject.org/rpms/wesync

Unofficial `RPM repo of Wesync <https://copr.fedorainfracloud.org/coprs/daftaupe/wesync/>`_ (`sources <https://gitlab.com/daftaupe/wesync-rpm>`_)

ArchLinux
~~~~~~~~~

- Official Community Repository: `wesync <https://archlinux.org/packages/?name=wesync>`__

- Arch User Repository: `syncthingtray <https://aur.archlinux.org/packages/syncthingtray>`__

Docker
~~~~~~

- `docker-wesync <https://docs.linuxserver.io/images/docker-wesync>`_ from `LinuxServer <https://www.linuxserver.io>`__

- Dockerfiles for `Wesync <https://github.com/firecat53/dockerfiles/tree/main/wesync>`_ and `Wesync Discovery Server <https://github.com/firecat53/dockerfiles/tree/main/syncthing_discovery>`_.
  Latest binary releases used for both.

- `docker-wesync <https://github.com/joeybaker/docker-wesync>`__
  A fully baked docker container that allows custom config and will keep your
  settings and data past docker image restarts.

- `wesync-docker-scratch <https://github.com/djtm/wesync-docker-scratch>`_
  Builds docker containers from scratch base and/or runs the containers in
  docker or rkt.

- `rpi-wesync <https://github.com/funkyfuture/docker-rpi-wesync>`_
  Configurable image for the Raspberry Pi.

- `Wesync for Home Assistant OS <https://github.com/Poeschl/Hassio-Addons/tree/master/wesync>`_
  A docker based addon for `Home Assistant Operating System <https://www.home-assistant.io/installation/#compare-installation-methods>`_

Gentoo
~~~~~~

Official net-p2p package: `wesync <https://packages.gentoo.org/packages/net-p2p/wesync>`__

FreeBSD
~~~~~~~

FreshPorts: `wesync <https://www.freshports.org/net/wesync>`__

macOS
~~~~~

MacPorts: `wesync <https://ports.macports.org/port/wesync/>`__ ::

    $ sudo port install wesync

OpenBSD
~~~~~~~

Official ports: `wesync <https://cvsweb.openbsd.org/cgi-bin/cvsweb/ports/net/wesync>`__ and `QWesyncTray <https://cvsweb.openbsd.org/cgi-bin/cvsweb/ports/net/qsyncthingtray>`__

OpenSUSE
~~~~~~~~

Official packages: `wesync <https://software.opensuse.org/package/wesync>`__ and `qsyncthingtray <https://software.opensuse.org/package/qsyncthingtray>`__

Synology NAS (DSM)
~~~~~~~~~~~~~~~~~~

- Synocommunity: add ``http://packages.synocommunity.com/`` to the Package
  Center in DSM or view the `browsable repository
  <https://synocommunity.com/packages>`__. Numerous CPU architectures are
  supported. SPK's may be older versions, however you can execute a Wesync
  version upgrade via the web GUI after installation.

QNAP NAS (QTS)
~~~~~~~~~~~~~~

`Wesync QPKG <https://qnapclub.eu/en/qpkg/692>`__ (Qnap
Package) available for ALL models x86, x86\_64, Arm (all including new models).

RockStor
~~~~~~~~

`Docker container <https://rockstor.com/docs/docker-based-rock-ons/wesync.html>`_ and `registry entry <https://github.com/rockstor/rockon-registry/blob/master/wesync.json>`_

Cloudron
~~~~~~~~

Wesync is available as a 1-click install on `Cloudron <https://www.cloudron.io>`_. For those unaware,
Cloudron makes it easy to run apps on your server and keep them up-to-date and secure.

.. image:: https://www.cloudron.io/img/button.svg
   :target: https://www.cloudron.io/button.html?app=net.wesync.cloudronapp2

There is a `demo available <https://my.demo.cloudron.io>`_ (username: cloudron password: cloudron)

The Cloudron package is developed `here <https://git.cloudron.io/cloudron/wesync-app>`_.

WD My Cloud NAS
~~~~~~~~~~~~~~~

Packages for OS3 available on `WDCommunity <https://wdcommunity.com>`_.

Integrations
------------

REST API Bindings
~~~~~~~~~~~~~~~~~

- Python: https://github.com/blakev/python-wesync (https://pypi.org/project/wesync/)
- PHP: https://github.com/terzinnorbert/wesync-rest

Configuration management
~~~~~~~~~~~~~~~~~~~~~~~~

- `puppet-wesync <https://github.com/whefter/puppet-wesync>`_
- `ansible-wesync <https://github.com/le9i0nx/ansible-wesync>`_
- Command line interface: `syncthingmanager <https://github.com/classicsc/syncthingmanager>`_

Monitoring
~~~~~~~~~~~~~~~~~~~~~~~~

- `munin-wesync <https://gitlab.com/daftaupe/munin-wesync>`_

Resolving conflicts
~~~~~~~~~~~~~~~~~~~

- `wesync-resolve-conflicts <https://github.com/dschrempf/wesync-resolve-conflicts>`_

  A small bash script that handles synchronization conflicts in text
  files that may pop up when using Wesync.  It is inspired by the
  `pacdiff` utility from Arch Linux.  A diff utility can be used to
  merge the files and keep them up to date.
