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
SUSE, https://suse.com

-------------------------------------------------------------------------------
What product or service is this for:
-------------------------------------------------------------------------------
SLES Expanded Support platform 8, provided within the 
"SUSE Linux Enterprise Server with Expanded Support" program,
https://www.suse.com/products/expandedsupport/

-------------------------------------------------------------------------------
What's the justification that this really does need to be signed for the whole world to be able to boot it:
-------------------------------------------------------------------------------
Shim is a part of a commercial support offering advertised publicly.

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
  7C4A FD61 D8AA E757 0796 A517 2209 D690 2F96 9C95

-------------------------------------------------------------------------------
Please create your shim binaries starting with the 15.4 shim release tar file:
https://github.com/rhboot/shim/releases/download/15.4/shim-15.4.tar.bz2

This matches https://github.com/rhboot/shim/releases/tag/15.4 and contains
the appropriate gnu-efi source.
-------------------------------------------------------------------------------
The submission is based on Shim-15.4.

-------------------------------------------------------------------------------
URL for a repo that contains the exact code which was built to get this binary:
-------------------------------------------------------------------------------
shim-unsigned-x64-15.4-4.el8.1.src.rpm included with the submission

-------------------------------------------------------------------------------
What patches are being applied and why:
-------------------------------------------------------------------------------
The following patches have been applied:
- 0001-Fix-a-broken-file-header-on-ia32.patch: Fix a broken file header on ia32
- Don-t-call-QueryVariableInfo-on-EFI-1.10-machines.patch: Don't call QueryVariableInfo() on EFI 1.10 machines
- MOK-BootServicesData.patch: mok: allocate MOK config table as BootServicesData
- fix-import_one_mok_state.patch: Fix handling of ignore_db and user_insecure_mode
They're in the src.rpm and additionally in shim_patches.tar

-------------------------------------------------------------------------------
If bootloader, shim loading is, GRUB2: is CVE-2020-14372, CVE-2020-25632,
 CVE-2020-25647, CVE-2020-27749, CVE-2020-27779, CVE-2021-20225, CVE-2021-20233,
 CVE-2020-10713, CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311,
 CVE-2020-15705, and if you are shipping the shim_lock module CVE-2021-3418
-------------------------------------------------------------------------------
Yes

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
- Yes.

-------------------------------------------------------------------------------
If your boot chain of trust includes linux kernel, is
"efi: Restrict efivar_ssdt_load when the kernel is locked down"
upstream commit 1957a85b0032a81e6482ca4aab883643b8dae06e applied ?
Is "ACPI: configfs: Disallow loading ACPI tables when locked down"
upstream commit 75b0cea7bf307f362057cc778efe89af4c615354 applied ?
-------------------------------------------------------------------------------
Yes, both are applied.

-------------------------------------------------------------------------------
If you use vendor_db functionality of providing multiple certificates and/or
hashes please briefly describe your certificate setup. If there are allow-listed hashes
please provide exact binaries for which hashes are created via file sharing service,
available in public with anonymous access for verification
-------------------------------------------------------------------------------
We're not using vendor_db.

-------------------------------------------------------------------------------
If you are re-using a previously used (CA) certificate, you will need
to add the hashes of the previous GRUB2 binaries to vendor_dbx in shim
in order to prevent GRUB2 from being able to chainload those older GRUB2
binaries. If you are changing to a new (CA) certificate, this does not
apply. Please describe your strategy.
-------------------------------------------------------------------------------
The new certificate is used, and the old one is revoked via dbx.

-------------------------------------------------------------------------------
What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as close as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
If the shim binaries can't be reproduced using the provided Dockerfile, please explain why that's the case and the differences would be.
-------------------------------------------------------------------------------
As SLES Expanded Support platform does not have a public registry, an image for
use with podman is available due to the size at
https://users.suse.com/~jsegitz/2021.05_es_shim/sles_esp-shim-15.4-4.el8.1.tar.gz
The dockerfile included directly into this submission

Alternatively, a "Dockerfile.with-centos8" may be used to reproduce the build on CentOS 8.
In this case, a CentOS 8 image will be imported from a public registry.

Build instructions (for use with sudo or root user and default podman setup):

- Load OS image, e.g.
  
  podman load -i sles_esp-shim-15.4-4.el8.1.tar.gz
  
  podman images

- Have shim*.efi files from this submission in the current directory.

- Run the build. A copy of source RPM is included into the OS image (/shim-unsigned-x64-15.4-4.el8.1.src.rpm).
  Note that Podman will attempt copying prebuilt shims for comparison from a current directory on the host:
  
  podman build -f Dockerfile

- Observe output and results.

Build instructions for a CentOS 8 image (for use with sudo or root user and default podman setup):

- Have shim*.efi files and shim-unsigned-x64-15.4-4.el8.1.src.rpm from this submission in the current directory.

- Run the build. Note that Podman will attempt copying a SRPM and prebuilt shims for comparison from a current directory on the host:

  podman build -f Dockerfile.with-centos8

- Observe output and results.

Versions of tools used:

- gcc-8.3.1-5.1.el8.x86_64
- binutils-2.30-79.el8
- pesign-0.112-25.el8

-------------------------------------------------------------------------------
Which files in this repo are the logs for your build?   This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
-------------------------------------------------------------------------------
build.log

-------------------------------------------------------------------------------
Add any additional information you think we may need to validate this shim
-------------------------------------------------------------------------------
Source RPMs of kernel, grub2, and build tools are available at
https://users.suse.com/~jsegitz/2021.05_es_shim/extra-srpms.tar
