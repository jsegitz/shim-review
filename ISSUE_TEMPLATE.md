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
`https://github.com/jsegitz/shim-review/tree/SUSE-SLES-shim-x86_aarch64-20240229`

*******************************************************************************
### What is the SHA256 hash of your final SHIM binary?
*******************************************************************************
x86_64:
pesign: f327bfe0e31193974df9fa68b621a2c87d154ef2986059ce16fc6d0bd7537a96 shim-sles.efi
sha256sum: bf24a19e3bd5ca535b0815be9e49b36b835a9f36310ed5b3e5f87959a52b87e2  shim-sles.efi

aarch64:
pesign: 8bfe4fc6a7506d82a4efdd39ecac04ef0ab6f65d9ac3514d803462a7b4ae7fcf shim-sles.efi
sha256sum: 5f3c747130027da84c47256a6d089b6cb1c923a3517d31c8703e360c9f2832c6  shim-sles.efi

*******************************************************************************
### What is the link to your previous shim review request (if any, otherwise N/A)?
*******************************************************************************
https://github.com/rhboot/shim-review/issues/301
