# syntax = docker/dockerfile:1.0-experimental
FROM registry.suse.com/suse/sle15:15.3

ADD SUSE_Trust_Root.crt.pem /usr/share/pki/trust/anchors/SUSE_Trust_Root.crt.pem
RUN update-ca-certificates
# get an up to date SCCcredentials files from a VM
ENV ADDITIONAL_MODULES sle-module-desktop-applications,sle-module-development-tools
RUN --mount=type=secret,id=secret1,dst=/etc/zypp/credentials.d/SCCcredentials zypper -n in rpm-build build gnu-efi mozilla-nss-tools openssl pesign pesign-obs-integration dos2unix
# RUN zypper --gpg-auto-import-keys ref -s
# RUN zypper -n in rpm-build build gnu-efi mozilla-nss-tools openssl pesign pesign-obs-integration dos2unix
# not in the official repos
ADD update-bootloader-rpm-macros-0-1.23.noarch.rpm /
RUN zypper -n in /update-bootloader-rpm-macros-0-1.23.noarch.rpm
# get from the build environment /home/abuild
ADD .rpmmacros /root
# remove the repos, they will not work without the secret
RUN zypper lr || true
ADD shim /usr/src/packages/SOURCES/
# get the current epoch from the build log
RUN SOURCE_DATE_EPOCH=1617192000 rpmbuild -ba /usr/src/packages/SOURCES/*spec
RUN mkdir /shim
RUN cd /shim/ && unrpm /usr/src/packages/RPMS/x86_64/shim-*.x86_64.rpm
RUN pesign --hash --padding --in=/shim/usr/share/efi/x86_64/shim-sles.efi
RUN sha256sum /shim/usr/share/efi/x86_64/shim-sles.efi

# for debugging
# ADD .gdbinit-gef.py /root/.gdbinit-gef.py
# ADD .gdbinit /root/.gdbinit
# run zypper -n in less vim gdb
# run zypper -n --plus-content debug install rpm-build-debuginfo-4.14.1-29.6.x86_64 libacl1-debuginfo-2.2.52-4.3.1.x86_64 libattr1-debuginfo-2.4.47-2.19.x86_64 libbz2-1-debuginfo-1.0.6-5.9.1.x86_64 libcap2-debuginfo-2.25-2.41.x86_64 libdw1-debuginfo-0.168-4.5.3.x86_64 libelf1-debuginfo-0.168-4.5.3.x86_64 libgcrypt20-debuginfo-1.8.2-8.36.1.x86_64 libgpg-error0-debuginfo-1.29-1.8.x86_64 liblua5_3-5-debuginfo-5.3.4-3.3.2.x86_64 liblzma5-debuginfo-5.2.3-4.3.1.x86_64 libmagic1-debuginfo-5.32-7.11.2.x86_64 libpopt0-debuginfo-1.16-3.22.x86_64 libzstd1-debuginfo-1.4.4-1.3.1.x86_64 
