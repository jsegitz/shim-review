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
`https://github.com/jsegitz/shim-review/tree/SUSE-ES-shim-15.7-ia32_x64-20220209`

*******************************************************************************
### What is the SHA256 hash of your final SHIM binary?
*******************************************************************************
Output from sha256sum:

$ sha256sum shimia32.efi

dd4f02dcb37b40a3e5dad9d57a514ecde61fd399fec89af2a609e39947fc91e2  /shimia32.efi

$ sha256sum shimx64.efi

467d9572833d92359b2ce71f3e786af25909ca2647a4676bbaac4290ed7ea76a  /shimx64.efi


Output from pesign:

$ pesign --hash --padding --in=shimia32.efi

hash: e07d9f6f590637d89823d0c11651ac40692cd773896e3b4455818f79e40d4298

$ pesign --hash --padding --in=shimx64.efi

hash: 52f7dfb78b0f09d288e1532937a714618513f8d779d2ecafe82a9e17c2d398b9

*******************************************************************************
### What is the link to your previous shim review request (if any, otherwise N/A)?
*******************************************************************************
https://github.com/rhboot/shim-review/issues/281
