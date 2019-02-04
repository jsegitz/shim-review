-------------------------------------------------------------------------------
What organization or people are asking to have this signed:
-------------------------------------------------------------------------------
SUSE, https://www.suse.com/

-------------------------------------------------------------------------------
What product or service is this for:
-------------------------------------------------------------------------------
SLES Expanded Support platform 7, provided within the 
"SUSE Linux Enterprise Server with Expanded Support" program,
https://www.suse.com/products/expandedsupport/

-------------------------------------------------------------------------------
What's the justification that this really does need to be signed for the whole world to be able to boot it:
-------------------------------------------------------------------------------
Shim is a part of a commercial support offering advertised publicly

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
  D33B C5C3 C0CC 59B6 3989  D77B EA7B F397 0175 623E

-------------------------------------------------------------------------------
What upstream shim tag is this starting from:
-------------------------------------------------------------------------------
https://github.com/rhboot/shim/releases/tag/15

Tarball sha256sum:
473720200e6dae7cfd3ce7fb27c66367a8d6b08233fe63f01aa1d6b3888deeb6  shim-15.tar.bz2

-------------------------------------------------------------------------------
URL for a repo that contains the exact code which was built to get this binary:
-------------------------------------------------------------------------------
shim-15-1.el7.src.rpm included in the docker image

-------------------------------------------------------------------------------
What patches are being applied and why:
-------------------------------------------------------------------------------
- No patches are being applied on top of original upstream shim code.
- Patches to enforce Secure Boot in grub are identical to Red Hat Enterprise Linux 7
  and CentOS 7, for example:

  https://git.centos.org/summary/?r=rpms/grub2.git
  and grub2-2.02-0.76.el7.src.rpm inside extra-srpms.tar

  0093-Don-t-allow-insmod-when-secure-boot-is-enabled.patch
  0220-Add-secureboot-support-on-efi-chainloader.patch
  0221-Make-any-of-the-loaders-that-link-in-efi-mode-honor-.patch
  0225-Rework-even-more-of-efi-chainload-so-non-sb-cases-wo.patch

- Kernel has EFI_SECURE_BOOT_SECURELEVEL kernel config option set _disabling_
  loading of untrusted code into kernel mode+patches
  identical to Red Hat Enterprise Linux 7 and CentOS 7: 

  https://git.centos.org/summary/?r=rpms/kernel.git
  and kernel-3.10.0-957.el7.src.rpm inside extra-srpms.tar

-------------------------------------------------------------------------------
What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as close as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
-------------------------------------------------------------------------------

Download: 
http://users.suse.com/~jsegitz/shim_review.tar
and extract it.

- An OS image for Docker with required dependencies, built from SLES Expanded Support platform 7.6 is included:

"sles_esp-shim-15-evaluation.tar.gz"

Build instructions:

- Import 
  docker load -i sles_esp-shim-15-evaluation.tar.gz
  and run provided OS image using Docker
- shim-15-1.el7.1.src.rpm is already included inside image's root directory for convenience
- Rebuild included SRPM as follows:

$ rpmbuild --rebuild shim-15-1.el7.1.src.rpm 2>&1 | tee build1.log

- Resulting RPMs may be found under ~/rpmbuild/RPMS/x86_64/

Versions of build tools:

- gcc-4.8.5-36.el7
- binutils-2.27-34.base.el7
- make-3.82-23.el7
- gnu-efi-3.0.8-2.el7

-------------------------------------------------------------------------------
Which files in this repo are the logs for your build?   This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
-------------------------------------------------------------------------------
build_shim_unsigned.log contains shim build log.

-------------------------------------------------------------------------------
Add any additional information you think we may need to validate this shim
-------------------------------------------------------------------------------

Shim binaries to sign are included:
shimx64.efi for x64 systems, and shimia32.efi for systems with IA-32 UEFI BIOS

Public portion of a certificate: slesecurebootca.cer

Source RPM of shim: shim-15-1.el7.1.src.rpm
Source RPMs of glibc, grub2, gnu-efi, kernel, pesign: extra-srpms.tar
