-------------------------------------------------------------------------------
What organization or people are asking to have this signed:
-------------------------------------------------------------------------------
SUSE, https://www.suse.com/

-------------------------------------------------------------------------------
What product or service is this for:
-------------------------------------------------------------------------------
openSUSE Leap 15.1

-------------------------------------------------------------------------------
What's the justification that this really does need to be signed for the whole world to be able to boot it:
-------------------------------------------------------------------------------
Shim is a part of major Linux distribution

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
It is shim-15, up to https://github.com/rhboot/shim/commit/b3e4d1f7555aabbf5d54de5ea7cd7e839e7bd83d

-------------------------------------------------------------------------------
URL for a repo that contains the exact code which was built to get this binary:
-------------------------------------------------------------------------------
http://users.suse.com/~jsegitz/2019.01_leap_15_1_shim_files/shim-15+git47-0.src.rpm

-------------------------------------------------------------------------------
What patches are being applied and why:
-------------------------------------------------------------------------------

- shim-arch-independent-names.patch: Make the names of EFI binaries arch-independent
- shim-change-debug-file-path.patch: SUSE specific debug path
- shim-always-mirror-mok-variables.patch: Mirror MOK variables correctly
- shim-correct-license-in-headers.patch: Just license adjustments
- shim-opensuse-cert-prompt.patch: Ask if the user is willing to trust the built-in openSUSE certificate.
- shim-bsc1092000-fallback-menu.patch: Make countdown function public

-------------------------------------------------------------------------------
What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as close as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
-------------------------------------------------------------------------------

- Download the 
  http://users.suse.com/~jsegitz/2019.01_leap_15_1_shim_files/openSUSE-Tumbleweed-DVD-x86_64-Snapshot20190201-Media.iso
- Boot the system and install with default setings, select "Server" role
- Don't install updates during the installation
- Boot the system, run:
  $ zypper in rpmbuild pesign-obs-integration update-bootloader-rpm-macros gnu-efi
- Build shim from source rpm
  http://users.suse.com/~jsegitz/2019.01_leap_15_1_shim_files/shim-15+git47-0.src.rpm
  rpmbuild --rebuild shim-*.src.rpm
- The resulting rpm is in /usr/src/packages/RPMS/x86_64/shim-15+git47-0.x86_64.rpm

Versions of build tools:

- gcc-8-2.4
- binutils-2.31-3.4
- make-4.2.1-7.5
- gnu-efi-3.0.8-1.2

-------------------------------------------------------------------------------
Which files in this repo are the logs for your build?   This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
-------------------------------------------------------------------------------

build.log contains shim build log.

-------------------------------------------------------------------------------
Add any additional information you think we may need to validate this shim
-------------------------------------------------------------------------------
