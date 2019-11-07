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
SLES Expanded Support platform 8, provided within the 
"SUSE Linux Enterprise Server with Expanded Support" program,
https://www.suse.com/products/expandedsupport/

###### What is the origin and full version number of your shim?
The origin is shim-unsigned-x64-15-2.el8 available through https://git.centos.org/rpms/shim-unsigned-x64/tree/c8

Full version number of our shim: 15-2.el8
Source RPM version: shim-unsigned-x64-15-2.el8 (included with the submission)
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
The origin of GRUB is CentOS git: https://git.centos.org/rpms/grub2/tree/c8
Source RPM is included for reference inside extra-srpms.tar: grub2-2.02-66.el8.src.rpm
Full version: grub2-2.02-66.el8

###### If your SHIM launches any other components, please provide further details on what is launched
N/A

###### How do the launched components prevent execution of unauthenticated code?
GRUB and kernel are patched to enforce Secure Boot.

  Secure Boot enforcing is identical to available with grub2 within 
  Red Hat Enterprise Linux 8 and (upcoming) CentOS 8, for example:

  https://git.centos.org/rpms/grub2/tree/c8
  0004-Add-secureboot-support-on-efi-chainloader.patch
  0005-Make-any-of-the-loaders-that-link-in-efi-mode-honor-.patch

  Source RPM is included for reference inside extra-srpms.tar: grub2-2.02-66.el8.src.rpm
  https://users.suse.com/~jsegitz/2019.11_sles_es_8_shim_files/extra-srpms.tar

###### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB)?

No

###### What kernel are you using? Which patches does it include to enforce Secure Boot?

kernel-4.18.0-80.el8 with lockdown patches identical to the one of Red Hat Enterprise
Linux 8 and (upcoming) CentOS 8, available through CentOS git: https://git.centos.org/rpms/kernel/tree/c8

Source RPM is included for reference inside extra-srpms.tar: kernel-4.18.0-80.el8.src.rpm.
https://users.suse.com/~jsegitz/2019.11_sles_es_8_shim_files/extra-srpms.tar

###### What changes were made since your SHIM was last signed?

This is the initial submission for SLES Expanded Support platform 8.
On top of shim-15, bug fixes have been applied:

- Added 0005-MokListRT-Fatal.patch to avoid crashing legacy uefi/non SB machines (from CentOS, 1 patch)
- Fix MoK mirroring issue which breaks kdump without intervention (from shim-16, 4 patches)

###### What is the hash of your final SHIM binary?

shimia32.efi 
hash: b01e4a766aab3be21fb0ad2bfd5b96f98031c66820adaee6a0f3b164b8e081bd
sha256sum: 195041f62e012e62f662b1f77b46e3872d42f659d7b060cf51270d63e078d9c1

shimx64.efi 
hash: d66630ec3724ff50d535c468d6dd176a0b307bcc9da85e51f81580894e0c0048
sha256sum: 1877b7ec331978a0a79e350f6011fe2f4eb7cc3097642cc3ab9a0db3f6a6c2b8

