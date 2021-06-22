FROM centos:centos7.9.2009
RUN yum -y install wget git
RUN yum -y update
RUN yum -y install \
    gcc gcc-c++ make elfutils-libelf-devel git \
    openssl openssl-devel pesign dos2unix \
    rpm-build vim-enhanced gnu-efi gnu-efi-devel
COPY shim-15.4-4.el7.src.rpm /
RUN rpm --define '_topdir /var/tmp/build-shim-15.4-4.el7.src.rpm' -ivh shim-15.4-4.el7.src.rpm
RUN sed -i 's/linux32 -B/linux32/g' /var/tmp/build-shim-15.4-4.el7.src.rpm/SPECS/shim.spec
RUN rpmbuild -D 'dist .el7' --define '_topdir /var/tmp/build-shim-15.4-4.el7.src.rpm' -bb /var/tmp/build-shim-15.4-4.el7.src.rpm/SPECS/shim.spec
COPY shimia32.efi /
COPY shimx64.efi /
RUN rpm2cpio /var/tmp/build-shim-15.4-4.el7.src.rpm/RPMS/x86_64/shim-unsigned-ia32-15.4-4.el7.x86_64.rpm  | cpio -diu
RUN rpm2cpio /var/tmp/build-shim-15.4-4.el7.src.rpm/RPMS/x86_64/shim-unsigned-x64-15.4-4.el7.x86_64.rpm | cpio -diu
RUN ls -l /*.efi ./usr/share/shim/*-15.4-4.el7/shim*.efi
RUN sha256sum ./usr/share/shim/x64-15.4-4.el7/shimx64.efi ./usr/share/shim/ia32-15.4-4.el7/shimia32.efi /shimia32.efi /shimx64.efi
RUN hexdump -Cv ./usr/share/shim/x64-15.4-4.el7/shimx64.efi > built-x64.hex
RUN hexdump -Cv ./usr/share/shim/ia32-15.4-4.el7/shimia32.efi > built-ia32.hex
RUN hexdump -Cv /shimia32.efi > orig-ia32.hex
RUN hexdump -Cv /shimx64.efi > orig-x64.hex
RUN objdump -h /usr/share/shim/ia32-15.4-4.el7/shimia32.efi > built-ia32.objdump.txt
RUN objdump -h /usr/share/shim/x64-15.4-4.el7/shimx64.efi > built-x64.objdump.txt
RUN objdump -h /shimia32.efi > orig-ia32.objdump.txt
RUN objdump -h /shimx64.efi > orig-x64.objdump.txt
RUN diff -u orig-ia32.objdump.txt built-ia32.objdump.txt || :
RUN diff -u orig-x64.objdump.txt built-x64.objdump.txt || :
RUN diff -u orig-ia32.hex built-ia32.hex || :
RUN diff -u orig-x64.hex built-x64.hex || :
RUN cmp ./usr/share/shim/x64-15.4-4.el7/shimx64.efi /shimx64.efi
RUN cmp ./usr/share/shim/ia32-15.4-4.el7/shimia32.efi /shimia32.efi
RUN pesign -h -P -i /usr/share/shim/ia32-15.4-4.el7/shimia32.efi
RUN pesign -h -P -i /shimia32.efi
RUN pesign -h -P -i /usr/share/shim/x64-15.4-4.el7/shimx64.efi
RUN pesign -h -P -i /shimx64.efi
RUN sha256sum /usr/share/shim/x64-15.4-4.el7/shimx64.efi /shimx64.efi /usr/share/shim/ia32-15.4-4.el7/shimia32.efi /shimia32.efi
