Make sure you have provided the following information:

 - [x] link to your code branch cloned from rhboot/shim-review in the form user/repo@tag
   jsegitz/shim-review/tree/SUSE-SLES15-SP1-x64-20190123
 - [x] completed README.md file with the necessary information
 - [x] shim.efi to be signed
 - [x] public portion of your certificate embedded in shim (the file passed to VENDOR_CERT_FILE)
 - [x] any extra patches to shim via your own git tree or as files
 - [x] any extra patches to grub via your own git tree or as files
 - [x] build logs


###### What organization or people are asking to have this signed:
SUSE, https://suse.com/

###### What product or service is this for:
SUSE Linux Enterprice Server 15 SP1

###### What is the origin and full version number of your shim?
It is shim-15, up to https://github.com/rhboot/shim/commit/b3e4d1f7555aabbf5d54de5ea7cd7e839e7bd83d

###### What's the justification that this really does need to be signed for the whole world to be able to boot it:
Major linux distribution

###### How do you manage and protect the keys used in your SHIM?
The key is installed in a machine with restricted physical and system access.
Shim binaries do not include private portions of the key.

###### Do you use EV certificates as embedded certificates in the SHIM?
Yes

###### What is the origin and full version number of your bootloader (GRUB or other)?
- grub-2.02-21.1 with:
  * grub2-secureboot-chainloader.patch: Add secureboot support on efi chainloader. Expand the chainloader to be able to verify the image by means of shim lock protocol.
  * grub2-secureboot-no-insmod-on-sb.patch: Don't allow insmod when secure boot is enabled.

###### If your SHIM launches any other components, please provide further details on what is launched
N/A

###### How do the launched components prevent execution of unauthenticated code?
GRUB and kernel are patched to enforce Secure Boot.

###### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB)?

No

###### What kernel are you using? Which patches does it includes to enforce Secure Boot?

kernel-4.12.14-29.1 is used with CONFIG_EFI_SECURE_BOOT_LOCK_DOWN=y

###### What changes were made since your SHIM was last signed?

Update to upstream version 15.

###### What is the hash of your final SHIM binary?

shim-sles.efi
sha256sum: f3727c065c11fcff293eb8ea3004b3d5becc5ed499ff9b6c13da64db4ee53d4a  
