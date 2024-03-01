# syntax = docker/dockerfile:1.0-experimental
#FROM opensuse/leap@sha256:f62e58ff202b95250b8c8f6664d8d4ceebf5d22bbfa244dee7fb129bc667b784
FROM opensuse/leap:15.5

ADD SUSE_Trust_Root.crt.pem /usr/share/pki/trust/anchors/SUSE_Trust_Root.crt.pem
RUN update-ca-certificates
RUN --mount=type=secret,id=secret1,dst=SCCcredentials zypper -n in rpm-build build gnu-efi mozilla-nss-tools openssl pesign pesign-obs-integration dos2unix efitools
ADD rpmmacros /root/.rpmmacros 
ADD update-bootloader-rpm-macros-0-1.23.noarch.rpm /
RUN zypper -n in /update-bootloader-rpm-macros-0-1.23.noarch.rpm
COPY shim /usr/src/packages/SOURCES/
# get the current epoch from the build log
RUN SOURCE_DATE_EPOCH=1617192000 rpmbuild -ba /usr/src/packages/SOURCES/*spec
RUN mkdir /shim
RUN cd /shim/ && unrpm $(find /usr/src/packages/RPMS/ -name 'shim-1*.rpm')
RUN pesign --hash --padding --in=$(find /shim -name shim-opensuse.efi -print -quit)
RUN sha256sum $(find /shim -name shim-opensuse.efi -print -quit)
