This repo is for review of requests for signing shim.  To create a request for review:

- clone this repo
- edit the template below
- add the shim.efi to be signed
- add build logs
- add any additional binaries/certificates/hashes that may be needed
- commit all of that
- tag it with a tag of the form "myorg-shim-arch-YYYYMMDD"
- push that to github
- file an issue at https://github.com/rhboot/shim-review/issues with a link to your branch
- approval is ready when you have accepted tag

Note that we really only have experience with using grub2 on Linux, so asking
us to endorse anything else for signing is going to require some convincing on
your part.

Here's the template:

-------------------------------------------------------------------------------
What organization or people are asking to have this signed:
-------------------------------------------------------------------------------
SUSE
https://suse.com/

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
shim-15-8.el7.src.rpm included with this submission

-------------------------------------------------------------------------------
What patches are being applied and why:
-------------------------------------------------------------------------------
- Bugfix patches are being applied on top of original upstream shim code to
address bugs found since previous versions and be in line with recent CentOS 7
and RHEL 7. Patches have been included inside a shim SRPM and have explanations
and/or references to upstream.

0001-Make-some-things-dprint-instead-of-console_print.patch
0002-Makefiles-ensure-m32-gets-propogated-to-our-gcc-para.patch
0003-Let-MokManager-follow-a-MokTimeout-var-for-timeout-l.patch
0004-httpboot-return-EFI_NOT_FOUND-when-it-fails-to-find-.patch
0005-httpboot-print-more-messages-when-it-fails-to-set-IP.patch
0006-httpboot-allow-the-IPv4-gateway-to-be-empty.patch
0007-httpboot-show-the-error-message-for-the-ChildHandle.patch
0008-Fix-typo-in-debug-path-in-shim.h.patch
0009-MokManager-Stop-using-EFI_VARIABLE_APPEND_WRITE.patch
0010-shim-Extend-invalid-reloc-size-warning-message.patch
0011-Add-GRUB-s-PCR-Usage-to-README.tpm.patch
0012-Fix-the-compile-error-of-mkdir-wrong-directory.patch
0013-shim-Properly-generate-absolute-paths-from-relative-.patch
0014-shim-Prevent-shim-to-set-itself-as-a-second-stage-lo.patch
0015-Fix-for-Section-0-has-negative-size-error-when-loadi.patch
0016-Fix-apparent-typo-in-ARM-32-on-64-code.patch
0017-Makefile-do-not-run-git-on-clean-if-there-s-no-.git-.patch
0018-Make.default-use-correct-flags-to-disable-unaligned-.patch
0019-Cryptlib-fix-build-on-32bit-ARM.patch
0020-Make-sure-that-MOK-variables-always-get-mirrored.patch
0021-mok-fix-the-mirroring-of-RT-variables.patch
0022-mok-consolidate-mirroring-code-in-a-helper-instead-o.patch
0023-shim-only-include-shim_cert.h-in-shim.c.patch
0024-mok-also-mirror-the-build-cert-to-MokListRT.patch
0025-mok-minor-cleanups.patch
0026-Remove-call-to-TPM2-get_event_log.patch
0027-Make-EFI-variable-copying-fatal-only-on-secureboot-e.patch
0028-VLogError-Avoid-NULL-pointer-dereferences-in-V-Sprin.patch
0029-Once-again-try-even-harder-to-get-binaries-without-t.patch
0030-shim-Rework-pause-functions-and-add-read_counter.patch
0031-Hook-exit-when-shim_lock-protocol-installed.patch
0032-Work-around-stuff-Waddress-of-packed-member-finds.patch
0033-Fix-a-use-of-strlen-instead-of-Strlen.patch
0034-MokManager-Use-CompareMem-on-MokListNode.Type-instea.patch
0035-OpenSSL-always-provide-OBJ_create-with-name-strings.patch
0036-Use-portable-shebangs-bin-bash-usr-bin-env-bash.patch
0037-tpm-Fix-off-by-one-error-when-calculating-event-size.patch
0038-tpm-Define-EFI_VARIABLE_DATA_TREE-as-packed.patch
0039-MokManager-console-mode-modification-for-hi-dpi-scre.patch
0040-MokManager-avoid-Werror-address-of-packed-member.patch
0041-tpm-Don-t-log-duplicate-identical-events.patch
0042-Slightly-better-debugging-messages.patch
0043-Actually-check-for-errors-from-set_second_stage.patch
0044-translate_slashes-don-t-write-to-string-literals.patch
0045-shim-Update-EFI_LOADED_IMAGE-with-the-second-stage-l.patch
0046-tpm-Include-information-about-PE-COFF-images-in-the-.patch
0047-Fix-the-license-on-our-buildid-extractor.patch
0048-Update-README.tpm.patch
0049-Check-PxeReplyReceived-as-fallback-in-netboot.patch
0050-Remove-a-couple-of-incorrect-license-claims.patch
0051-MokManager-fix-uninitialized-value.patch
0052-Fix-some-volatile-usage-gcc-whines-about.patch
0053-MokManager-fix-a-wrong-allocation-failure-check.patch
0054-simple_file-fix-uninitialized-variable-unchecked-ret.patch
0055-Fix-a-broken-tpm-type.patch
0056-Make-cert.S-not-impossible-to-read.patch
0057-Add-support-for-vendor_db-built-in-shim-authorized-l.patch
0058-Handle-binaries-with-multiple-signatures.patch
0059-Make-openssl-accept-the-right-set-of-KU-EKUs.patch
0060-Improve-debug-output-some.patch
0061-Also-use-a-config-table-to-mirror-mok-variables.patch
0062-Implement-lennysz-s-suggestions-for-MokListRT.patch
0063-hexdump.h-fix-arithmetic-error.patch

-------------------------------------------------------------------------------
If bootloader, shim loading is, grub2: is CVE-2020-10713 fixed ?
-------------------------------------------------------------------------------
Yes. Please see grub2-2.02-0.86.el7_8.src.rpm included in 
https://users.suse.com/~jsegitz/2020.09_epam_shim/res7/extra-srpms.tar

-------------------------------------------------------------------------------
If bootloader, shim loading is, grub2, and previous shims were trusting affected
by CVE-2020-10713 grub2:
* were old shims hashes provided to Microsoft for verification
  and to be added to future DBX update ?
* Does your new chain of trust disallow booting old, affected by CVE-2020-10713,
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
N/A. The kernel of SLES Expanded Support platform 7 as well as RHEL 7 and CentOS 7
is not affected by CVE-2019-20908 and CVE-2020-15780 fixed in these commits
(no affected functionality is present).

-------------------------------------------------------------------------------
If you use vendor_db functionality of providing multiple certificates and/or
hashes please briefly describe your certificate setup. If there are whitelisted hashes
please provide exact binaries for which hashes are created via file sharing service,
available in public with anonymous access for verification
-------------------------------------------------------------------------------
Using SignKey and its CA in db, and previous SignKey in dbx. There are no hash entries both in db and dbx.

-------------------------------------------------------------------------------
What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as close as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
If possible, provide a Dockerfile that rebuilds the shim.
-------------------------------------------------------------------------------

Download 
https://users.suse.com/~jsegitz/2020.09_epam_shim/res7/sles_esp-shim-15-8.el7.tar.gz 
and
https://users.suse.com/~jsegitz/2020.09_epam_shim/res7/extra-srpms.tar

Build instructions:

- Import and run provided OS image using Docker
  docker load -i sles_esp-shim-15-8.el7.tar.gz 
  docker run -it localhost/sles_esp:shim-15-8.el7 /bin/sh

- shim-15-8.el7.src.rpm is already included inside image's root directory for convenience

- Rebuild included SRPM as follows:
  $ rpmbuild --rebuild shim-15-8.el7.src.rpm 2>&1 | tee build1.log

- Resulting RPMs may be found under ~/rpmbuild/RPMS/x86_64/

Versions of build tools:

- gcc-4.8.5-39.el7
- binutils-2.27-43.base.el7_8.1
- make-3.82-24.el7
- gnu-efi-3.0.8-2.el7

-------------------------------------------------------------------------------
Which files in this repo are the logs for your build?   This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
-------------------------------------------------------------------------------
build-shim-unsigned-x86_64.log

-------------------------------------------------------------------------------
Add any additional information you think we may need to validate this shim
-------------------------------------------------------------------------------
Shim binaries to sign are included:
shimx64.efi for x64 systems; shimia32.efi for systems with IA-32 UEFI BIOS

Source RPM of shim: shim-15-8.el7.src.rpm
Source RPMs of glibc, grub2, gnu-efi, kernel, pesign are included into extra-srpms.tar

Public portion of a certificate: sle_secureboot1.x509
