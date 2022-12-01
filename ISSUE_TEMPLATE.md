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
`https://github.com/user/shim-review/tree/myorg-shim-arch-YYYYMMDD` FIXME

*******************************************************************************
### What is the SHA256 hash of your final SHIM binary?
*******************************************************************************
x86_64:
$ pesign --hash --padding --in=shim-sles_x86_64.efi
hash: 2b0d7d00e2d5ef27605375da81690afaab91d19ea4cc129ced8dfb34d9c5c2d3

$ sha256sum shim-sles_x86_64.efi
bb405777bde97cfed333939cd6409c7b1cf72e5e07ae72226fa5214e95c9e113  shim-sles_x86_64.efi

aarch64:
$ pesign --hash --padding --in=shim-sles_aarch64.efi
hash: 04478d49dfa6c5f8442ec919568e1eda59de99cc1b5192f18028084409bbebe5

$ sha256sum shim-sles_aarch64.efi
d16ed6993b51ba96a4664e1648d7b244d0dd7c1c1e1eb9d5404b2973c0b2c4fc  shim-sles_aarch64.efi

*******************************************************************************
### What is the link to your previous shim review request (if any, otherwise N/A)?
*******************************************************************************
https://github.com/rhboot/shim-review/issues/263
