FROM registry.opensuse.org/opensuse/leap:15.2

RUN zypper ref 
RUN zypper -n in rpm-build build gnu-efi mozilla-nss-tools openssl pesign pesign-obs-integration dos2unix update-bootloader-rpm-macros
# get from the build environment /home/abuild
COPY rpmmacros /root/.rpmmacros
COPY shim /usr/src/packages/SOURCES/
# get the current epoch from the build log
RUN SOURCE_DATE_EPOCH=1624276800 rpmbuild -ba /usr/src/packages/SOURCES/*spec
RUN mkdir /shim
RUN cd /shim/ && unrpm /usr/src/packages/RPMS/x86_64/shim-*.x86_64.rpm
RUN pesign --hash --padding --in=/shim/usr/share/efi/x86_64/shim-opensuse.efi
RUN sha256sum /shim/usr/share/efi/x86_64/shim-opensuse.efi
