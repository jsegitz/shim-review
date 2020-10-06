Make sure you have provided the following information:

 - [x] link to your code branch cloned from rhboot/shim-review in the form user/repo@tag
       https://github.com/jsegitz/shim-review/tree/SUSE-res7-shim-20201006
 - [x] completed README.md file with the necessary information
 - [x] shim.efi to be signed
 - [x] public portion of your certificate(s) embedded in shim (the file passed to VENDOR_CERT_FILE)
 - [x] binaries, for which hashes are added do vendor_db ( if you use vendor_db and have hashes whitelisted )
 - [x] any extra patches to shim via your own git tree or as files
 - [x] any extra patches to grub via your own git tree or as files
 - [x] build logs


###### What organization or people are asking to have this signed:
SUSE
https://suse.com/

###### What product or service is this for:
SLES Expanded Support platform 7, provided within the 
"SUSE Linux Enterprise Server with Expanded Support" program,
https://www.suse.com/products/expandedsupport/

###### What is the origin and full version number of your shim?
The origin is shim-15-9.el7 available through https://git.centos.org/rpms/shim/tree/c7
which tarball in turn completely matches shim 15 at https://github.com/rhboot/shim/releases/tag/15
with additional patches applied on top.

Full version number of our shim: shim-15-9.el7
Source RPM version: shim-15-9.el7 (included with the submission)
Tarball sha256sum:
473720200e6dae7cfd3ce7fb27c66367a8d6b08233fe63f01aa1d6b3888deeb6  shim-15.tar.bz2

###### What's the justification that this really does need to be signed for the whole world to be able to boot it:
It is a part of a commercial support offering advertised publicly

###### How do you manage and protect the keys used in your SHIM?
The key is installed in a machine with restricted physical and system access.
Shim binaries do not include private portions of the key.

###### Do you use EV certificates as embedded certificates in the SHIM?
Yes

###### If you use new vendor_db functionality, are any hashes whitelisted, and if yes: for what binaries ?
Using SignKey and its CA in db, and previous SignKey in dbx. There are no hash entries both in db and dbx.

###### Is kernel upstream commit 75b0cea7bf307f362057cc778efe89af4c615354 present in your kernel, if you boot chain includes a linux kernel ?
N/A. This is a legacy 3.10 kernel built from the most recent sources available in both RHEL 7 and CentOS 7;
it is not affected by CVE-2020-15780 (affected functionality is not present).

###### if SHIM is loading grub2 bootloader, is CVE CVE-2020-10713 fixed ?
Yes

##### Did you change your certificate strategy, so that affected by CVE CVE-2020-10713 grub2 bootloaders can not be verified ?
Yes (rotated signing key, old shims are blacklisted)

###### What is the origin and full version number of your bootloader (GRUB or other)?
GRUB is an equivalent of the one from CentOS 7 git https://git.centos.org/rpms/grub2/tree/c7
Source RPM is included for reference inside extra-srpms.tar: grub2-2.02-0.86.el7_8.src.rpm
Full version: grub2-2.02-0.86.el7_8

###### If your SHIM launches any other components, please provide further details on what is launched
grub2 and fwupdate can be launched

###### How do the launched components prevent execution of unauthenticated code?
GRUB and kernel are patched to enforce Secure Boot. Older signature has been blacklisted.

###### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB)?
No

###### What kernel are you using? Which patches does it include to enforce Secure Boot?
kernel-3.10.0-1127.19.1.el7 is used. This kernel is an equivalent to the one of Red Hat Enterprise
Linux 7 and CentOS 7, available through CentOS git: https://git.centos.org/rpms/kernel/tree/c7

Source RPM is included for reference inside extra-srpms.tar: kernel-3.10.0-1127.19.1.el7.src.rpm

Kernel has EFI_SECURE_BOOT_SECURELEVEL kernel config option set disabling loading of untrusted code into kernel mode
and functionality around this option.

###### What changes were made since your SHIM was last signed?
Bug and security fixes, including the new signature to address CVE-2020-10713.
Changelog is included within shim-15-9.el7.src.rpm (since version 15-1).

###### What is the hash of your final SHIM binary?
shimia32.efi 303cb38738ad4a3116cc314cb2cf82f125d6ad34f863962c555f635e60b96a7c  
shimx64.efi  7cb6e51ea2dcd0a03e037a9034a4aa8a4fdb8dfacdb5f7a4ca3f2fcf322774fe  
