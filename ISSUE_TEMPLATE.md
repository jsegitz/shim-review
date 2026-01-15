Confirm the following are included in your repo, checking each box:

 - [x] completed README.md file with the necessary information
 - [x] shim.efi to be signed
 - [x] public portion of your certificate(s) embedded in shim (the file passed to VENDOR_CERT_FILE)
 - [x] binaries, for which hashes are added to vendor_db ( if you use vendor_db and have hashes allow-listed )
 - [x] any extra patches to shim via your own git tree or as files
 - [x] any extra patches to grub via your own git tree or as files
 - [x] build logs
 - [x] a Dockerfile to reproduce the build of the provided shim EFI binaries

*******************************************************************************
### What is the link to your tag in a repo cloned from rhboot/shim-review?
*******************************************************************************
`https://github.com/user/shim-review/tree/myorg-shim-arch-YYYYMMDD`

*******************************************************************************
### What is the SHA256 hash of your final SHIM binary?
*******************************************************************************
$ sha256sum shimx64.efi

6fddf7c9dc386bbd1205bdc117c2c533d2202789144294a162f80d743750786a  shimx64.efi

$ pesign --hash --padding --in=shimx64.efi

a3bb6026cd9236e2bd5b30577262e6afe230db1e6ea3f3420edc76cdbf18060e shimx64.efi


*******************************************************************************
### What is the link to your previous shim review request (if any, otherwise N/A)?
*******************************************************************************
This is the first submission of shim for SUSE Liberty Linux 10

*******************************************************************************
### If no security contacts have changed since verification, what is the link to your request, where they've been verified (if any, otherwise N/A)?
*******************************************************************************
https://github.com/rhboot/shim-review/issues/419
