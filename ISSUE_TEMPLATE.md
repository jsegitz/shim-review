Confirm the following are included in your repo, checking each box:

 - [x] completed README.md file with the necessary information
 - [x] shim.efi to be signed
 - [x] public portion of your certificate(s) embedded in shim (the file passed to VENDOR_CERT_FILE)
 - [x] binaries, for which hashes are added to vendor_db ( if you use vendor_db and have hashes allow-listed )
 - [x] any extra patches to shim via your own git tree or as files
 - [x] any extra patches to grub via your own git tree or as files
 - [x] build logs
 - [x] a Dockerfile to reproduce the build of the provided shim EFI binaries

-------------------------------------------------------------------------------
### What is the link to your tag in a repo cloned from rhboot/shim-review?
-------------------------------------------------------------------------------
`https://github.com/user/shim-review/tree/myorg-shim-arch-YYYYMMDD`

-------------------------------------------------------------------------------
### What is the SHA256 hash of your final SHIM binary?
-------------------------------------------------------------------------------
a871b55a80247a0b4d3c2b7415007a52601fc855a9fdcf5c9d144b523c4571e7  shimia32.efi

1de867350ab176b82bdc7b0f76cd866346056e516ae9c85a4d994919e163e161  shimx64.efi

-------------------------------------------------------------------------------
### What is the link to your previous shim review request (if any, otherwise N/A)?
-------------------------------------------------------------------------------
https://github.com/rhboot/shim-review/issues/114
