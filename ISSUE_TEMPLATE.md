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

ac0e46972f3194951ae9a85cb651fa7cffbac9c43915c7cfc726e6530c69c2f3  shimia32.efi

$ sha256sum shimx64.efi

55ff5b62ca47c351ce074289c1518a3a15fe664f7ce75d10db74c70e192f5a80  shimx64.efi


Output from pesign:

$ pesign --hash --padding --in=shimia32.efi

hash: af15f0049cbba5af927c6a9c7d071dab05eab1921d5fc96022f08876c1be534d

$ pesign --hash --padding --in=shimx64.efi

hash: 0e4bdcbb61dc02eeb6cf2eac9bd123d16afd87419851803a8f7ab0cb7a970875

*******************************************************************************
### What is the link to your previous shim review request (if any, otherwise N/A)?
*******************************************************************************
https://github.com/rhboot/shim-review/issues/281
