Confirm the following are included in your repo, checking each box:

 - [ ] completed README.md file with the necessary information
 - [ ] shim.efi to be signed
 - [ ] public portion of your certificate(s) embedded in shim (the file passed to VENDOR_CERT_FILE)
 - [ ] binaries, for which hashes are added to vendor_db ( if you use vendor_db and have hashes allow-listed )
 - [ ] any extra patches to shim via your own git tree or as files
 - [ ] any extra patches to grub via your own git tree or as files
 - [ ] build logs
 - [ ] a Dockerfile to reproduce the build of the provided shim EFI binaries

*******************************************************************************
### What is the link to your tag in a repo cloned from rhboot/shim-review?
*******************************************************************************
`https://github.com/jsegitz/shim-review/tree/SUSE-openSUSE15.4-shim-15.7-20221201`

*******************************************************************************
### What is the SHA256 hash of your final SHIM binary?
*******************************************************************************
pesign --hash --padding --in=./shim-opensuse_x86_64.efi
hash: be2af39cb08e9372ebc65bf90da9857ee04d14e59c846013a86d3015cfb84206

sha256sum ./shim-opensuse_x86_64.efi
7cf2c59fa006f6dea86206ef5e94f90207dddcb2eb1eed18e7ba8ad17e8d61e8  ./shim-opensuse_x86_64.efi

*******************************************************************************
### What is the link to your previous shim review request (if any, otherwise N/A)?
*******************************************************************************
https://github.com/rhboot/shim-review/issues/283
