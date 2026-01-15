
FROM quay.io/centos/centos:stream10
COPY shim-unsigned-x64-16.1-1.el10.src.rpm /
RUN dnf -y install gcc-14.3.1-2.1.el10.x86_64 make-4.4.1-9.el10.x86_64 elfutils-libelf-devel-0.193-1.el10.x86_64 binutils-2.41-58.el10.x86_64 binutils-gold-2.41-58.el10.x86_64
RUN dnf -y install pesign dos2unix openssl openssl-devel
RUN dnf -y install rpm-build git
RUN rpm --define '_topdir /var/tmp/build-shim-unsigned-x64-16.1-1.el10.src.rpm' -ivh /shim-unsigned-x64-16.1-1.el10.src.rpm
RUN sed -i 's/linux32 -B/linux32/g' /var/tmp/build-shim-unsigned-x64-16.1-1.el10.src.rpm/SPECS/shim-unsigned-x64.spec
RUN rpmbuild --define '_topdir /var/tmp/build-shim-unsigned-x64-16.1-1.el10.src.rpm' -ba /var/tmp/build-shim-unsigned-x64-16.1-1.el10.src.rpm/SPECS/shim-unsigned-x64.spec
COPY shimx64.efi /
RUN ls -la /var/tmp/build-shim-unsigned-x64-16.1-1.el10.src.rpm/RPMS/x86_64/
RUN rpm2cpio /var/tmp/build-shim-unsigned-x64-16.1-1.el10.src.rpm/RPMS/x86_64/shim-unsigned-x64-16.1-1.el10.x86_64.rpm | cpio -diu
RUN ls -l /*.efi ./usr/share/shim/16.1-1.el10/*/shim*.efi
RUN sha256sum ./usr/share/shim/16.1-1.el10/x64/shimx64.efi /shimx64.efi 
RUN hexdump -Cv ./usr/share/shim/16.1-1.el10/x64/shimx64.efi > built-x64.hex
RUN hexdump -Cv /shimx64.efi > orig-x64.hex
RUN objdump -h /usr/share/shim/16.1-1.el10/x64/shimx64.efi
RUN diff -u orig-x64.hex built-x64.hex
RUN cmp ./usr/share/shim/16.1-1.el10/x64/shimx64.efi /shimx64.efi
RUN pesign -h -P -i /usr/share/shim/16.1-1.el10/x64/shimx64.efi
RUN pesign -h -P -i /shimx64.efi
RUN sha256sum /usr/share/shim/16.1-1.el10/x64/shimx64.efi /shimx64.efi



