FROM quay.io/centos/centos:stream9
COPY shim-unsigned-x64-15.8-2.el9.src.rpm /
RUN dnf -y install gcc-11.4.1-2.1.el9 make-4.3-7.el9 elfutils-libelf-devel-0.189-3.el9 binutils-2.35.2-42.el9 binutils-gold-2.35.2-42.el9
RUN dnf -y install pesign-115-6.el9 dos2unix-7.4.2-4.el9 openssl-devel-3.0.7-25.el9 openssl-3.0.7-25.el9
RUN dnf -y install rpm-build git
RUN rpm --define '_topdir /var/tmp/build-shim-unsigned-x64-15.8-2.el9.src.rpm' -ivh /shim-unsigned-x64-15.8-2.el9.src.rpm
RUN sed -i 's/linux32 -B/linux32/g' /var/tmp/build-shim-unsigned-x64-15.8-2.el9.src.rpm/SPECS/shim-unsigned-x64.spec
RUN rpmbuild --define '_topdir /var/tmp/build-shim-unsigned-x64-15.8-2.el9.src.rpm' -ba /var/tmp/build-shim-unsigned-x64-15.8-2.el9.src.rpm/SPECS/shim-unsigned-x64.spec
COPY shimx64.efi /
RUN ls -la /var/tmp/build-shim-unsigned-x64-15.8-2.el9.src.rpm/RPMS/x86_64/
RUN rpm2cpio /var/tmp/build-shim-unsigned-x64-15.8-2.el9.src.rpm/RPMS/x86_64/shim-unsigned-x64-15.8-2.el9.x86_64.rpm | cpio -diu
RUN ls -l /*.efi ./usr/share/shim/15.8-2.el9/*/shim*.efi
RUN sha256sum ./usr/share/shim/15.8-2.el9/x64/shimx64.efi /shimx64.efi 
RUN hexdump -Cv ./usr/share/shim/15.8-2.el9/x64/shimx64.efi > built-x64.hex
RUN hexdump -Cv /shimx64.efi > orig-x64.hex
RUN objdump -h /usr/share/shim/15.8-2.el9/x64/shimx64.efi
RUN diff -u orig-x64.hex built-x64.hex
RUN cmp ./usr/share/shim/15.8-2.el9/x64/shimx64.efi /shimx64.efi
RUN pesign -h -P -i /usr/share/shim/15.8-2.el9/x64/shimx64.efi
RUN pesign -h -P -i /shimx64.efi
RUN sha256sum /usr/share/shim/15.8-2.el9/x64/shimx64.efi /shimx64.efi
