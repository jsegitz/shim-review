This repo is for review of requests for signing shim.  To create a request for review:

- clone this repo
- edit the template below
- add the shim.efi to be signed
- add build logs
- add any additional binaries/certificates/SHA256 hashes that may be needed
- commit all of that
- tag it with a tag of the form "myorg-shim-arch-YYYYMMDD"
- push that to github
- file an issue at https://github.com/rhboot/shim-review/issues with a link to your tag
- approval is ready when the "accepted" label is added to your issue

Note that we really only have experience with using GRUB2 on Linux, so asking
us to endorse anything else for signing is going to require some convincing on
your part.

Here's the template:

-------------------------------------------------------------------------------
### What organization or people are asking to have this signed?
-------------------------------------------------------------------------------
https://suse.com/

-------------------------------------------------------------------------------
### What product or service is this for?
-------------------------------------------------------------------------------
"SLES Expanded Support platform 8", provided within the 
"SUSE Liberty Linux" program,
https://www.suse.com/products/expandedsupport/

-------------------------------------------------------------------------------
### What's the justification that this really does need to be signed for the whole world to be able to boot it?
-------------------------------------------------------------------------------
Shim is a part of a commercial support offering advertised publicly.

-------------------------------------------------------------------------------
### Who is the primary contact for security updates, etc.?
The security contacts need to be verified before the shim can be accepted. For subsequent requests, contact verification is only necessary if the security contacts or their PGP keys have changed since the last successful verification.

An authorized reviewer will initiate contact verification by sending each security contact a PGP-encrypted email containing random words.
You will be asked to post the contents of these mails in your `shim-review` issue to prove ownership of the email addresses and PGP keys.

-------------------------------------------------------------------------------
- Name: Johannes Segitz
- Position: Security Engineer
- Email address: jsegitz@suse.com
- PGP key fingerprint:
  EE16 6BCE AD56 E034 BFB3  3ADD 7BF7 29D5 E7C8 1FA0

(Key should be signed by the other security contacts, pushed to a keyserver
like keyserver.ubuntu.com, and preferably have signatures that are reasonably
well known in the Linux community.)

-------------------------------------------------------------------------------
### Who is the secondary contact for security updates, etc.?
-------------------------------------------------------------------------------
- Name: Marcus Meissner
- Position: Project Manager Security
- Email address: meissner@suse.de
- PGP key fingerprint:
  7C4A FD61 D8AA E757 0796 A517 2209 D690 2F96 9C95

(Key should be signed by the other security contacts, pushed to a keyserver
like keyserver.ubuntu.com, and preferably have signatures that are reasonably
well known in the Linux community.)

-------------------------------------------------------------------------------
### Were these binaries created from the 15.6 shim release tar?
Please create your shim binaries starting with the 15.6 shim release tar file: https://github.com/rhboot/shim/releases/download/15.6/shim-15.6.tar.bz2

This matches https://github.com/rhboot/shim/releases/tag/15.6 and contains the appropriate gnu-efi source.

-------------------------------------------------------------------------------
The submission is based on shim-15.6.

-------------------------------------------------------------------------------
### URL for a repo that contains the exact code which was built to get this binary:
-------------------------------------------------------------------------------
shim-unsigned-x64-15.6-1.el8.src.rpm included with the submission

-------------------------------------------------------------------------------
### What patches are being applied and why:
-------------------------------------------------------------------------------
No patches have been applied on top of upstream shim.

-------------------------------------------------------------------------------
### If shim is loading GRUB2 bootloader what exact implementation of Secureboot in GRUB2 do you have? (Either Upstream GRUB2 shim_lock verifier or Downstream RHEL/Fedora/Debian/Canonical-like implementation)
-------------------------------------------------------------------------------
Downstream RHEL/Fedora/Debian/Canonical like implementation

-------------------------------------------------------------------------------
### If shim is loading GRUB2 bootloader and your previously released shim booted a version of grub affected by any of the CVEs in the July 2020 grub2 CVE list, the March 2021 grub2 CVE list, or the June 7th 2022 grub2 CVE list:
* CVE-2020-14372
* CVE-2020-25632
* CVE-2020-25647
* CVE-2020-27749
* CVE-2020-27779
* CVE-2021-20225
* CVE-2021-20233
* CVE-2020-10713
* CVE-2020-14308
* CVE-2020-14309
* CVE-2020-14310
* CVE-2020-14311
* CVE-2020-15705
* CVE-2021-3418 (if you are shipping the shim_lock module)

* CVE-2021-3695
* CVE-2021-3696
* CVE-2021-3697
* CVE-2022-28733
* CVE-2022-28734
* CVE-2022-28735
* CVE-2022-28736
* CVE-2022-28737
-------------------------------------------------------------------------------

### Were old shims hashes provided to Microsoft for verification and to be added to future DBX updates?
### Does your new chain of trust disallow booting old GRUB2 builds affected by the CVEs?
-------------------------------------------------------------------------------
- Yes.
- Yes.

-------------------------------------------------------------------------------
### If your boot chain of trust includes a Linux kernel:
### Is upstream commit [1957a85b0032a81e6482ca4aab883643b8dae06e "efi: Restrict efivar_ssdt_load when the kernel is locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1957a85b0032a81e6482ca4aab883643b8dae06e) applied?
### Is upstream commit [75b0cea7bf307f362057cc778efe89af4c615354 "ACPI: configfs: Disallow loading ACPI tables when locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=75b0cea7bf307f362057cc778efe89af4c615354) applied?
### Is upstream commit [eadb2f47a3ced5c64b23b90fd2a3463f63726066 "lockdown: also lock down previous kgdb use"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=eadb2f47a3ced5c64b23b90fd2a3463f63726066) applied?

-------------------------------------------------------------------------------
Yes for 1957a85b0032a81e6482ca4aab883643b8dae06e and 75b0cea7bf307f362057cc778efe89af4c615354. 
eadb2f47a3ced5c64b23b90fd2a3463f63726066 is not used as CONFIG_KDB_DEFAULT_ENABLE=0x0 in x86_64 kernels' configs.

-------------------------------------------------------------------------------
### Do you build your signed kernel with additional local patches? What do they do?
-------------------------------------------------------------------------------
This is the RHEL kernel + debranding patches included in the repo:
* debranding.patch
* patch-4.18-debrand.patch

-------------------------------------------------------------------------------
### If you use vendor_db functionality of providing multiple certificates and/or hashes please briefly describe your certificate setup.
### If there are allow-listed hashes please provide exact binaries for which hashes are created via file sharing service, available in public with anonymous access for verification.
-------------------------------------------------------------------------------
This functionality is not used.

-------------------------------------------------------------------------------
### If you are re-using a previously used (CA) certificate, you will need to add the hashes of the previous GRUB2 binaries exposed to the CVEs to vendor_dbx in shim in order to prevent GRUB2 from being able to chainload those older GRUB2 binaries. If you are changing to a new (CA) certificate, this does not apply.
### Please describe your strategy.
-------------------------------------------------------------------------------
Old keys are banned via DBX.

-------------------------------------------------------------------------------
### What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as closely as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
### If the shim binaries can't be reproduced using the provided Dockerfile, please explain why that's the case and what the differences would be.
-------------------------------------------------------------------------------
As SLES Expanded Support platform 8 has no public registry, you may use the provided Dockerfile to reproduce the build against Rocky Linux.
Have a shim SRPM and shim binaries copied alongside Dockerfile before start, then run:

$ podman build -f Dockerfile

-------------------------------------------------------------------------------
### Which files in this repo are the logs for your build?
This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.

-------------------------------------------------------------------------------
The provided build-86184-x86_64.log contains the build log of the shim.

-------------------------------------------------------------------------------
### What changes were made since your SHIM was last signed?
-------------------------------------------------------------------------------
Updated to upstream version 15.6.

-------------------------------------------------------------------------------
### What is the SHA256 hash of your final SHIM binary?
-------------------------------------------------------------------------------

$ sha256sum <file>:

a871b55a80247a0b4d3c2b7415007a52601fc855a9fdcf5c9d144b523c4571e7  shimia32.efi

1de867350ab176b82bdc7b0f76cd866346056e516ae9c85a4d994919e163e161  shimx64.efi

$ pesign --hash --padding --in=<file>:

shimia32.efi 7cf208de6142ca6f1b8ec2a8e55aa54efd8ac6d6ecb44c0e7463668d35163e9a

shimx64.efi 287b62ddb9e27c2047556a9d71b7503dafc569d30c8c0c385ae3923056d9770b

-------------------------------------------------------------------------------
### How do you manage and protect the keys used in your SHIM?
-------------------------------------------------------------------------------
The keys are in a specially hardened machine that is in our build environment.

-------------------------------------------------------------------------------
### Do you use EV certificates as embedded certificates in the SHIM?
-------------------------------------------------------------------------------
Yes.

-------------------------------------------------------------------------------
### Do you add a vendor-specific SBAT entry to the SBAT section in each binary that supports SBAT metadata ( grub2, fwupd, fwupdate, shim + all child shim binaries )?
### Please provide exact SBAT entries for all SBAT binaries you are booting or planning to boot directly through shim.
### Where your code is only slightly modified from an upstream vendor's, please also preserve their SBAT entries to simplify revocation.
-------------------------------------------------------------------------------

shim:

sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md

shim,2,UEFI shim,shim,1,https://github.com/rhboot/shim

shim.sles_es,1,SLES Expanded Support platform,shim,15.6-1.el8,mail:security@suse.com

grub2:

sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md

grub,1,Free Software Foundation,grub,2.02,https://www.gnu.org/software/grub/

grub.sles_es8,1,SLES Expanded Support platform 8,grub2,1:2.02-123.el8,mail:security@suse.com

fwupd:

fwupd-efi: sbat,1,UEFI shim,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md 

fwupd-efi,1,Firmware update daemon,fwupd,1.1,https://github.com/fwupd/fwupd

fwupd.sles_es8,1,SLES Expanded Support platform 8,fwupd,1.7.4,mail:security@suse.com

-------------------------------------------------------------------------------
### Which modules are built into your signed grub image?
-------------------------------------------------------------------------------
all_video boot blscfg
cat configfile cryptodisk echo ext2
fat font gcry_rijndael gcry_rsa gcry_serpent
gcry_sha256 gcry_twofish gcry_whirlpool
gfxmenu gfxterm gzio halt http
increment iso9660 jpeg loadenv loopback linux
lvm luks mdraid09 mdraid1x minicmd net
normal part_apple part_msdos part_gpt
password_pbkdf2 png reboot regexp search
search_fs_uuid search_fs_file search_label
serial sleep syslinuxcfg test tftp video xfs

-------------------------------------------------------------------------------
### What is the origin and full version number of your bootloader (GRUB or other)?
-------------------------------------------------------------------------------
grub2-2.02-123.el8_6.8, included with this submission, following RHEL

-------------------------------------------------------------------------------
### If your SHIM launches any other components, please provide further details on what is launched.
-------------------------------------------------------------------------------
It additionally may launch fwupd.

-------------------------------------------------------------------------------
### If your GRUB2 launches any other binaries that are not the Linux kernel in SecureBoot mode, please provide further details on what is launched and how it enforces Secureboot lockdown.
-------------------------------------------------------------------------------
GRUB2 only launches the Linux kernel.

-------------------------------------------------------------------------------
### How do the launched components prevent execution of unauthenticated code?
-------------------------------------------------------------------------------
GRUB2 verifies signatures of kernels booted via shim.

-------------------------------------------------------------------------------
### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB)?
-------------------------------------------------------------------------------
Only GRUB is used.

-------------------------------------------------------------------------------
### What kernel are you using? Which patches does it includes to enforce Secure Boot?
-------------------------------------------------------------------------------
kernel-4.18.0+ with lockdown patches (recently, kernel-4.18.0-372.9.1.el8)

-------------------------------------------------------------------------------
### Add any additional information you think we may need to validate this shim.
-------------------------------------------------------------------------------
extra-srpms directory contains binutils, grub2, kernel, and pesign sources. The kernel src rpm
had to be split because it is to big for github. Please just concat the files
