-------------------------------------------------------------------------------
What organization or people are asking to have this signed:
-------------------------------------------------------------------------------
SUSE, https://www.suse.com/

-------------------------------------------------------------------------------
What product or service is this for:
-------------------------------------------------------------------------------
SLES Expanded Support platform 8, provided within the 
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
  D33B C5C3 C0CC 59B6 3989 D77B EA7B F397 0175 623E

-------------------------------------------------------------------------------
What upstream shim tag is this starting from:
-------------------------------------------------------------------------------
https://github.com/rhboot/shim/releases/tag/15

Tarball sha256sum:
473720200e6dae7cfd3ce7fb27c66367a8d6b08233fe63f01aa1d6b3888deeb6  shim-15.tar.bz2

-------------------------------------------------------------------------------
URL for a repo that contains the exact code which was built to get this binary:
-------------------------------------------------------------------------------
https://users.suse.com/~jsegitz/2019.07_sles_es_8_shim_files/shim-unsigned-x64-15-2.el8.src.rpm

-------------------------------------------------------------------------------
What patches are being applied and why:
-------------------------------------------------------------------------------
- Bugfix patches to upstream shim 15 have been applied:

  Added 0005-MokListRT-Fatal.patch to avoid crashing legacy uefi/non SB machines (from CentOS, 1 patch)
  Fix MoK mirroring issue which breaks kdump without intervention (from shim-16, 4 patches)

- Patches to enforce Secure Boot in grub are identical to Red Hat Enterprise Linux 8
  and (upcoming) CentOS 8, for example:

  grub2-2.02-66.el8.src.rpm inside extra-srpms.tar
  https://git.centos.org/rpms/grub2/tree/c8
  0004-Add-secureboot-support-on-efi-chainloader.patch
  0005-Make-any-of-the-loaders-that-link-in-efi-mode-honor-.patch

  kernel-4.18.0-80.el8 with lockdown patches is identical to the one of Red Hat Enterprise
  Linux 8 and (upcoming) CentOS 8, available through CentOS git: 
  https://git.centos.org/rpms/kernel/tree/c8

  Source RPM is included for reference inside extra-srpms.tar: kernel-4.18.0-80.el8.src.rpm.

-------------------------------------------------------------------------------
What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as close as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
-------------------------------------------------------------------------------

- A chroot tarball with required dependencies, built from SLES Expanded Support platform 8.0 is included:

  https://users.suse.com/~jsegitz/2019.07_sles_es_8_shim_files/sles_esp-0604-8.0v5.tar.gz
  sha256sum: 5067e29ef506d1680aa9ba55bcb44a2218ed3b4eb179a54cd94db8ceb2a8561f

Build instructions:

- Being logged in as root, or using sudo, unpack the tarball, then chroot to unpacked content
- shim-unsigned-x64-15-2.el8.src.rpm is already included inside chroot's top level directory for convenience
- Rebuild included SRPM inside chroot as follows:

$ rpmbuild --rebuild shim-unsigned-x64-15-2.el8.src.rpm 2>&1 | tee build1.log

- Resulting RPMs may be found under ~/rpmbuild/RPMS/x86_64/

Versions of build tools:

- gcc-8.2.1-3.5.el8
- binutils-2.30-49.el8
- make-4.2.1-9.el8
- gnu-efi-3.0.8-2.el8

-------------------------------------------------------------------------------
Which files in this repo are the logs for your build?   This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
-------------------------------------------------------------------------------
https://users.suse.com/~jsegitz/2019.07_sles_es_8_shim_files/shim-unsigned.build.log
contains shim build log.

-------------------------------------------------------------------------------
Add any additional information you think we may need to validate this shim
-------------------------------------------------------------------------------

Shim binaries to sign are included:
shimx64.efi for x64 systems, and shimia32.efi for systems with IA-32 UEFI BIOS

Public portion of a certificate: 
https://users.suse.com/~jsegitz/2019.07_sles_es_8_shim_files/slesecurebootca.cer

Source RPM of shim: 
https://users.suse.com/~jsegitz/2019.07_sles_es_8_shim_files/shim-unsigned-x64-15-2.el8.src.rpm
Source RPMs of glibc, grub2, gnu-efi, kernel, pesign: 
https://users.suse.com/~jsegitz/2019.07_sles_es_8_shim_files/extra-srpms.tar
