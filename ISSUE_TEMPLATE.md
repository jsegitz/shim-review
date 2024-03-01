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
`https://github.com/jsegitz/shim-review/tree/SUSE-openSUSE_tumbleweed-shim-15.8-20240301`

*******************************************************************************
### What is the SHA256 hash of your final SHIM binary?
*******************************************************************************
x86_64:
pesign: 211669e51a5e8c2315afe7a978740a972d721116ab81cbe384f993301ecde884 shim-opensuse_x86_64.efi
sha256sum: be35bac95713a29f10c93a3ab22d1b51f4a8dc67667746e30a668bbe741e2f3f  shim-opensuse_x86_64.efi

aarch64:
pesign: 15854cd77be6b61bb6d22b4d448fe9b2d5d06dfa67d8161b6497e10af5b1bfb3 shim-opensuse_aarch64.efi
sha256sum: 3a262eed6a4cc311c1ef05a4216262cc09de052b57bd428d2bdcaa25c07d342a  shim-opensuse_aarch64.efi

*******************************************************************************
### What is the link to your previous shim review request (if any, otherwise N/A)?
*******************************************************************************
https://github.com/rhboot/shim-review/issues/333
