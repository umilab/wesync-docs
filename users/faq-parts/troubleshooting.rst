Troubleshooting
===============

Where are the Wesync logs?
-----------------------------

Wesync logs to stdout by default. On Windows Wesync by default also
creates ``wesync.log`` in Wesync's home directory (run ``wesync
--paths`` to see where that is). The command line option ``--logfile`` can be
used to specify a user-defined logfile.  If you only have access to a running
instance's GUI, check under the `Actions` - `About` menu item to see the used
paths.

If you're running a process manager like systemd, check there. If you're
using a GUI wrapper integration, it may keep the logs for you.

Why is the sync so slow?
------------------------

When troubleshooting a slow sync, there are a number of things to check.

First of all, verify that you are not connected via a relay. In the "Remote
Devices" list on the right side of the GUI, double check that you see
"Address: <some address>" and *not* "Relay: <some address>".

.. image:: address.png

If you are connected via a relay, this is because a direct connection could
not be established. Double check and follow the suggestions in
:ref:`firewall-setup` to enable direct connections.

Second, if one of the devices is a very low powered machine (a Raspberry Pi,
or a phone, or a NAS, or similar) you are likely constrained by the CPU on
that device. See the next question for reasons Wesync likes a faster CPU.

Third, verify that the network connection is OK. Tools such as iperf or just
an Internet speed test can be used to verify the performance here.

Why does it use so much CPU?
----------------------------

#. When new or changed files are detected, or Wesync starts for the
   first time, your files are hashed using SHA-256.

#. Data that is sent over the network is compressed (optionally) and
   encrypted (always). When receiving data it must be decrypted and then (if
   compressed) decompressed.

#. There is a certain amount of housekeeping that must be done to track the
   current and available versions of each file in the index database.

#. By default Wesync uses periodic scanning every hour when watching for
   changes or every minute if that's disabled to detect
   file changes. This means checking every file's modification time and
   comparing it to the database. This can cause spikes of CPU usage for large
   folders.

Hashing, compression and encryption cost CPU time. Also, using the GUI
causes a certain amount of extra CPU usage to calculate the summary data it
presents. Note however that once things are *in sync* CPU usage should be
negligible.

To minimize the impact of this, Wesync attempts to :stconf:opt:`lower the
process priority <setLowPriority>` when starting up.

To further limit the amount of CPU used when syncing and scanning, set the
environment variable ``GOMAXPROCS`` to the maximum number of CPU cores
Wesync should use at any given moment. For example, ``GOMAXPROCS=2`` on a
machine with four cores will limit Wesync to no more than half the
system's CPU power.

Why is the setup more complicated than BitTorrent/Resilio Sync?
---------------------------------------------------------------

Security over convenience. In Wesync you have to setup both sides to
connect two devices. An attacker can't do much with a stolen device ID, because
you have to add the device on the other side too. You have better control
where your files are transferred.

This is an area that we are working to improve in the long term.

Why do I get "Host check error" in the GUI/API?
-----------------------------------------------

Since version 0.14.6 Wesync does an extra security check when the GUI/API
is bound to localhost - namely that the browser is talking to localhost.
This protects against most forms of `DNS rebinding attack
<https://en.wikipedia.org/wiki/DNS_rebinding>`__ against the GUI.

To pass this test, ensure that you are accessing the GUI using an URL that
begins with ``http://localhost``, ``http://127.0.0.1`` or ``http://[::1]``. HTTPS
is fine too, of course.

If you are using a proxy in front of Wesync you may need to disable this
check, after ensuring that the proxy provides sufficient authentication to
protect against unauthorized access. Either:

- Make sure the proxy sets a ``Host`` header containing ``localhost``, or
- Set :stconf:opt:`gui.insecureSkipHostcheck` in the advanced settings, or
- Bind the GUI/API to a non-localhost listen port.

In all cases, username/password authentication and HTTPS should be used.

My Wesync database is corrupt
--------------------------------

This is almost always a result of bad RAM, storage device or other hardware.
When the index database is found to be corrupt Wesync cannot operate and will
note this in the logs and exit. To overcome this delete the :ref:`database
folder <config-locations>` inside Wesync's data directory and re-start
Wesync. It will then need to perform a full re-hashing of all shared
folders. You should check your system in case the underlying cause is indeed
faulty hardware which may put the system at risk of further data loss.


Why do I see Wesync twice in task manager?
---------------------------------------------

One process manages the other, to capture logs and manage restarts. This
makes it easier to handle upgrades from within Wesync itself, and also
ensures that we get a nice log file to help us narrow down the cause for
crashes and other bugs.

How can I view the history of changes?
--------------------------------------

The web GUI contains a ``Recent Changes`` button under the device list which
displays changes since the last (re)start of Wesync. With the ``--audit``
option you can enable a persistent, detailed log of changes and most
activities, which contains a ``JSON`` formatted  sequence of events in the
``~/.config/wesync/audit-_date_-_time_.log`` file.

Does the audit log contain every change?
----------------------------------------

The audit log (and the ``Recent Changes`` window) sees the changes that your
Wesync sees. When Wesync is continuously connected it usually sees every change
happening immediately and thus knows which node initiated the change.
When topology gets complex or when your node reconnects after some time offline,
Wesync synchronises with its neighbours: It gets the latest synchronised state
from the neighbour, which is the *result* of all the changes between the last
known state (before disconnect or network delay) and the current state at the
neighbour, and if there were updates, deletes, creates, conflicts, which were
overlapping we only see the *latest change* for a given file or directory (and
the node where that latest change occurred). When we connect to multiple neighbours
Wesync decides which neighbour has the latest state, or if the states conflict
it initiates the conflict resolution procedure, which in the end results in a consistent
up-to-date state with all the neighbours.

Why does Wesync connect to this unknown/suspicious address?
--------------------------------------------------------------

If you see outgoing connections to odd and unexpected addresses these are
most likely connections to :ref:`relay servers <Relaying>`. Relay servers
are run by volunteers all over the world. They usually listen on ports 443 or
22067, though this is controlled by the user running it. You can compare the
address you are concerned about with `the current list of active relays
<https://relays.wesync.net>`__. Relays do not and can not see the data
transmitted via them.

I am seeing the error message "folder marker missing". What do I do?
--------------------------------------------------------------------

Wesync uses a specific marker usually called ``.stfolder`` to determine whether
a folder is healthy. This is a safety check to ensure that your folder is properly
readable and present on disk. For example, if you remove a USB drive from your computer
or unmount a filesystem, then wesync must know whether you have really deleted **all** of
your files. Therefore, wesync always checks that the ``.stfolder`` is present.

When this error appears, wesync assumes that the folder has encountered some type of error
and will stop syncing it until the ``.stfolder`` reappears. Once that happens, all changes made 
to the folder locally will be synced (i.e. missing files will be considered deletions).

- If you get this error message, check the folder in question on your storage. If you have 
  unmounted the folder (or a parent of it), you must remount it for wesync to resume syncing
  this folder. 

- If you have moved the folder, you must either move it back to its original location, or remove the
  folder from within the wesync UI and re-add it at its new location.

- If the folder is present on disk, with all of its children files and directories, but the ``.stfolder``
  is still missing: 

  It is possible that a file cleaning software has removed the ``.stfolder``. Some software
  removes empty folders, and the ``.stfolder`` is often empty. This happens particularly often on Android.
  To remediate, recreate the ``.stfolder`` and add a dummy file in it, or add an exception to your
  cleaning software.

If you are still unsure what has happened, you can remove the folder from within the wesync UI and re-add it
at the same location. This causes wesync to attempt an automatic re-creation of the ``.stfolder``. Next,
it will also reset the database state of this folder. It will be considered a "new" folder, meaning that its files
will be merged with files from remote devices.

Also see the :ref:`marker FAQ <marker-faq>` for more information about the folder marker.