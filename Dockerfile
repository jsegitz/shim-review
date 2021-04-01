FROM registry.opensuse.org/opensuse/leap:15.2

#RUN zypper ar --repo https://download.suse.de/ibs/home:/gary_lin:/shim-sbat/SLE_15_SP3/home:gary_lin:shim-sbat.repo 
RUN zypper ref 
RUN zypper -n in rpm-build build gnu-efi mozilla-nss-tools openssl pesign pesign-obs-integration dos2unix update-bootloader-rpm-macros
# get from the build environment /home/abuild
ADD rpmmacros /root/.rpmmacros
ADD shim /usr/src/packages/SOURCES/
# get the current epoch from the build log
RUN SOURCE_DATE_EPOCH=1617192000 rpmbuild -ba /usr/src/packages/SOURCES/*spec
RUN mkdir /shim
RUN cd /shim/ && unrpm /usr/src/packages/RPMS/x86_64/shim-*.x86_64.rpm
RUN pesign --hash --padding --in=/shim/usr/share/efi/x86_64/shim-opensuse.efi
RUN sha256sum /shim/usr/share/efi/x86_64/shim-opensuse.efi
