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
`https://github.com/jsegitz/shim-review/tree/SUSE-liberty-15.8-20240415`

*******************************************************************************
### What is the SHA256 hash of your final SHIM binary?
*******************************************************************************
Output from sha256sum:

$ sha256sum shimia32.efi

7b94d13b6d9a45e040f6b47cdf9774e8633010d60f7e5a1e962a458740dcfb58  shimia32.efi

$ sha256sum shimx64.efi

8375d94dfd60ca75be6490740d48bd3fd1688650d15bc5da2e9a44e808496c9a  shimx64.efi

Output from pesign:

$ pesign --hash --padding --in=shimia32.efi

hash: b7a6529881db7ecd80634b4fa3cf0bfe6b7c66b779b8ea26b6ec7e3ff08dbab8

$ pesign --hash --padding --in=shimx64.efi

hash: bcc42e50c81159a7d6e278ebbff1f5168c07f37579d2d33ad65bc247c1f431d1

*******************************************************************************
### What is the link to your previous shim review request (if any, otherwise N/A)?
*******************************************************************************
https://github.com/rhboot/shim-review/issues/114

*******************************************************************************
### If no security contacts have changed since verification, what is the link to your request, where they've been verified (if any, otherwise N/A)?
*******************************************************************************

I don't think we (Marcus Meissner, Johannes Segitz) have had our contacts verified. But I've submitted multiple
submissions that were accepted with these security contacts. Right answer probably still is
N/A
