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
SUSE, https://www.suse.com/

*******************************************************************************
### What product or service is this for?
*******************************************************************************
openSUSE Tumbleweed and other openSUSE variants

*******************************************************************************
### What's the justification that this really does need to be signed for the whole world to be able to boot it?
*******************************************************************************
SUSE is one of the major vendors in the Linux ecospace and this shim is a part
of an open source project we sponsor/support

*******************************************************************************
### Why are you unable to reuse shim from another distro that is already signed?
*******************************************************************************
They don't boot our grub

*******************************************************************************
### Who is the primary contact for security updates, etc.?
The security contacts need to be verified before the shim can be accepted. For subsequent requests, contact verification is only necessary if the security contacts or their PGP keys have changed since the last successful verification.

An authorized reviewer will initiate contact verification by sending each security contact a PGP-encrypted email containing random words.
You will be asked to post the contents of these mails in your `shim-review` issue to prove ownership of the email addresses and PGP keys.
*******************************************************************************
- Name: Johannes Segitz
- Position: Security Engineer
- Email address: jsegitz@suse.com
- PGP key fingerprint: EE16 6BCE AD56 E034 BFB3  3ADD 7BF7 29D5 E7C8 1FA0

(Key should be signed by the other security contacts, pushed to a keyserver
like keyserver.ubuntu.com, and preferably have signatures that are reasonably
well known in the Linux community.)

*******************************************************************************
### Who is the secondary contact for security updates, etc.?
*******************************************************************************
- Name: Marcus Meissner
- Position: Project Manager Security
- Email address: meissner@suse.de
- PGP key fingerprint: 7C4A FD61 D8AA E757 0796  A517 2209 D690 2F96 9C95

(Key should be signed by the other security contacts, pushed to a keyserver
like keyserver.ubuntu.com, and preferably have signatures that are reasonably
well known in the Linux community.)

*******************************************************************************
### Were these binaries created from the 15.8 shim release tar?
Please create your shim binaries starting with the 15.8 shim release tar file: https://github.com/rhboot/shim/releases/download/15.8/shim-15.8.tar.bz2

This matches https://github.com/rhboot/shim/releases/tag/15.8 and contains the appropriate gnu-efi source.

*******************************************************************************
yes

*******************************************************************************
### URL for a repo that contains the exact code which was built to get this binary:
*******************************************************************************
https://build.opensuse.org/package/show/devel:openSUSE:Factory/shim

This project build just against Factory, which is rather unstable. So it was branched to
https://build.opensuse.org/package/show/home:jsegitz:branches:devel:openSUSE:Factory2/shim
to enable the build against 15.5, which is the main target

*******************************************************************************
### What patches are being applied and why:
*******************************************************************************
Unchanged from last reviewed shim:
- remove_build_id.patch: don't add the build id from the resulting binaries
- shim-arch-independent-names.patch: use the Arch-independent names.
- shim-bsc1177315-verify-eku-codesign.patch: Check CodeSign in the signer's EKU
- shim-change-debug-file-path.patch: change path of debug file
- shim-disable-export-vendor-dbx.patch: Prevent issues with ill behaving firmware

*******************************************************************************
### Do you have the NX bit set in your shim? If so, is your entire boot stack NX-compatible and what testing have you done to ensure such compatibility?

See https://techcommunity.microsoft.com/t5/hardware-dev-center/nx-exception-for-shim-community/ba-p/3976522 for more details on the signing of shim without NX bit.
*******************************************************************************
NX isn't set for this shim

*******************************************************************************
### If shim is loading GRUB2 bootloader what exact implementation of Secureboot in GRUB2 do you have? (Either Upstream GRUB2 shim_lock verifier or Downstream RHEL/Fedora/Debian/Canonical-like implementation)
*******************************************************************************
Downstream RHEL/Fedora/Debian/Canonical like implementation

*******************************************************************************
### If shim is loading GRUB2 bootloader and your previously released shim booted a version of GRUB2 affected by any of the CVEs in the July 2020, the March 2021, the June 7th 2022, the November 15th 2022, or 3rd of October 2023 GRUB2 CVE list, have fixes for all these CVEs been applied?

* 2020 July - BootHole
  * Details: https://lists.gnu.org/archive/html/grub-devel/2020-07/msg00034.html
  * CVE-2020-10713
  * CVE-2020-14308
  * CVE-2020-14309
  * CVE-2020-14310
  * CVE-2020-14311
  * CVE-2020-15705
  * CVE-2020-15706
  * CVE-2020-15707
* March 2021
  * Details: https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html
  * CVE-2020-14372
  * CVE-2020-25632
  * CVE-2020-25647
  * CVE-2020-27749
  * CVE-2020-27779
  * CVE-2021-3418 (if you are shipping the shim_lock module)
  * CVE-2021-20225
  * CVE-2021-20233
* June 2022
  * Details: https://lists.gnu.org/archive/html/grub-devel/2022-06/msg00035.html, SBAT increase to 2
  * CVE-2021-3695
  * CVE-2021-3696
  * CVE-2021-3697
  * CVE-2022-28733
  * CVE-2022-28734
  * CVE-2022-28735
  * CVE-2022-28736
  * CVE-2022-28737
* November 2022
  * Details: https://lists.gnu.org/archive/html/grub-devel/2022-11/msg00059.html, SBAT increase to 3
  * CVE-2022-2601
  * CVE-2022-3775
* October 2023 - NTFS vulnerabilities
  * Details: https://lists.gnu.org/archive/html/grub-devel/2023-10/msg00028.html, SBAT increase to 4
  * CVE-2023-4693
  * CVE-2023-4692
*******************************************************************************
yes

*******************************************************************************
### If shim is loading GRUB2 bootloader, and if these fixes have been applied, is the upstream global SBAT generation in your GRUB2 binary set to 4?
The entry should look similar to: `grub,4,Free Software Foundation,grub,GRUB_UPSTREAM_VERSION,https://www.gnu.org/software/grub/`
*******************************************************************************
yes

*******************************************************************************
### Were old shims hashes provided to Microsoft for verification and to be added to future DBX updates?
### Does your new chain of trust disallow booting old GRUB2 builds affected by the CVEs?
*******************************************************************************
yes
yes

*******************************************************************************
### If your boot chain of trust includes a Linux kernel:
### Is upstream commit [1957a85b0032a81e6482ca4aab883643b8dae06e "efi: Restrict efivar_ssdt_load when the kernel is locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1957a85b0032a81e6482ca4aab883643b8dae06e) applied?
### Is upstream commit [75b0cea7bf307f362057cc778efe89af4c615354 "ACPI: configfs: Disallow loading ACPI tables when locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=75b0cea7bf307f362057cc778efe89af4c615354) applied?
### Is upstream commit [eadb2f47a3ced5c64b23b90fd2a3463f63726066 "lockdown: also lock down previous kgdb use"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=eadb2f47a3ced5c64b23b90fd2a3463f63726066) applied?
*******************************************************************************
yes

*******************************************************************************
### Do you build your signed kernel with additional local patches? What do they do?
*******************************************************************************
We have a large team of kernel engineers and quite a number of patches we carry (~1900 
at the moment). I think this question is next to impossible to answer for us.
Can this please be made more specific? Answering this would results in a wall
of text here.

*******************************************************************************
### Do you use an ephemeral key for signing kernel modules?
### If not, please describe how you ensure that one kernel build does not load modules built for another kernel.
*******************************************************************************
We don't use ephemeral keys. There's no mechanism to ensure that kernel modules are not loaded by another kernel.

*******************************************************************************
### If you use vendor_db functionality of providing multiple certificates and/or hashes please briefly describe your certificate setup.
### If there are allow-listed hashes please provide exact binaries for which hashes are created via file sharing service, available in public with anonymous access for verification.
*******************************************************************************
We don't use this

*******************************************************************************
### If you are re-using a previously used (CA) certificate, you will need to add the hashes of the previous GRUB2 binaries exposed to the CVEs to vendor_dbx in shim in order to prevent GRUB2 from being able to chainload those older GRUB2 binaries. If you are changing to a new (CA) certificate, this does not apply.
### Please describe your strategy.
*******************************************************************************
We either rely on SBAT, or in cases where this doesn't work we switch to a new signing key, and blacklist the old ones in our vendor dbx.

*******************************************************************************
### What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as closely as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
### If the shim binaries can't be reproduced using the provided Dockerfile, please explain why that's the case and what the differences would be.
*******************************************************************************
The included Dockerfile will build the image for you. 
podman build -t opensuse_shim:15.8 .

The Dockerfile builds shim and hashes the resulting file. If you want to do it manually:
The shim sources are in usr/src/packages/SOURCES/. Running
docker run --rm -it opensuse_shim:15.8 /bin/sh
sh-4.4# SOURCE_DATE_EPOCH=1617883200 rpmbuild -ba /usr/src/packages/SOURCES/*spec
gives you the build rpm which you can inspect with unrpm, After unpacking you
can get the hashes.

*******************************************************************************
### Which files in this repo are the logs for your build?
This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
*******************************************************************************
build_log.x86_64
build_log.aarch64

These are the build logs from our build system. The pesign hash matches,
the sha256sum is different since it tries to attach a signature, which doesn't
match the current shim anymore. The sha256sum specied in this request is the one
that results when build locally (e.g. in the container image)

*******************************************************************************
### What changes were made in the distor's secure boot chain since your SHIM was last signed?
For example, signing new kernel's variants, UKI, systemd-boot, new certs, new CA, etc..
*******************************************************************************
Last was shim 15.4. We want the new upstream release to fix security issues

*******************************************************************************
### What is the SHA256 hash of your final SHIM binary?
*******************************************************************************
x86_64:
pesign: 211669e51a5e8c2315afe7a978740a972d721116ab81cbe384f993301ecde884 shim-opensuse_x86_64.efi
sha256sum: be35bac95713a29f10c93a3ab22d1b51f4a8dc67667746e30a668bbe741e2f3f  shim-opensuse_x86_64.efi

aarch64:
pesign: 15854cd77be6b61bb6d22b4d448fe9b2d5d06dfa67d8161b6497e10af5b1bfb3 shim-opensuse_aarch64.efi
sha256sum: 3a262eed6a4cc311c1ef05a4216262cc09de052b57bd428d2bdcaa25c07d342a  shim-opensuse_aarch64.efi

*******************************************************************************
### How do you manage and protect the keys used in your SHIM?
*******************************************************************************
The keys are in a custom build HSM that is in a secure environment. In this
secure environment it's locked away and is accessed rarely and then by multiple
people to ensure seperation of duties.

*******************************************************************************
### Do you use EV certificates as embedded certificates in the SHIM?
*******************************************************************************
no

*******************************************************************************
### Do you add a vendor-specific SBAT entry to the SBAT section in each binary that supports SBAT metadata ( GRUB2, fwupd, fwupdate, systemd-boot, systemd-stub, shim + all child shim binaries )?
### Please provide exact SBAT entries for all shim binaries as well as all SBAT binaries that shim will directly boot.
### Where your code is only slightly modified from an upstream vendor's, please also preserve their SBAT entries to simplify revocation.
If you are using a downstream implementation of GRUB2 or systemd-boot (e.g.
from Fedora or Debian), please preserve the SBAT entry from those distributions
and only append your own. More information on how SBAT works can be found
[here](https://github.com/rhboot/shim/blob/main/SBAT.md).
*******************************************************************************
yes

fwupdate:
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
fwupdate,1,Firmware Update Utility,fwupdate,12,https://github.com/rhboot/fwupdate
fwupdate.sle,1,SUSE Linux Enterprise,fwupdate,12,mail:security-team@suse.de

grub2:
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
grub,4,Free Software Foundation,grub,2.12,https://www.gnu.org/software/grub/
grub.opensuse,1,The openSUSE Project,grub2,2.12,mailto:security@suse.de


fwupd:
sbat,1,UEFI shim,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
fwupd,1,Firmware update daemon,fwupd,1.7.3,https://github.com/fwupd/fwupd
fwupd-sle,1,SUSE Linux Enterprise,fwupd,1.7.3,https://build.opensuse.org

systemd-boot:
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
systemd,1,The systemd Developers,systemd,254,https://systemd.io/
systemd.opensuse,1,The openSUSE Project,systemd,254.3-2.1,mailto:security@suse.de

shim:
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
shim,4,UEFI shim,shim,1,https://github.com/rhboot/shim
shim.opensuse,1,The openSUSE project,shim,15.7,mail:security-team@suse.de

*******************************************************************************
### Which modules are built into your signed grub image?
*******************************************************************************
acpi adler32 affs afs afsplitter ahci all_video aout appendedsig
appended_signature_test appleldr archelp asn1 ata at_keyboard backtrace bfs
biosdisk bitmap bitmap_scale blocklist boot_loader_interface boot bsd
bswap_test btrfs bufio cat cbfs cbls cbmemc cbtable cbtime chain
cmdline_cat_test cmdline cmosdump cmostest cmp cmp_test configfile cpio_be cpio
cpuid crc64 cryptodisk crypto crypttab cs5536 ctz_test datehook date datetime
diskfilter disk div div_test dm_nv drivemap echo efiemu efifwsetup efi_gop
efinet efi_uga ehci elf eval exfat exfctest ext2 extcmd f2fs fat file fixvideo
font freedos fshelp functional_test gcry_arcfour gcry_blowfish gcry_camellia
gcry_cast5 gcry_crc gcry_des gcry_dsa gcry_idea gcry_md4 gcry_md5 gcry_rfc2268
gcry_rijndael gcry_rmd160 gcry_rsa gcry_seed gcry_serpent gcry_sha1 gcry_sha256
gcry_sha512 gcry_tiger gcry_twofish gcry_whirlpool gdb geli gettext gfxmenu
gfxterm_background gfxterm_menu gfxterm gmodule gptsync gzio halt hashsum
hdparm hello help hexdump hfs hfspluscomp hfsplus http iorw iso9660 jfs jpeg
json keylayouts keystatus ldm legacycfg legacy_password_test linux16 linuxefi
linux loadbios loadenv loopback lsacpi lsapm lsefimmap lsefi lsefisystab lsmmap
ls lspci lssal lsxen luks2 luks lvm lzopio macbless macho mda_text mdraid09_be
mdraid09 mdraid1x memdisk memrw minicmd minix2_be minix2 minix3_be minix3
minix_be minix mmap morse mpi msdospart mul_test multiboot2 multiboot
nativedisk net newc nilfs2 normal ntfscomp ntfs ntldr odc offsetio ohci
part_acorn part_amiga part_apple part_bsd part_dfly part_dvh part_gpt
part_msdos part_plan part_sun part_sunpc parttool password password_pbkdf2 pata
pbkdf2 pbkdf2_test pcidump pci pgp pkcs1_v15 plan9 play png prep_loadenv
priority_queue probe procfs progress pxechain pxe raid5rec raid6rec random
rdmsr read reboot regexp reiserfs relocator romfs scsi search_fs_file
search_fs_uuid search_label search sendkey serial setjmp setjmp_test setpci sfs
shift_test signature_test sleep sleep_test smbios spkmodem squash4
strtoull_test syslinuxcfg tar terminal terminfo test_asn1 test_blockarg
testload test testspeed tftp tga time tpm2 tpm trig tr truecrypt true udf
ufs1_be ufs1 ufs2 uhci usb_keyboard usb usbms usbserial_common usbserial_ftdi
usbserial_pl2303 usbserial_usbdebug usbtest vbe verifiers vga vga_text
video_bochs video_cirrus video_colors video_fb videoinfo video
videotest_checksum videotest wrmsr xfs xnu xnu_uuid xnu_uuid_test xzio zfscrypt
zfsinfo zfs zstd

*******************************************************************************
### If you are using systemd-boot on arm64 or riscv, is the fix for [unverified Devicetree Blob loading](https://github.com/systemd/systemd/security/advisories/GHSA-6m6p-rjcq-334c) included?
*******************************************************************************
We use systemd 254.9 on Tumbleweed (where he have systemd boot), so we have the fix

*******************************************************************************
### What is the origin and full version number of your bootloader (GRUB or other)?
*******************************************************************************
grub-2.12 from https://www.gnu.org/software/grub/

*******************************************************************************
### If your SHIM launches any other components, please provide further details on what is launched.
*******************************************************************************
fwupd and systemd-boot can be launched

*******************************************************************************
### if your grub2 or systemd-boot launches any other binaries that are not the linux kernel in secureboot mode, please provide further details on what is launched and how it enforces secureboot lockdown.
*******************************************************************************
only the kernel

*******************************************************************************
### How do the launched components prevent execution of unauthenticated code?
*******************************************************************************
n/a

*******************************************************************************
### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB)?
*******************************************************************************
It launches grub, fwupd and systemd-boot

*******************************************************************************
### What kernel are you using? Which patches does it includes to enforce Secure Boot?
*******************************************************************************
openSUSE tumbleweed is a rolling relaese distro. At the moment we use
6.7.6-1 +
# Module signing / secure boot
patches.suse/KEYS-Make-use-of-platform-keyring-for-module-signatu.patch
# Lock down functions for UEFI secure boot
patches.suse/0001-security-lockdown-expose-a-hook-to-lock-the-kernel-down.patch
patches.suse/0002-efi-Add-an-EFI_SECURE_BOOT-flag-to-indicate-secure-boot-mode.patch
patches.suse/0003-efi-Lock-down-the-kernel-if-booted-in-secure-boot-mode.patch
patches.suse/0004-efi-Lock-down-the-kernel-at-the-integrity-level-if-b.patch                                                                      
# Using the hash in MOKx to blacklist kernel module, FATE#316531
patches.suse/0001-MODSIGN-do-not-load-mok-when-secure-boot-disabled.patch
patches.suse/0004-MODSIGN-checking-the-blacklisted-hash-before-loading.patch
# Hibernation Signature Verification FATE#316350
patches.suse/0001-security-create-hidden-area-to-keep-sensitive-data.patch
patches.suse/0002-hibernate-avoid-the-data-in-hidden-area-to-be-snapsh.patch
patches.suse/0005-efi-generate-secret-key-in-EFI-boot-environment.patch
patches.suse/0006-efi-allow-user-to-regenerate-secret-key.patch
patches.suse/0007-PM-hibernate-encrypt-hidden-area.patch
patches.suse/0008-PM-hibernate-Generate-and-verify-signature-for-snaps.patch
patches.suse/0009-PM-hibernate-prevent-EFI-secret-key-to-be-regenerate.patch
patches.suse/0010-PM-hibernate-a-option-to-request-that-snapshot-image.patch
patches.suse/0011-PM-hibernate-require-hibernate-snapshot-image-to-be-.patch

*******************************************************************************
### Add any additional information you think we may need to validate this shim.
*******************************************************************************
There were concerns about our shim-bsc1198101-opensuse-cert-prompt.patch, so we
removed it

As for the fwupd sbat entry: We have the binaries shipped with this entry, so it's
tricky to change now. Unless there's a compelling reason we would like to keep it as
is.
