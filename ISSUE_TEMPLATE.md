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
The origin is shim-15-1.el7 available through https://git.centos.org/summary/?r=rpms/shim.git
which tarball in turn completely matches shim 15 at https://github.com/rhboot/shim/releases/tag/15

Full version number of our shim: shim 15
Source RPM version: shim-15-1.el7.1 (included inside build-shim.tar)
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
The origin of GRUB is CentOS 7 git https://git.centos.org/summary/?r=rpms/grub2.git
Source RPM is included for reference inside extra-srpms.tar: grub2-2.02-0.76.el7.src.rpm
Full version: grub2-2.02-0.76.el7

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

  Source RPM is included for reference inside extra-srpms.tar: grub2-2.02-0.76.el7.src.rpm

###### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB)?

No

###### What kernel are you using? Which patches does it includes to enforce Secure Boot?

kernel-3.10.0-957.el7 is used. This kernel is identical to the one of Red Hat Enterprise
Linux 7 and CentOS 7, available through CentOS git: https://git.centos.org/summary/?r=rpms/kernel.git

Source RPM is included for reference inside extra-srpms.tar: kernel-3.10.0-957.el7.src.rpm

Kernel has EFI_SECURE_BOOT_SECURELEVEL kernel config option set disabling loading of untrusted code into kernel mode
and functionality around this option.

###### What changes were made since your SHIM was last signed?

Update to upstream version 15.

###### What is the hash of your final SHIM binary?

shimia32.efi
sha256sum: 881c3d8981ccbe0d1efe3efcd78f842dacd7519923ee60619f20464be4b739f8
hash: c127f0eefc2e451989d88e4d1da8a3b08ca9d5884987a6157e04e9a71c01adfc

shimx64.efi
sha256sum: c167818fd5c06d75766da2a86bf0e5c000c495b981a3a2aaaea375ce56969258
hash: 7f49ccb309323b1c7ab11c93c955b8c744f0a2b75c311f495e18906070500027
