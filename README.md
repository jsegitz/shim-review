-------------------------------------------------------------------------------
What organization or people are asking to have this signed:
-------------------------------------------------------------------------------
SUSE, https://www.suse.com/

-------------------------------------------------------------------------------
What product or service is this for:
-------------------------------------------------------------------------------
SUSE Linux Enterprice Server 15 SP1

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
It is shim-15, up to https://github.com/rhboot/shim/commit/b3e4d1f7555aabbf5d54de5ea7cd7e839e7bd83d

-------------------------------------------------------------------------------
URL for a repo that contains the exact code which was built to get this binary:
-------------------------------------------------------------------------------
http://users.suse.com/~jsegitz/2019.01_sles_15_1_shim_files/shim-15+git47-0.src.rpm

-------------------------------------------------------------------------------
What patches are being applied and why:
-------------------------------------------------------------------------------

- shim-arch-independent-names.patch: Make the names of EFI binaries arch-independent
- shim-change-debug-file-path.patch: SUSE specific debug path
- shim-always-mirror-mok-variables.patch: Mirror MOK variables correctly
- shim-correct-license-in-headers.patch: Just license adjustments
- shim-opensuse-cert-prompt.patch: not applied in SLES shim
- shim-bsc1092000-fallback-menu.patch: Make countdown function public

-------------------------------------------------------------------------------
What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as close as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
-------------------------------------------------------------------------------

- Download the SLE-15 SP1 Beta 2 images from https://www.suse.com/betaprogram/sle-beta/
  SLE-15-SP1-Installer-DVD-x86_64-Beta2-DVD1.iso
  SLE-15-SP1-Packages-x86_64-Beta2-DVD1.iso
- Boot the system with SLE-15-SP1-Installer-DVD-x86_64-Beta2-DVD1.iso chose "Installation"
- Select "SUSE Linux Enterprise Server 15 SP1 Beta2" to install
- Skip registration
- When reaching the "Add-On Product" page, toggle “I would like to install an additional Add On Product”,
  select "DVD", and insert the Packages DVD. Then choose the following repositories: “Desktop-Applications”,
  “Basesystem” and “Development-Tools”.
- Carry on and install the "minimal" system 
- Mount the iso as needed once you're asked 
- After installation, login the system. Insert packages iso (if it's not still mounted) and type the following command to setup the build environment:
  $ zypper in rpmbuild pesign-obs-integration 
- Download 
  * http://users.suse.com/~jsegitz/2019.01_sles_15_1_shim_files/update-bootloader-rpm-macros-0-1.23.noarch.rpm
  * http://users.suse.com/~jsegitz/2019.01_sles_15_1_shim_files/gnu-efi-3.0.8-5.2.x86_64.rpm
  and install it :
  $ zypper in update-bootloader-rpm-macros-0-1.23.noarch.rpm gnu-efi-3.0.8-5.2.x86_64.rpm
- Build shim from source rpm
  http://users.suse.com/~jsegitz/2019.01_sles_15_1_shim_files/shim-15+git47-0.src.rpm
  rpmbuild --rebuild shim-*.src.rpm
- The resulting rpm is in /usr/src/packages/RPMS/x86_64/shim-15+git47-0.x86_64.rpm

Versions of build tools:

- gcc-7-1.563
- binutils-2.31-6.3.1
- make-4.2.1-7.3.2
- gnu-efi-3.0.8-5.3

-------------------------------------------------------------------------------
Which files in this repo are the logs for your build?   This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
-------------------------------------------------------------------------------

build.log contains shim build log.

-------------------------------------------------------------------------------
Add any additional information you think we may need to validate this shim
-------------------------------------------------------------------------------
