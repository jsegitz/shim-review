Confirm the following are included in your repo, checking each box:

 - [ ] completed README.md file with the necessary information
 - [ ] shim.efi to be signed
 - [ ] public portion of your certificate(s) embedded in shim (the file passed to VENDOR_CERT_FILE)
 - [ ] binaries, for which hashes are added to vendor_db ( if you use vendor_db and have hashes allow-listed )
 - [ ] any extra patches to shim via your own git tree or as files
 - [ ] any extra patches to grub via your own git tree or as files
 - [ ] build logs
 - [ ] a Dockerfile to reproduce the build of the provided shim EFI binaries

*******************************************************************************
### What is the link to your tag in a repo cloned from rhboot/shim-review?
*******************************************************************************
`https://github.com/user/shim-review/tree/myorg-shim-arch-YYYYMMDD`

*******************************************************************************
### What is the SHA256 hash of your final SHIM binary?
*******************************************************************************
$ sha256sum shimx64.efi

013d595e73d76dc627f2cebf45206064db4249683361f781ddb7f6bb0d61805f  shimx64.efi

$ pesign --hash --padding --in=shimx64.efi

hash: be992c206387509db24838c7c8af66eae563f3cdaaa088f5da03cf4891f8146f


*******************************************************************************
### What is the link to your previous shim review request (if any, otherwise N/A)?
*******************************************************************************
This is the first request to review shim on SUSE Liberty Linux 9.

*******************************************************************************
### If no security contacts have changed since verification, what is the link to your request, where they've been verified (if any, otherwise N/A)?
*******************************************************************************
I don't think we (Marcus Meissner, Johannes Segitz) have had our contacts verified. But I've submitted multiple
submissions that were accepted with these security contacts. Right answer probably still is
N/A
