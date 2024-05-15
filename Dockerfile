FROM quay.io/centos/centos:stream8
COPY shim-unsigned-x64-15.8-2.el8.src.rpm /
RUN dnf -y install gcc-8.5.0-20.el8 binutils-2.30-123.el8 make-4.2.1-11.el8 elfutils-libelf-devel-0.189-3.el8
RUN dnf -y install openssl-1.1.1k-12.el8 openssl-devel-1.1.1k-12.el8 pesign-0.112-26.el8 dos2unix-7.4.0-3.el8
RUN dnf -y install rpm-build git
RUN rpm --define '_topdir /var/tmp/build-shim-unsigned-x64-15.8-2.el8.src.rpm' -ivh /shim-unsigned-x64-15.8-2.el8.src.rpm
RUN sed -i 's/linux32 -B/linux32/g' /var/tmp/build-shim-unsigned-x64-15.8-2.el8.src.rpm/SPECS/shim-unsigned-x64.spec
RUN rpmbuild --define '_topdir /var/tmp/build-shim-unsigned-x64-15.8-2.el8.src.rpm' -ba /var/tmp/build-shim-unsigned-x64-15.8-2.el8.src.rpm/SPECS/shim-unsigned-x64.spec
COPY shimia32.efi /
COPY shimx64.efi /
RUN ls -la /var/tmp/build-shim-unsigned-x64-15.8-2.el8.src.rpm/RPMS/x86_64/
RUN rpm2cpio /var/tmp/build-shim-unsigned-x64-15.8-2.el8.src.rpm/RPMS/x86_64/shim-unsigned-ia32-15.8-2.el8.x86_64.rpm  | cpio -diu
RUN rpm2cpio /var/tmp/build-shim-unsigned-x64-15.8-2.el8.src.rpm/RPMS/x86_64/shim-unsigned-x64-15.8-2.el8.x86_64.rpm | cpio -diu
RUN ls -l /*.efi ./usr/share/shim/15.8-2.el8/*/shim*.efi
RUN sha256sum ./usr/share/shim/15.8-2.el8/x64/shimx64.efi ./usr/share/shim/15.8-2.el8/ia32/shimia32.efi /shimia32.efi /shimx64.efi
RUN hexdump -Cv ./usr/share/shim/15.8-2.el8/x64/shimx64.efi > built-x64.hex
RUN hexdump -Cv ./usr/share/shim/15.8-2.el8/ia32/shimia32.efi > built-ia32.hex
RUN hexdump -Cv /shimia32.efi > orig-ia32.hex
RUN hexdump -Cv /shimx64.efi > orig-x64.hex
RUN objdump -h /usr/share/shim/15.8-2.el8/x64/shimx64.efi
RUN objdump -h /usr/share/shim/15.8-2.el8/ia32/shimia32.efi
RUN diff -u orig-ia32.hex built-ia32.hex
RUN diff -u orig-x64.hex built-x64.hex
RUN cmp ./usr/share/shim/15.8-2.el8/x64/shimx64.efi /shimx64.efi
RUN cmp ./usr/share/shim/15.8-2.el8/ia32/shimia32.efi /shimia32.efi
RUN pesign -h -P -i /usr/share/shim/15.8-2.el8/ia32/shimia32.efi
RUN pesign -h -P -i /shimia32.efi
RUN pesign -h -P -i /usr/share/shim/15.8-2.el8/x64/shimx64.efi
RUN pesign -h -P -i /shimx64.efi
RUN sha256sum /usr/share/shim/15.8-2.el8/x64/shimx64.efi /shimx64.efi /usr/share/shim/15.8-2.el8/ia32/shimia32.efi /shimia32.efi
