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
`https://github.com/jsegitz/shim-review/tree/SUSE-openSUSE_tumbleweed-shim-15.7-20230403_tag`

*******************************************************************************
### What is the SHA256 hash of your final SHIM binary?
*******************************************************************************
pesign --hash --padding --in=./usr/share/efi/x86_64/shim-opensuse.efi
hash: 793aff84df52f86aceccc1be0111de4976d9e32fc62b20ac2ef6223f3c0516c1

sha256sum ./usr/share/efi/x86_64/shim-opensuse.efi
6af9b677a91b9f7fc4c06c18cc8ffaec91dd9255468d40e68ceb317af06b5d62  ./usr/share/efi/x86_64/shim-opensuse.efi

*******************************************************************************
### What is the link to your previous shim review request (if any, otherwise N/A)?
*******************************************************************************
https://github.com/rhboot/shim-review/issues/283
