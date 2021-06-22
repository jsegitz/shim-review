Make sure you have provided the following information:

 - [x] link to your code branch cloned from rhboot/shim-review in the form user/repo@tag
   https://github.com/jsegitz/shim-review/tree/SUSE-Expanded_Support_platform_7-shim-20210622
 - [x] completed README.md file with the necessary information
 - [x] shim.efi to be signed
 - [x] public portion of your certificate(s) embedded in shim (the file passed to VENDOR_CERT_FILE)
 - [x] binaries, for which hashes are added do vendor_db ( if you use vendor_db and have hashes allow-listed )
 - [x] any extra patches to shim via your own git tree or as files
 - [x] any extra patches to grub via your own git tree or as files
 - [x] build logs
 - [x] a Dockerfile to reproduce the build of the provided shim EFI binaries


###### What organization or people are asking to have this signed:
SUSE, https://suse.com/

###### What product or service is this for:
SLES Expanded Support platform 7, provided within the 
"SUSE Linux Enterprise Server with Expanded Support" program,
https://www.suse.com/products/expandedsupport/

###### Please create your shim binaries starting with the 15.4 shim release tar file:
###### https://github.com/rhboot/shim/releases/download/15.4/shim-15.4.tar.bz2
###### This matches https://github.com/rhboot/shim/releases/tag/15.4 and contains
###### the appropriate gnu-efi source.
###### Please confirm this as the origin your shim.

Shim-15.4 is used, with the following patches on top:

- 0001-Fix-a-broken-file-header-on-ia32.patch: Fix a broken file header on ia32
- Don-t-call-QueryVariableInfo-on-EFI-1.10-machines.patch: Don't call QueryVariableInfo() on EFI 1.10 machines
- MOK-BootServicesData.patch: mok: allocate MOK config table as BootServicesData
- fix-import_one_mok_state.patch: Fix handling of ignore_db and user_insecure_mode
- Post-process-our-PE-to-be-sure.patch: Fix the resulting PE binary to ensure build reproducibility

all are available in shim-15.4-4.el7.src.rpm

###### What's the justification that this really does need to be signed for the whole world to be able to boot it:
SLES ES is a publicly offered product.

###### How do you manage and protect the keys used in your SHIM?
The key is installed in a machine with restricted physical and system access.
Shim binaries do not include private portions of the key.

###### Do you use EV certificates as embedded certificates in the SHIM?
Yes

###### If you use new vendor_db functionality, are any hashes allow-listed, and if yes: for what binaries ?
N/A

###### Is kernel upstream commit 75b0cea7bf307f362057cc778efe89af4c615354 present in your kernel, if you boot chain includes a Linux kernel ?
No, kernel-3.10 does not have this bug

###### if SHIM is loading GRUB2 bootloader, are CVEs CVE-2020-14372,
###### CVE-2020-25632, CVE-2020-25647, CVE-2020-27749, CVE-2020-27779,
###### CVE-2021-20225, CVE-2021-20233, CVE-2020-10713, CVE-2020-14308,
###### CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705,
###### ( July 2020 grub2 CVE list + March 2021 grub2 CVE list )
###### and if you are shipping the shim_lock module CVE-2021-3418
###### fixed ?
Yes

###### "Please specifically confirm that you add a vendor specific SBAT entry for SBAT header in each binary that supports SBAT metadata
###### ( grub2, fwupd, fwupdate, shim + all child shim binaries )" to shim review doc ?
###### Please provide exact SBAT entries for all SBAT binaries you are booting or planning to boot directly through shim

This is the entry that was added for shim:
shim.sles_es,1,SLES Expanded Support platform,shim,15.4-4.el7,security@suse.com

All other components will follow the same convention:
shim.${distro_id},${distro_sbat},${distro_name},%{name},%{version},security@suse.com

##### Were your old SHIM hashes provided to Microsoft ?
Yes

##### Did you change your certificate strategy, so that affected by CVE-2020-14372, CVE-2020-25632, CVE-2020-25647, CVE-2020-27749,
##### CVE-2020-27779, CVE-2021-20225, CVE-2021-20233, CVE-2020-10713,
##### CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705 ( July 2020 grub2 CVE list + March 2021 grub2 CVE list )
##### grub2 bootloaders can not be verified ?
Yes (rotated signing key, old key is revoked via dbx).

##### What exact implementation of Secureboot in grub2 ( if this is your bootloader ) you have ?
##### * Upstream grub2 shim_lock verifier or * Downstream RHEL/Fedora/Debian/Canonical like implementation ?
Downstream RHEL/Fedora/Debian/Canonical like implementation

###### What is the origin and full version number of your bootloader (GRUB or other)?
Upstream grub2-2.02+ patched up to address above mentioned security issues, among others:
grub2-2.02-0.87.el7_9.6.src.rpm 
contained in 
https://users.suse.com/~jsegitz/2021.06_es7_shim/extra-srpms.tar

###### If your SHIM launches any other components, please provide further details on what is launched
It additionally launches fwupdate.

###### If your GRUB2 launches any other binaries that are not Linux kernel in SecureBoot mode,
###### please provide further details on what is launched and how it enforces Secureboot lockdown
N/A

###### If you are re-using a previously used (CA) certificate, you
###### will need to add the hashes of the previous GRUB2 binaries
###### exposed to the CVEs to vendor_dbx in shim in order to prevent
###### GRUB2 from being able to chainload those older GRUB2 binaries. If
###### you are changing to a new (CA) certificate, this does not
###### apply. Please describe your strategy.
Switch to a new key has been made, and old key has been revoked via dbx.

###### How do the launched components prevent execution of unauthenticated code?
GRUB and kernel are patched to enforce Secure Boot.


###### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB)?
No.

###### What kernel are you using? Which patches does it includes to enforce Secure Boot?
kernel-3.10+ with lockdown patches (recently, kernel-3.10.0-1160.31.1.el7)

###### What changes were made since your SHIM was last signed?
Signing key was changed, old key was revoked to ensure no old grub/kernel can be booted.
Shim version updated to upstream 15.4+additional patches.

###### What is the SHA256 hash of your final SHIM binary?
SHA256 checksums:
15ccf32cfe174f216926058a60580760dcf7d6bc8fe2382cec3befc0b8976383  shimia32.efi
4ad3fb5dbd568db0e9eedc34d65d9f8613bf9ffe4e7757d1d818a7c54017f970  shimx64.efi

Hashes:
hash: f767bb761bdec1cb3648b8084666c5a6dec48c93b9e7d51d437ec03f4e9002e5 shimia32.efi
hash: 886fe52af034a9378655c99af2eef4a029f70cad74ce5def1e0c493477a1242c shimx64.efi
