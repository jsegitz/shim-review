Make sure you have provided the following information:

 - [x] link to your code branch cloned from rhboot/shim-review in the form user/repo@tag
   https://github.com/jsegitz/shim-review/tree/SUSE-res8-shim-20200924
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
SLES Expanded Support platform 8, provided within the 
"SUSE Linux Enterprise Server with Expanded Support" program,
https://www.suse.com/products/expandedsupport/

###### What is the origin and full version number of your shim?
The origin is shim-unsigned-x64-15-8.el8 available through https://git.centos.org/rpms/shim-unsigned-x64/tree/c8
which tarball in turn completely matches shim 15 at https://github.com/rhboot/shim/releases/tag/15
with additional patches applied on top.

Full version number of our shim: shim-unsigned-x64-15-8.el8
Source RPM version: shim-unisgned-15-8.el8 (included with the submission)
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
Yes. CVE-2020-15780 associated with this commit has been addressed in Expanded Support platform 8 kernel.

###### if SHIM is loading grub2 bootloader, is CVE CVE-2020-10713 fixed ?
Yes, please see grub2-2.02-87.el8_2.src.rpm inside extra-srpms.tar available at 
https://users.suse.com/~jsegitz/2020.09_epam_shim/res8/extra-srpms.tar

##### Did you change your certificate strategy, so that affected by CVE CVE-2020-10713 grub2 bootloaders can not be verified ?
Yes (rotated signing key, old shims are blacklisted)

###### What is the origin and full version number of your bootloader (GRUB or other)?
GRUB is an equivalent of the one from CentOS 8 git https://git.centos.org/rpms/grub2/tree/c8
Source RPM is included for reference inside extra-srpms.tar: grub2-2.02-87.el8_2.src.rpm
Full version: grub2-2.02-87.el8_2

###### If your SHIM launches any other components, please provide further details on what is launched
N/A. Only grub2 is launched.

###### How do the launched components prevent execution of unauthenticated code?
GRUB and kernel are patched to enforce Secure Boot, identically to RHEL 8 and CentOS 8. Older signature has been blacklisted.

###### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB)?
No

###### What kernel are you using? Which patches does it include to enforce Secure Boot?
kernel-4.18.0-193.19.1.el8_2 is used. This kernel is an equivalent to the one of Red Hat Enterprise
Linux 8 and CentOS 8 and has the same Secure Boot lockdown patches, available through CentOS git:
https://git.centos.org/rpms/kernel/tree/c8

Source RPM is included for reference inside extra-srpms.tar: kernel-4.18.0-193.19.1.el8_2.src.rpm

###### What changes were made since your SHIM was last signed?
Bug and security fixes, including the new signature to address CVE-2020-10713.
Changelog is included within shim-unsigned-x64-15-8.el8.src.rpm (since version 15-1).

###### What is the hash of your final SHIM binary?
shimia32.efi 7971a0c2a42d52d753ef24b7e7d211e77248b6ed4926d933e63c2cb1adcbc523
shimx64.efi  ac31b4abd6d7fbf542480f373f8509c849609bc549e3bcf5401658bffb827b02
