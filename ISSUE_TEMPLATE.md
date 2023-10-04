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
x86_64:
- pesign:
  hash: 3016c9a9dc256cdfa6b46e475303771621fd65bd07e5987b2a5b2b084a34e323
- sha256sum:
  68f89f47ac03a1fb4428692fd95a86d46eaeee087e392725797e64605b804509

aarch64:
- pesign:
  hash: 615aa39cfd278313c8317ae8cadd908aae25ace3edb04d8700639ad7898a952e
- sha256sum:
  d47c2e2c3c28b27bbc9674a13d89818ba7455d127f0267e83cc6b0b5c3831ca2

*******************************************************************************
### What is the link to your previous shim review request (if any, otherwise N/A)?
*******************************************************************************
https://github.com/rhboot/shim-review/issues/283
(and https://github.com/rhboot/shim-review/issues/329, see notes in the README)
