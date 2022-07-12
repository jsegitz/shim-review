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

`https://github.com/jsegitz/shim-review/tree/SUSE-SLES-shim-x86_aarch64-20220712`

-------------------------------------------------------------------------------
### What is the SHA256 hash of your final SHIM binary?
-------------------------------------------------------------------------------
f83baf7da3d799c33806765facd86671ec3426a747f3219d2689958679aa1d32  shim-sles_aarch64.efi
28c14c4e40eb76d226703ac3765dec2226bdbc343d1467893126fc5615a798cb  shim-sles_x86_64.efi
