GET /rest/system/paths
======================

.. versionadded:: 1.21.0

Returns the path locations used internally for storing configuration, database,
and others.

.. code-block:: json

    {
      "auditLog": "/home/user/.local/share/wesync/audit-${timestamp}.log",
      "baseDir-config": "/home/user/.config/wesync",
      "baseDir-data": "/home/user/.local/share/wesync",
      "baseDir-userHome": "/home/user",
      "certFile": "/home/user/.config/wesync/cert.pem",
      "config": "/home/user/.config/wesync/config.xml",
      "csrfTokens": "/home/user/.config/wesync/csrftokens.txt",
      "database": "/home/user/.local/share/wesync/index-v0.14.0.db",
      "defFolder": "/home/user/Sync",
      "guiAssets": "/home/user/src/wesync/gui",
      "httpsCertFile": "/home/user/.config/wesync/https-cert.pem",
      "httpsKeyFile": "/home/user/.config/wesync/https-key.pem",
      "keyFile": "/home/user/.config/wesync/key.pem",
      "logFile": "-",
      "panicLog": "/home/user/.local/share/wesync/panic-${timestamp}.log"
    }
