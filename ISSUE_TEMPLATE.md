Make sure you have provided the following information:

 - [ ] link to your code branch cloned from rhboot/shim-review in the form user/repo@tag
 - [ ] completed README.md file with the necessary information
 - [ ] shim.efi to be signed
 - [ ] public portion of your certificate embedded in shim (the file passed to VENDOR_CERT_FILE)
 - [ ] any extra patches to shim via your own git tree or as files
 - [ ] any extra patches to grub via your own git tree or as files
 - [ ] build logs


###### What organization or people are asking to have this signed:
SUSE, https://suse.com/

###### What product or service is this for:
SLES Expanded Support platform 7, provided within the 
"SUSE Linux Enterprise Server with Expanded Support" program,
https://www.suse.com/products/expandedsupport/

###### What is the origin and full version number of your shim?
The origin is shim-15-5.el7 available through https://git.centos.org/summary/?r=rpms/shim.git
which tarball in turn completely matches shim 15 at https://github.com/rhboot/shim/releases/tag/15
with additional patches applied on top:

0001-Make-sure-that-MOK-variables-always-get-mirrored.patch
0002-mok-fix-the-mirroring-of-RT-variables.patch
0003-mok-consolidate-mirroring-code-in-a-helper-instead-o.patch
0004-Make-VLogError-behave-as-expected.patch
0005-Once-again-try-even-harder-to-get-binaries-without-t.patch

Full version number of our shim: shim 15
Source RPM version: shim-15-5.el7 (included with the submission)
Tarball sha256sum:
473720200e6dae7cfd3ce7fb27c66367a8d6b08233fe63f01aa1d6b3888deeb6  shim-15.tar.bz2

###### What's the justification that this really does need to be signed for the whole world to be able to boot it:
It is a part of a commercial support offering advertised publicly

###### How do you manage and protect the keys used in your SHIM?
The key is installed in a machine with restricted physical and system access.
Shim binaries do not include private portions of the key.

###### Do you use EV certificates as embedded certificates in the SHIM?
Yes

###### What is the origin and full version number of your bootloader (GRUB or other)?
GRUB is an equivalent of the one from CentOS 7 git https://git.centos.org/summary/?r=rpms/grub2.git
Source RPM is included for reference inside extra-srpms.tar: grub2-2.02-0.80.el7.src.rpm
Full version: grub2-2.02-0.80.el7

###### If your SHIM launches any other components, please provide further details on what is launched
N/A

###### How do the launched components prevent execution of unauthenticated code?
GRUB and kernel are patched to enforce Secure Boot.

  Secure Boot enforcing is identical to available with grub2 within 
  Red Hat Enterprise Linux 7 and CentOS 7, for example:

  https://git.centos.org/summary/?r=rpms/grub2.git
  0093-Don-t-allow-insmod-when-secure-boot-is-enabled.patch
  0220-Add-secureboot-support-on-efi-chainloader.patch
  0221-Make-any-of-the-loaders-that-link-in-efi-mode-honor-.patch
  0225-Rework-even-more-of-efi-chainload-so-non-sb-cases-wo.patch

  Source RPM is included for reference inside extra-srpms.tar: grub2-2.02-0.80.el7.src.rpm

###### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB)?

No

###### What kernel are you using? Which patches does it includes to enforce Secure Boot?

kernel-3.10.0-1062.1.2.el7 is used. This kernel is an equivalent to the one of Red Hat Enterprise
Linux 7 and CentOS 7, available through CentOS git: https://git.centos.org/summary/?r=rpms/kernel.git

Source RPM is included for reference inside extra-srpms.tar: kernel-3.10.0-1062.1.2.el7.src.rpm

Kernel has EFI_SECURE_BOOT_SECURELEVEL kernel config option set disabling loading of untrusted code into kernel mode
and functionality around this option.

###### What changes were made since your SHIM was last signed?

- Fixes to MoK mirroring 
- Get binaries without timestamps in them
- Improve build reproduceability
- Be in line with recent changes in CentOS 7 and RHEL 7

###### What is the hash of your final SHIM binary?

shimia32.efi
sha256sum: e90c36fc0f1f404078c46e057271201aa49f65772bf3ef2a5cde153950aa410e
hash: ccd3706bd3172ab537566f41da9e001c4ca58d29fe014d830f8cf6f1ccbcb31b

shimx64.efi
sha256sum: fb7b3d88e50ab260405b908142d559f7262c8d04883ab758076445a44c9369e0
hash: 5f073ffa199be83529e5edc214f9d5bb4e95525c331daec6892a25bd02ab33cb
