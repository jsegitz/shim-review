# syntax = docker/dockerfile:1.0-experimental
FROM registry.suse.com/suse/sle15:15.3

ARG ARCHITECTURE
ENV ARCHITECTURE=${ARCHITECTURE}
COPY SUSE_Trust_Root.crt.pem /usr/share/pki/trust/anchors/SUSE_Trust_Root.crt.pem
RUN update-ca-certificates
COPY packages_$ARCHITECTURE /packages
RUN zypper -n in /packages/*.rpm
# get from the build environment /home/abuild
COPY rpmmacros /root/.rpmmacros 
COPY shim /usr/src/packages/SOURCES/
# get the current epoch from the build log
RUN SOURCE_DATE_EPOCH=1625140800 rpmbuild -ba /usr/src/packages/SOURCES/*spec
RUN mkdir /shim
RUN cd /shim/ && unrpm /usr/src/packages/RPMS/$ARCHITECTURE/shim-*.$ARCHITECTURE.rpm
RUN pesign --hash --padding --in=/shim/usr/share/efi/$ARCHITECTURE/shim-sles.efi
RUN sha256sum /shim/usr/share/efi/$ARCHITECTURE/shim-sles.efi
