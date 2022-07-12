# syntax = docker/dockerfile:1.0-experimental
FROM registry.suse.com/suse/sle15:15.3

ARG ARCHITECTURE
ENV ARCHITECTURE=${ARCHITECTURE}
ADD SUSE_Trust_Root.crt.pem /usr/share/pki/trust/anchors/SUSE_Trust_Root.crt.pem
RUN update-ca-certificates
# get an up to date SCCcredentials files from a VM
ENV ADDITIONAL_MODULES sle-module-desktop-applications,sle-module-development-tools
# RUN --mount=type=secret,id=secret1,dst=SCCcredentials zypper -n in rpm-build build gnu-efi mozilla-nss-tools openssl pesign pesign-obs-integration dos2unix
#RUN --mount=type=secret,id=secret1,dst=SCCcredentials zypper -n in rpm-build build gnu-efi mozilla-nss-tools openssl pesign dos2unix
RUN zypper -n in rpm-build build gnu-efi mozilla-nss-tools openssl pesign dos2unix
# not in the official repos
ADD update-bootloader-rpm-macros-0-1.23.noarch.rpm /
RUN zypper -n in /update-bootloader-rpm-macros-0-1.23.noarch.rpm
ADD pesign-obs-integration-10.1-13.3.1.$ARCHITECTURE.rpm /
RUN zypper -n in /pesign-obs-integration-10.1-13.3.1.$ARCHITECTURE.rpm
# get from the build environment /home/abuild
ADD rpmmacros /root/.rpmmacros 
# remove the repos, they will not work without the secret
RUN zypper lr || true
COPY shim /usr/src/packages/SOURCES/
# get the current epoch from the build log
RUN SOURCE_DATE_EPOCH=1617192000 rpmbuild -ba /usr/src/packages/SOURCES/*spec
RUN mkdir /shim
RUN cd /shim/ && unrpm /usr/src/packages/RPMS/$ARCHITECTURE/shim-*.$ARCHITECTURE.rpm
RUN pesign --hash --padding --in=/shim/usr/share/efi/$ARCHITECTURE/shim-sles.efi
RUN sha256sum /shim/usr/share/efi/$ARCHITECTURE/shim-sles.efi
