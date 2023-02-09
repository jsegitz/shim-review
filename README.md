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

*******************************************************************************
### What organization or people are asking to have this signed?
*******************************************************************************
SUSE
https://suse.com/

*******************************************************************************
### What product or service is this for?
*******************************************************************************
"SLES Expanded Support platform 8", provided within the 
"SUSE Liberty Linux" program,
https://www.suse.com/products/expandedsupport/

*******************************************************************************
### What's the justification that this really does need to be signed for the whole world to be able to boot it?
*******************************************************************************
Shim is a part of a commercial support offering advertised publicly.

*******************************************************************************
### Why are you unable to reuse shim from another distro that is already signed?
*******************************************************************************
Other distros won't boot our grub.

*******************************************************************************
### Who is the primary contact for security updates, etc.?
The security contacts need to be verified before the shim can be accepted. For subsequent requests, contact verification is only necessary if the security contacts or their PGP keys have changed since the last successful verification.

An authorized reviewer will initiate contact verification by sending each security contact a PGP-encrypted email containing random words.
You will be asked to post the contents of these mails in your `shim-review` issue to prove ownership of the email addresses and PGP keys.
*******************************************************************************
- Name: Johannes Segitz
- Position: Security Engineer
- Email address: jsegitz@suse.com
- PGP key fingerprint:
  EE16 6BCE AD56 E034 BFB3  3ADD 7BF7 29D5 E7C8 1FA0

(Key should be signed by the other security contacts, pushed to a keyserver
like keyserver.ubuntu.com, and preferably have signatures that are reasonably
well known in the Linux community.)

*******************************************************************************
### Who is the secondary contact for security updates, etc.?
*******************************************************************************
- Name: Marcus Meissner
- Position: Project Manager Security
- Email address: meissner@suse.de
- PGP key fingerprint:
  7C4A FD61 D8AA E757 0796 A517 2209 D690 2F96 9C95

(Key should be signed by the other security contacts, pushed to a keyserver
like keyserver.ubuntu.com, and preferably have signatures that are reasonably
well known in the Linux community.)

*******************************************************************************
### Were these binaries created from the 15.7 shim release tar?
Please create your shim binaries starting with the 15.7 shim release tar file: https://github.com/rhboot/shim/releases/download/15.7/shim-15.7.tar.bz2

This matches https://github.com/rhboot/shim/releases/tag/15.7 and contains the appropriate gnu-efi source.

*******************************************************************************
Yes, the binaries were created from https://github.com/rhboot/shim/releases/download/15.7/shim-15.7.tar.bz2
Additional patches from https://github.com/rhboot/shim/pull/530/commits/a53b9f7ceec1dfa1487f4d675573449c5b2a16fb
and https://github.com/rhboot/shim/commit/657b2483ca6e9fcf2ad8ac7ee577ff546d24c3aa have been applied.

*******************************************************************************
### URL for a repo that contains the exact code which was built to get this binary:
*******************************************************************************
shim-unsigned-x64-15.7-1.el8.src.rpm included with the submission

*******************************************************************************
### What patches are being applied and why:
*******************************************************************************
https://github.com/rhboot/shim/pull/530/commits/a53b9f7ceec1dfa1487f4d675573449c5b2a16fb ("Enable-the-NX-compatibility-flag-by-default.patch") to enable the NX compatibility flag per recent requirements from Microsoft
https://github.com/rhboot/shim/commit/657b2483ca6e9fcf2ad8ac7ee577ff546d24c3aa ("Make sbat_var.S parse right with buggy gcc/binutils") to build the shim properly on SLES ES 8 and older systems

*******************************************************************************
### If shim is loading GRUB2 bootloader what exact implementation of Secureboot in GRUB2 do you have? (Either Upstream GRUB2 shim_lock verifier or Downstream RHEL/Fedora/Debian/Canonical-like implementation)
*******************************************************************************
Downstream RHEL/Fedora/Debian/Canonical like implementation

*******************************************************************************
### If shim is loading GRUB2 bootloader and your previously released shim booted a version of grub affected by any of the CVEs in the July 2020 grub2 CVE list, the March 2021 grub2 CVE list, the June 7th 2022 grub2 CVE list, or the November 15th 2022 list, have fixes for all these CVEs been applied?

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

* CVE-2022-2601
* CVE-2022-3775
*******************************************************************************
Our bootloader is derived from grub-2.02 and include all of the required patches.

*******************************************************************************
### If these fixes have been applied, have you set the global SBAT generation on your GRUB binary to 3?
*******************************************************************************
Yes

*******************************************************************************
### Were old shims hashes provided to Microsoft for verification and to be added to future DBX updates?
### Does your new chain of trust disallow booting old GRUB2 builds affected by the CVEs?
*******************************************************************************
- Yes.
- Yes.

*******************************************************************************
### If your boot chain of trust includes a Linux kernel:
### Is upstream commit [1957a85b0032a81e6482ca4aab883643b8dae06e "efi: Restrict efivar_ssdt_load when the kernel is locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1957a85b0032a81e6482ca4aab883643b8dae06e) applied?
### Is upstream commit [75b0cea7bf307f362057cc778efe89af4c615354 "ACPI: configfs: Disallow loading ACPI tables when locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=75b0cea7bf307f362057cc778efe89af4c615354) applied?
### Is upstream commit [eadb2f47a3ced5c64b23b90fd2a3463f63726066 "lockdown: also lock down previous kgdb use"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=eadb2f47a3ced5c64b23b90fd2a3463f63726066) applied?
*******************************************************************************
Yes for 1957a85b0032a81e6482ca4aab883643b8dae06e and 75b0cea7bf307f362057cc778efe89af4c615354.

eadb2f47a3ced5c64b23b90fd2a3463f63726066 is not used as CONFIG_KDB_DEFAULT_ENABLE=0x0 in x86_64 kernels' configs.

*******************************************************************************
### Do you build your signed kernel with additional local patches? What do they do?
*******************************************************************************
Yes, but only branding changes and bug fixes vs the publicly available RHEL source. No change to the secure
boot functionality

*******************************************************************************
### If you use vendor_db functionality of providing multiple certificates and/or hashes please briefly describe your certificate setup.
### If there are allow-listed hashes please provide exact binaries for which hashes are created via file sharing service, available in public with anonymous access for verification.
*******************************************************************************
N/A

*******************************************************************************
### If you are re-using a previously used (CA) certificate, you will need to add the hashes of the previous GRUB2 binaries exposed to the CVEs to vendor_dbx in shim in order to prevent GRUB2 from being able to chainload those older GRUB2 binaries. If you are changing to a new (CA) certificate, this does not apply.
### Please describe your strategy.
*******************************************************************************
Old keys (and binaries if necessary) are bannded via dbx.esl in shim.

*******************************************************************************
### What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as closely as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
### If the shim binaries can't be reproduced using the provided Dockerfile, please explain why that's the case and what the differences would be.
*******************************************************************************
As SLES Expanded Support platform 8 has no public registry, you may use the provided Dockerfile to reproduce the build against e.g. Rocky Linux.
Have a shim SRPM and shim binaries copied alongside Dockerfile before start, then run:

$ podman build --security-opt=seccomp=unconfined -f Dockerfile

(The use of `--security-opt=seccomp=unconfined` is for systems where builds of 32-bit shim fail).

*******************************************************************************
### Which files in this repo are the logs for your build?
This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
*******************************************************************************
The provided build-x86_64.log contains the build log of the shim from the internal build system.
Docker build mentioned above provides identical shim binaries.

*******************************************************************************
### What changes were made since your SHIM was last signed?
*******************************************************************************
- Update to upstream version 15.7

- Enable NX flag by default

- Make sure shim is built properly with binutils from SLES ES 8 and older

*******************************************************************************
### What is the SHA256 hash of your final SHIM binary?
*******************************************************************************
Output from sha256sum:

$ sha256sum shimia32.efi

ac0e46972f3194951ae9a85cb651fa7cffbac9c43915c7cfc726e6530c69c2f3  shimia32.efi

$ sha256sum shimx64.efi

55ff5b62ca47c351ce074289c1518a3a15fe664f7ce75d10db74c70e192f5a80  shimx64.efi


Output from pesign:

$ pesign --hash --padding --in=shimia32.efi

hash: af15f0049cbba5af927c6a9c7d071dab05eab1921d5fc96022f08876c1be534d

$ pesign --hash --padding --in=shimx64.efi

hash: 0e4bdcbb61dc02eeb6cf2eac9bd123d16afd87419851803a8f7ab0cb7a970875

*******************************************************************************
### How do you manage and protect the keys used in your SHIM?
*******************************************************************************
The keys are in a specially hardened machine that is in our build environment.

*******************************************************************************
### Do you use EV certificates as embedded certificates in the SHIM?
*******************************************************************************
No

*******************************************************************************
### Do you add a vendor-specific SBAT entry to the SBAT section in each binary that supports SBAT metadata ( grub2, fwupd, fwupdate, shim + all child shim binaries )?
### Please provide exact SBAT entries for all SBAT binaries you are booting or planning to boot directly through shim.
### Where your code is only slightly modified from an upstream vendor's, please also preserve their SBAT entries to simplify revocation.
*******************************************************************************
Yes

shim:
shim,3,UEFI shim,shim,1,https://github.com/rhboot/shim
shim.sles_es,3,SLES Expanded Support platform,shim,15.7-1.el8,mail:security@suse.com

grub2:

grub,3,Free Software Foundation,grub,2.02,https//www.gnu.org/software/grub/
grub.sles,3,SLES Expanded Support,grub2,2.02,mail:security@suse.com

fwupd:

fwupd-efi,1,Firmware update daemon,fwupd-efi,1.3,https://github.com/fwupd/fwupd-efi
fwupd-efi.sles,1,SLES Expanded Support,fwupd,1.7.8,mail:security@suse.com


*******************************************************************************
### Which modules are built into your signed grub image?
*******************************************************************************
all_video boot blscfg btrfs cat configfile cryptodisk echo ext2 fat font
gcry_rijndael gcry_rsa gcry_serpent gcry_sha256 gcry_twofish gcry_whirlpool
gfxmenu gfxterm gzio halt hfsplus http increment iso9660 jpeg loadenv loopback
linux lvm luks mdraid09 mdraid1x minicmd net normal part_apple part_msdos
part_gpt password_pbkdf2 png reboot regexp search search_fs_uuid search_fs_file
search_label serial sleep syslinuxcfg test tftp video xfs efi_netfs efifwsetup
efinet lsefi lsefimmap connectefi backtrace chain usb usbserial_common
usbserial_pl2303 usbserial_ftdi usbserial_usbdebug keylayouts at_keyboard

*******************************************************************************
### What is the origin and full version number of your bootloader (GRUB or other)?
*******************************************************************************
grub2-2.02-142.el8_7.1, based on publicly availble RHEL source with branding patches applied on top.

*******************************************************************************
### If your SHIM launches any other components, please provide further details on what is launched.
*******************************************************************************
Shim also launches fwupd.

*******************************************************************************
### If your GRUB2 launches any other binaries that are not the Linux kernel in SecureBoot mode, please provide further details on what is launched and how it enforces Secureboot lockdown.
*******************************************************************************
N/A

*******************************************************************************
### How do the launched components prevent execution of unauthenticated code?
*******************************************************************************
Grub2 verifies signatures of kernels; fwupd does not launch any other binaries
(used only for UEFI updates).

*******************************************************************************
### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB)?
*******************************************************************************
No

*******************************************************************************
### What kernel are you using? Which patches does it includes to enforce Secure Boot?
*******************************************************************************
kernel-4.18.0-425.10.1.el8_7 based on publicly available RHEL source with lockdown patches.
The source rpm is too big for git, so it was split in two files. To get the orginal 
archive run:
dd if=kernel-4.18.0-425.10.1.el8_7.src.rpmaa of=kernel-4.18.0-425.10.1.el8_7.src.rpm
dd if=kernel-4.18.0-425.10.1.el8_7.src.rpmab oflag=append conv=notrunc of=kernel-4.18.0-425.10.1.el8_7.src.rpm



*******************************************************************************
### Add any additional information you think we may need to validate this shim.
*******************************************************************************
Source RPMs of shim, grub2, and kernel have been included with the submission.
