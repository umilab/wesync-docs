.. _release-signing:

Release Signing
===============

Wesync releases are *signed* in various ways to enable users and automatic
systems to determine that it is in fact a genuine release.

Checksum Files
--------------

Two checksum files are created during the release process. These are
``sha1sum.txt`` and ``sha256sum.txt``. They contain the SHA1 and SHA256 checksums
of the release archives, respectively. To protect against tampering the
checksum files are signed by the Wesync Release Management GPG key and thus
gain a ``.asc`` extension. To verify that a download is genuine, first verify
the signature on the checksum file is correct, then that the checksum matches
the release archive.

Binary Signing
--------------

.. versionadded:: 0.12.0

In a genuine release archive you expect to find the ``wesync`` binary
(``wesync.exe`` on Windows) and an accompanying signature ``wesync.sig``
(``wesync.exe.sig`` on Windows). The signature file contains the `ECDSA
signature
<https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm>`__
of the binary, computed at the time the release was made and signed by the
Wesync Release Management private key. The keys and signature are PEM
encoded for ease of transmission - the details of the signature and encoding
handling are in `the signature package
<https://pkg.go.dev/github.com/umilab/wesync/lib/signature>`__ The public
key is included in the source code and compiled into Wesync.

When Wesync performs an automatic upgrade, it verifies the included
signature using the actual binary and the public key. If these match, we know
that the binary has not been tampered with and the release is genuine - the
upgrade proceeds. If there is a mismatch, Wesync deletes any temporary
files and aborts the upgrade.

Creating and Verifying Binary Signatures Manually
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

As a developer, you may need to verify and create signatures manually.
Wesync provides a tool to perform these operations in the same manner as
the built in verification: ``stsigtool``. To get this tool, ensure that you
have Go installed and run::

	$ go install github.com/umilab/wesync/cmd/stsigtool

After installation you can test it on an arbitrary release (from v0.12.0 and
onwards)::

	$ stsigtool verify wesync.sig wesync
	correct signature
	$ echo >> wesync  # append a newline to the binary
	$ stsigtool verify wesync.sig wesync
	incorrect signature

To create signatures of your own, you need a private key. The Wesync
private key is a closely guarded secret, but you can generate your own using
``stsigtool gen``. The ``gen`` command generates and outputs a new private and
public key pair to stdout; you'll need to paste them into a PEM file each for
storage. You can then sign binaries with the private key using ``stsigtool
sign``, verify them with the public key using ``stsigtool verify``, and have
Wesync accept these signatures by replacing the compiled in public key.
This may be useful in an enterprise setting, for example.
