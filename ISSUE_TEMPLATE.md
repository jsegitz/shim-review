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
`https://github.com/jsegitz/shim-review/tree/SUSE-openSUSE_tumbleweed-shim-15.7-20230508`

*******************************************************************************
### What is the SHA256 hash of your final SHIM binary?
*******************************************************************************
pesign --hash --padding --in=/shim/usr/share/efi/x86_64/shim-opensuse.efi
hash: cfd34a1af181d397f308991b89e09de894487f565fa22efe2dc538cee439ee25

sha256sum /shim/usr/share/efi/x86_64/shim-opensuse.efi
189e8154c8d0122bb19cfeb341ea1ddf449a904ece0064a3f396e43bb7cd05a3

*******************************************************************************
### What is the link to your previous shim review request (if any, otherwise N/A)?
*******************************************************************************
https://github.com/rhboot/shim-review/issues/283
(and https://github.com/rhboot/shim-review/issues/329, see notes in the README)
