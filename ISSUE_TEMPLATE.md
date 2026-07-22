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
Output from `sha256sum`:
```
70a2e7068f0a1a5b8e6dc31d365b05b65e86f0dd29d77bcfe0c81e6d43b467c1  shimia32.efi

84ee8b3df6e4a86f498f397088f72e44698fae3a3bc06a9dd9c91180e1bbc116  shimia32.nx.efi

88f49db97279d01968440f09e20d4ae34f4b98058641ae3d3dbd0d837c6c8443  shimx64.efi

5926b0596291e28998742e216925cf062748fd2900167db971d5f6920e265c03  shimx64.nx.efi
```

Output from `pesign --hash --padding --in=...`:
```
380ec0904ff492d438df83b5371c87db3d97581556c516520068818296bb303f shimia32.efi

95211b41d6dacfc3968ca52a4bb8c3a3f35497d138aa41a332f458be589c364e shimia32.nx.efi

5c5cb95d510ec94edbaf1cdaa2b7c115a37e6884b276047f75f26ba952bb9fb8 shimx64.efi

c0251d5d6831ba0880985208e506421df933abe166a0bf7df5169a4995df3423 shimx64.nx.efi
```

*******************************************************************************
### What is the link to your previous shim review request (if any, otherwise N/A)?
*******************************************************************************
https://github.com/rhboot/shim-review/issues/410

*******************************************************************************
### If no security contacts have changed since verification, what is the link to your request, where they've been verified (if any, otherwise N/A)?
*******************************************************************************
https://github.com/rhboot/shim-review/issues/419