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

7bb9d54e966dcd7247e53df55417ec67bb9467aa64a4590facad662b32fac3fe  shimia32.efi

$ sha256sum shimx64.efi

dde161f906dfac80a67af99dd743a39b7646e49ed2474b1459a59bd2b3dcf6c4  shimx64.efi


Output from pesign:

$ pesign --hash --padding --in=shimia32.efi

hash: 2ae62b91c620677ad010416e37959210a3b43f74510250d0af735aa6ea6fef27

$ pesign --hash --padding --in=shimx64.efi

hash: 99fa67d0a6592061deedf1100224679113e30d31609ef91f637e8effe228f867

*******************************************************************************
### What is the link to your previous shim review request (if any, otherwise N/A)?
*******************************************************************************
https://github.com/rhboot/shim-review/issues/281
