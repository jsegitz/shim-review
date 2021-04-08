This repo is for review of requests for signing shim.  To create a request for review:

- clone this repo
- edit the template below
- add the shim.efi to be signed
- add build logs
- add any additional binaries/certificates/SHA256 hashes that may be needed
- commit all of that
- tag it with a tag of the form "myorg-shim-arch-YYYYMMDD"
- push that to github
- file an issue at https://github.com/rhboot/shim-review/issues with a link to your branch
- approval is ready when you have accepted tag

Note that we really only have experience with using GRUB2 on Linux, so asking
us to endorse anything else for signing is going to require some convincing on
your part.

Here's the template:

-------------------------------------------------------------------------------
What organization or people are asking to have this signed:
-------------------------------------------------------------------------------
SUSE, https://www.suse.com/

-------------------------------------------------------------------------------
What product or service is this for:
-------------------------------------------------------------------------------
SUSE Linux Enterprice Server 15 SP3

-------------------------------------------------------------------------------
What's the justification that this really does need to be signed for the whole world to be able to boot it:
-------------------------------------------------------------------------------
SUSE is one of the major vendors in the Linux ecospace and this shim is a part
of a commercial support offering advertised publicly

-------------------------------------------------------------------------------
Who is the primary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name: Johannes Segitz
- Position: Security Engineer
- Email address: jsegitz@suse.com
- PGP key, signed by the other security contacts, and preferably also with signatures that are reasonably well known in the linux community:
  EE16 6BCE AD56 E034 BFB3  3ADD 7BF7 29D5 E7C8 1FA0

-------------------------------------------------------------------------------
Who is the secondary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name: Marcus Meissner
- Position: Project Manager Security
- Email address: meissner@suse.de
- PGP key, signed by the other security contacts, and preferably also with signatures that are reasonably well known in the linux community:
  7C4A FD61 D8AA E757 0796  A517 2209 D690 2F96 9C95

-------------------------------------------------------------------------------
Please create your shim binaries starting with the 15.4 shim release tar file:
https://github.com/rhboot/shim/releases/download/15.4/shim-15.4.tar.bz2

This matches https://github.com/rhboot/shim/releases/tag/15.4 and contains
the appropriate gnu-efi source.
-------------------------------------------------------------------------------
This is based on shim 15.4

-------------------------------------------------------------------------------
URL for a repo that contains the exact code which was built to get this binary:
-------------------------------------------------------------------------------
Our build service isn't publicly available. The code is shim 15.4 + the patches
described below and added here

-------------------------------------------------------------------------------
What patches are being applied and why:
-------------------------------------------------------------------------------
We use 15.4 shim + 
- shim-arch-independent-names.patch: use the Arch-independent names.
- shim-bsc1177315-verify-eku-codesign.patch: Check CodeSign in the signer's EKU
- shim-bsc1177789-fix-null-pointer-deref-AuthenticodeVerify.patch: fix NULL pointer dereference in AuthenticodeVerify
- shim-change-debug-file-path.patch: change path of debug file
- remove_build_id.patch: don't add the build id from the resulting binaries
- shim-bsc1184454-allocate-mok-config-table-BS.patch: Handle 'Failed to lookup EFI memory descriptor' errors

-------------------------------------------------------------------------------
If bootloader, shim loading is, GRUB2: is CVE-2020-14372, CVE-2020-25632,
 CVE-2020-25647, CVE-2020-27749, CVE-2020-27779, CVE-2021-20225, CVE-2021-20233,
 CVE-2020-10713, CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311,
 CVE-2020-15705, and if you are shipping the shim_lock module CVE-2021-3418
-------------------------------------------------------------------------------
yes

-------------------------------------------------------------------------------
What exact implementation of Secureboot in GRUB2 ( if this is your bootloader ) you have ?
* Upstream GRUB2 shim_lock verifier or * Downstream RHEL/Fedora/Debian/Canonical like implementation ?
-------------------------------------------------------------------------------
Downstream RHEL/Fedora/Debian/Canonical like implementation

-------------------------------------------------------------------------------
If bootloader, shim loading is, GRUB2, and previous shims were trusting affected
by CVE-2020-14372, CVE-2020-25632, CVE-2020-25647, CVE-2020-27749,
  CVE-2020-27779, CVE-2021-20225, CVE-2021-20233, CVE-2020-10713,
  CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705,
  and if you were shipping the shim_lock module CVE-2021-3418
  ( July 2020 grub2 CVE list + March 2021 grub2 CVE list )
  grub2:
* were old shims hashes provided to Microsoft for verification
  and to be added to future DBX update ?
* Does your new chain of trust disallow booting old, affected by CVE-2020-14372,
  CVE-2020-25632, CVE-2020-25647, CVE-2020-27749,
  CVE-2020-27779, CVE-2021-20225, CVE-2021-20233, CVE-2020-10713,
  CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705,
  and if you were shipping the shim_lock module CVE-2021-3418
  ( July 2020 grub2 CVE list + March 2021 grub2 CVE list )
  grub2 builds ?
-------------------------------------------------------------------------------
- Yes
- Yes, we've rotated our signkey, so no old components can be started with this shim

-------------------------------------------------------------------------------
If your boot chain of trust includes linux kernel, is
"efi: Restrict efivar_ssdt_load when the kernel is locked down"
upstream commit 1957a85b0032a81e6482ca4aab883643b8dae06e applied ?
Is "ACPI: configfs: Disallow loading ACPI tables when locked down"
upstream commit 75b0cea7bf307f362057cc778efe89af4c615354 applied ?
-------------------------------------------------------------------------------
Both are applied

-------------------------------------------------------------------------------
If you use vendor_db functionality of providing multiple certificates and/or
hashes please briefly describe your certificate setup. If there are allow-listed hashes
please provide exact binaries for which hashes are created via file sharing service,
available in public with anonymous access for verification
-------------------------------------------------------------------------------
We don't use this

-------------------------------------------------------------------------------
If you are re-using a previously used (CA) certificate, you will need
to add the hashes of the previous GRUB2 binaries to vendor_dbx in shim
in order to prevent GRUB2 from being able to chainload those older GRUB2
binaries. If you are changing to a new (CA) certificate, this does not
apply. Please describe your strategy.
-------------------------------------------------------------------------------
new CA certificate

-------------------------------------------------------------------------------
What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as close as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
If possible, provide a Dockerfile that rebuilds the shim.
-------------------------------------------------------------------------------
I included the Dockerfile but it will not work for you directly as this uses internal ressources. Please download the 
resulting image from
https://users.suse.com/~jsegitz/2021.03_shim/sles_shim:15.4_x86_64.tar.gz
or 
https://users.suse.com/~jsegitz/2021.03_shim/sles_shim:15.4_aarch64.tar.gz
and import it with
docker image load -i $FILENAME
This image contains the shim sources in usr/src/packages/SOURCES/ 
and the build environment. Running
docker run --rm -it sles_shim:15.4 /bin/sh
sh-4.4# SOURCE_DATE_EPOCH=1617883200 rpmbuild -ba /usr/src/packages/SOURCES/*spec
gives you the build rpm which you can inspect with unrpm
x86_64:
unrpm /usr/src/packages/RPMS/x86_64/shim-15.4-0.x86_64.rpm
aarch64:
unrpm /usr/src/packages/RPMS/aarch64/shim-15.4-0.aarch64.rpm

After unpacking you can get the hashes.

x86_64:
sh-4.4# pesign --hash --padding --in=usr/share/efi/x86_64/shim-sles.efi
hash: cf376dd1772694b2223fd56aa97c90ca34bbc1a68eafe34aaeb14b4b9e387320
sh-4.4# sha256sum usr/share/efi/x86_64/shim-sles.efi
fa63816b0e0cc6e2cdce94bd389a8b155000a93d0182d2f8874f3b0d7753bb7a  usr/share/efi/x86_64/shim-sles.efi

aarch64:
sh-4.4# pesign --hash --padding --in=usr/share/efi/aarch64/shim-sles.efi
hash: c362c260109e9f35305dc332b5ef57295133362188558d49c653f372bda1cb6d
sh-4.4# sha256sum usr/share/efi/aarch64/shim-sles.efi
a995353bb2bb43d8ff62375789c71a66d5d2151be89c292dfc8414bef01424e2  usr/share/efi/aarch64/shim-sles.efi

-------------------------------------------------------------------------------
Which files in this repo are the logs for your build?   This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
-------------------------------------------------------------------------------
build_x86_64.log
build_aarch64.log

-------------------------------------------------------------------------------
Add any additional information you think we may need to validate this shim
-------------------------------------------------------------------------------
