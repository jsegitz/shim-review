# syntax = docker/dockerfile:1.0-experimental
#FROM opensuse/leap@sha256:f62e58ff202b95250b8c8f6664d8d4ceebf5d22bbfa244dee7fb129bc667b784
FROM opensuse/leap:15.4

ADD SUSE_Trust_Root.crt.pem /usr/share/pki/trust/anchors/SUSE_Trust_Root.crt.pem
RUN update-ca-certificates
# get an up to date SCCcredentials files from a VM
#ENV ADDITIONAL_MODULES sle-module-desktop-applications,sle-module-development-tools
# RUN --mount=type=secret,id=secret1,dst=SCCcredentials zypper -n in rpm-build build gnu-efi mozilla-nss-tools openssl pesign pesign-obs-integration dos2unix
#RUN --mount=type=secret,id=secret1,dst=SCCcredentials zypper -n in rpm-build build gnu-efi mozilla-nss-tools openssl pesign dos2unix
RUN zypper -n in rpm-build build gnu-efi mozilla-nss-tools openssl pesign pesign-obs-integration dos2unix update-bootloader-rpm-macros
# get from the build environment /home/abuild
ADD rpmmacros /root/.rpmmacros 
# remove the repos, they will not work without the secret
RUN zypper lr || true
COPY shim /usr/src/packages/SOURCES/
# get the current epoch from the build log
RUN SOURCE_DATE_EPOCH=1617192000 rpmbuild -ba /usr/src/packages/SOURCES/*spec
RUN mkdir /shim
RUN cd /shim/ && unrpm $(find /usr/src/packages/RPMS/ -name 'shim-1*.rpm')
RUN pesign --hash --padding --in=$(find /shim -name shim-opensuse.efi -print -quit)
RUN sha256sum $(find /shim -name shim-opensuse.efi -print -quit)
