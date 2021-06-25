#
# spec file for package shim
#
# Copyright (c) 2021 SUSE LLC
#
# All modifications and additions to the file contributed by third parties
# remain the property of their copyright owners, unless otherwise agreed
# upon. The license for this file, and modifications and additions to the
# file, is the same license as for the pristine package itself (unless the
# license for the pristine package is not an Open Source License, in which
# case the license is the MIT License). An "Open Source License" is a
# license that conforms to the Open Source Definition (Version 1.9)
# published by the Open Source Initiative.

# Please submit bugfixes or comments via https://bugs.opensuse.org/
#
# needssslcertforbuild


%undefine _debuginfo_subpackages
%undefine _build_create_debug
%ifarch aarch64
%define grubplatform arm64-efi
%else
%define grubplatform %{_target_cpu}-efi
%endif
%if %{defined sle_version} && 0%{?sle_version} <= 150000
%define sysefidir      /usr/lib64/efi
%else
%define sysefibasedir  %{_datadir}/efi
%define sysefidir      %{sysefibasedir}/%{_target_cpu}
%if "%{grubplatform}" == "x86_64-efi" && 0%{?suse_version} < 1600
# provide compatibility sym-link for residual kiwi, etc.
%define shim_lib64_share_compat 1
%endif
%endif

Name:           shim
Version:        15.4
Release:        0
Summary:        UEFI shim loader
License:        BSD-2-Clause
Group:          System/Boot
URL:            https://github.com/rhboot/shim
Source:         %{name}-%{version}.tar.bz2
# run "extract_signature.sh shim.efi" where shim.efi is the binary
# with the signature from the UEFI signing service.
# Note: For signature requesting, check SIGNATURE_UPDATE.txt
Source1:        signature-opensuse.x86_64.asc
Source2:        openSUSE-UEFI-CA-Certificate.crt
Source3:        shim-install
Source4:        SLES-UEFI-CA-Certificate.crt
Source5:        extract_signature.sh
Source6:        attach_signature.sh
Source7:        show_hash.sh
Source8:        show_signatures.sh
Source9:        timestamp.pl
Source10:       strip_signature.sh
Source11:       signature-sles.x86_64.asc
Source12:       signature-opensuse.aarch64.asc
Source13:       signature-sles.aarch64.asc
Source50:       dbx-cert.tar.xz
# vendor-dbx*.bin are generated by generate-vendor-dbx.sh in dbx-cert.tar.xz
Source51:       vendor-dbx.bin
Source52:       vendor-dbx-sles.bin
Source53:       vendor-dbx-opensuse.bin
Source99:       SIGNATURE_UPDATE.txt
# PATCH-FIX-SUSE shim-arch-independent-names.patch glin@suse.com -- Use the Arch-independent names
Patch1:         shim-arch-independent-names.patch
# PATCH-FIX-OPENSUSE shim-change-debug-file-path.patch glin@suse.com -- Change the default debug file path
Patch2:         shim-change-debug-file-path.patch
# PATCH-FIX-SUSE shim-bsc1177315-verify-eku-codesign.patch bsc#1177315 glin@suse.com -- Verify CodeSign in the signer's EKU
Patch3:         shim-bsc1177315-verify-eku-codesign.patch
# PATCH-FIX-UPSTREAM shim-bsc1177789-fix-null-pointer-deref-AuthenticodeVerify.patch bsc#1177789 glin@suse.com -- Fix the NULL pointer dereference in AuthenticodeVerify()
Patch4:         shim-bsc1177789-fix-null-pointer-deref-AuthenticodeVerify.patch
# PATCH-FIX-SUSE remove_build_id.patch -- Remove the build ID to make the binary reproducible when building with AArch64 container
Patch5:         remove_build_id.patch
# PATCH-FIX-UPSTREAM shim-bsc1184454-allocate-mok-config-table-BS.patch bsc#1184454 glin@suse.com -- Allocate MOK config table as BootServicesData to avoid the error message from linux kernel
Patch6:         shim-bsc1184454-allocate-mok-config-table-BS.patch
# PATCH-FIX-UPSTREAM shim-bsc1185441-fix-handling-of-ignore_db-and-user_insecure_mode.patch bsc#1184454 glin@suse.com -- Handle ignore_db and user_insecure_mode correctly
Patch7:         shim-bsc1185441-fix-handling-of-ignore_db-and-user_insecure_mode.patch
# PATCH-FIX-UPSTREAM shim-bsc1185621-relax-max-var-sz-check.patch bsc#1185621 glin@suse.com -- Relax the maximum variable size check for u-boot
Patch8:         shim-bsc1185621-relax-max-var-sz-check.patch
# PATCH-FIX-UPSTREAM shim-bsc1185261-relax-import_mok_state_check.patch bsc#1185261 glin@suse.com -- Relax the check for import_mok_state() when Secure Boot is off
Patch9:         shim-bsc1185261-relax-import_mok_state-check.patch
# PATCH-FIX-UPSTREAM shim-bsc1185232-relax-loadoptions-length-check.patch bsc#1185232 glin@suse.com -- Relax the check for the LoadOptions length
Patch10:        shim-bsc1185232-relax-loadoptions-length-check.patch
# PATCH-FIX-UPSTREAM shim-fix-aa64-relsz.patch glin@suse.com -- Fix the size of rela* sections for AArch64
Patch11:        shim-fix-aa64-relsz.patch
# PATCH-FIX-SUSE shim-disable-export-vendor-dbx.patch bsc#1185261 glin@suse.com -- Disable exporting vendor-dbx to MokListXRT
Patch12:        shim-disable-export-vendor-dbx.patch
# PATCH-FIX-UPSTREAM shim-bsc1187260-fix-efi-1.10-machines.patch bsc#1187260 glin@suse.com -- Don't call QueryVariableInfo() on EFI 1.10 machines
Patch13:        shim-bsc1187260-fix-efi-1.10-machines.patch
# PATCH-FIX-UPSTREAM shim-bsc1185232-fix-config-table-copying.patch bsc#1185232 glin@suse.com -- Avoid buffer overflow when copying the MOK config table
Patch14:        shim-bsc1185232-fix-config-table-copying.patch
BuildRequires:  dos2unix
BuildRequires:  mozilla-nss-tools
BuildRequires:  openssl >= 0.9.8
BuildRequires:  pesign
BuildRequires:  pesign-obs-integration
%if 0%{?suse_version} > 1320
BuildRequires:  update-bootloader-rpm-macros
%endif
%if 0%{?update_bootloader_requires:1}
%update_bootloader_requires
%else
Requires:       perl-Bootloader
%endif
BuildRoot:      %{_tmppath}/%{name}-%{version}-build
# For shim-install script
Requires:       grub2-%{grubplatform}
ExclusiveArch:  x86_64 aarch64

%description
shim is a trivial EFI application that, when run, attempts to open and
execute another application.

%package -n shim-debuginfo
Summary:        UEFI shim loader - debug symbols
Group:          Development/Debug

%description -n shim-debuginfo
The debug symbols of UEFI shim loader

%package -n shim-debugsource
Summary:        UEFI shim loader - debug source
Group:          Development/Debug

%description -n shim-debugsource
The source code of UEFI shim loader


%prep
%setup -q
%patch1 -p1
%patch2 -p1
%patch3 -p1
%patch4 -p1
%patch5 -p1
%patch6 -p1
%patch7 -p1
%patch8 -p1
%patch9 -p1
%patch10 -p1
%patch11 -p1
%patch12 -p1
%patch13 -p1
%patch14 -p1

%build
# generate the vendor SBAT metadata
%if 0%{?is_opensuse} == 1 || 0%{?sle_version} == 0
distro_id="opensuse"
distro_name="The openSUSE project"
%else
distro_id="sle"
distro_name="SUSE Linux Enterprise"
%endif
distro_sbat=1
sbat="shim.${distro_id},${distro_sbat},${distro_name},%{name},%{version},mail:security-team@suse.de"
echo "${sbat}" > data/sbat.vendor.csv

# first, build MokManager and fallback as they don't depend on a
# specific certificate
make RELEASE=0 \
     MMSTEM=MokManager FBSTEM=fallback \
     MokManager.efi.debug fallback.efi.debug \
     MokManager.efi fallback.efi

# now build variants of shim that embed different certificates
default=''
suffixes=(opensuse sles)
# check whether the project cert is a known one. If it is we build
# just one shim that embeds this specific cert. If it's a devel
# project we build all variants to simplify testing.
if test -e %{_sourcedir}/_projectcert.crt ; then
    prjsubject=$(openssl x509 -in %{_sourcedir}/_projectcert.crt -noout -subject_hash)
    prjissuer=$(openssl x509 -in %{_sourcedir}/_projectcert.crt -noout -issuer_hash)
    opensusesubject=$(openssl x509 -in %{SOURCE2} -noout -subject_hash)
    slessubject=$(openssl x509 -in %{SOURCE4} -noout -subject_hash)
    if test "$prjissuer" = "$opensusesubject" ; then
	suffixes=(opensuse)
    elif test "$prjissuer" = "$slessubject" ; then
	suffixes=(sles)
    elif test "$prjsubject" = "$prjissuer" ; then
	suffixes=(devel opensuse sles)
    fi
fi

for suffix in "${suffixes[@]}"; do
    if test "$suffix" = "opensuse"; then
	cert=%{SOURCE2}
	verify='openSUSE Secure Boot CA1'
	vendor_dbx=%{SOURCE53}
%ifarch x86_64
	signature=%{SOURCE1}
%else
	# AArch64 signature
	# Disable AArch64 signature attachment temporarily
	# until we get a real one.
	#signature=%{SOURCE12}
%endif
    elif test "$suffix" = "sles"; then
	cert=%{SOURCE4}
	verify='SUSE Linux Enterprise Secure Boot CA1'
	vendor_dbx=%{SOURCE52}
%ifarch x86_64
	signature=%{SOURCE11}
%else
	# AArch64 signature
	# Disable AArch64 signature attachment temporarily
	# until we get a real one.
	#signature=%{SOURCE13}
%endif
    elif test "$suffix" = "devel"; then
	cert=%{_sourcedir}/_projectcert.crt
	verify=`openssl x509 -in "$cert" -noout -email`
	vendor_dbx=%{SOURCE51}
	signature=''
	test -e "$cert" || continue
    else
	echo "invalid suffix"
	false
    fi

    openssl x509 -in $cert -outform DER -out shim-$suffix.der
    make RELEASE=0 SHIMSTEM=shim \
         VENDOR_CERT_FILE=shim-$suffix.der ENABLE_HTTPBOOT=1 \
         DEFAULT_LOADER="\\\\\\\\grub.efi" \
         VENDOR_DBX_FILE=$vendor_dbx \
         shim.efi.debug shim.efi
    #
    # assert correct certificate embedded
    grep -q "$verify" shim.efi
    # make VENDOR_CERT_FILE=cert.der VENDOR_DBX_FILE=dbx
    chmod 755 %{SOURCE9}
    # alternative: verify signature
    #sbverify --cert MicCorThiParMarRoo_2010-10-05.pem shim-signed.efi
    if test -n "$signature"; then
	head -1 "$signature" > hash1
	cp shim.efi shim.efi.bak
	# pe header contains timestamp and checksum. we need to
	# restore that
	%{SOURCE9} --set-from-file "$signature" shim.efi
	pesign -h -P -i shim.efi > hash2
	cat hash1 hash2
	if ! cmp -s hash1 hash2; then
		echo "ERROR: $suffix binary changed, need to request new signature!"
%if %{defined shim_enforce_ms_signature} && 0%{?shim_enforce_ms_signature} > 0
		false
%endif
		mv shim.efi.bak shim-$suffix.efi
		rm shim.efi
	else
		# attach signature
		pesign -m "$signature" -i shim.efi -o shim-$suffix.efi
		rm -f shim.efi
	fi
    else
        mv shim.efi shim-$suffix.efi
    fi
    mv shim.efi.debug shim-$suffix.debug
    # remove the build cert if exists
    rm -f shim_cert.h shim.cer shim.crt
    # make sure all object files gets rebuilt
    rm -f *.o
done

ln -s shim-${suffixes[0]}.efi shim.efi
mv shim-${suffixes[0]}.debug shim.debug

# Collect the source for debugsource
mkdir ../source
find . \( -name "*.c" -o -name "*.h" \) -type f -exec cp --parents -a {} ../source/ \;
mv ../source .

%install
export BRP_PESIGN_FILES='%{sysefidir}/shim*.efi %{sysefidir}/MokManager.efi %{sysefidir}/fallback.efi'
install -d %{buildroot}/%{sysefidir}
cp -a shim*.efi %{buildroot}/%{sysefidir}
install -m 444 shim-*.der %{buildroot}/%{sysefidir}
install -m 644 MokManager.efi %{buildroot}/%{sysefidir}/MokManager.efi
install -m 644 fallback.efi %{buildroot}/%{sysefidir}/fallback.efi
install -d %{buildroot}/%{_sbindir}
install -m 755 %{SOURCE3} %{buildroot}/%{_sbindir}/
# install SUSE certificate
install -d %{buildroot}/%{_sysconfdir}/uefi/certs/
for file in shim-*.der; do
    fpr=$(openssl x509 -sha1 -fingerprint -inform DER -noout -in $file | cut -c 18- | cut -d ":" -f 1,2,3,4 | sed 's/://g')
    install -m 644 $file %{buildroot}/%{_sysconfdir}/uefi/certs/${fpr}-shim.crt
done
%if %{defined shim_lib64_share_compat}
    [ "%{sysefidir}" != "/usr/lib64/efi" ] || exit 1
    # provide compatibility sym-link for residual "consumers"
    install -d %{buildroot}/usr/lib64/efi
    ln -srf %{buildroot}/%{sysefidir}/*.efi %{buildroot}/usr/lib64/efi/
%endif

# install the debug symbols
install -d %{buildroot}/usr/lib/debug/%{sysefidir}
install -m 644 shim.debug %{buildroot}/usr/lib/debug/%{sysefidir}
install -m 644 MokManager.efi.debug %{buildroot}/usr/lib/debug/%{sysefidir}/MokManager.debug
install -m 644 fallback.efi.debug %{buildroot}/usr/lib/debug/%{sysefidir}/fallback.debug

# install the debug source
install -d %{buildroot}/usr/src/debug/%{name}-%{version}
cp -r source/* %{buildroot}/usr/src/debug/%{name}-%{version}

%clean
%{?buildroot:%__rm -rf "%{buildroot}"}

%post
%if 0%{?update_bootloader_check_type_reinit_post:1}
%update_bootloader_check_type_reinit_post grub2-efi
%else
/sbin/update-bootloader --reinit || true
%endif

%if %{defined update_bootloader_posttrans}
%posttrans
%{?update_bootloader_posttrans}
%endif

%files
%defattr(-,root,root)
%doc COPYRIGHT
%dir %{?sysefibasedir}
%dir %{sysefidir}
%{sysefidir}/shim.efi
%{sysefidir}/shim-*.efi
%{sysefidir}/shim-*.der
%{sysefidir}/MokManager.efi
%{sysefidir}/fallback.efi
%{_sbindir}/shim-install
%dir %{_sysconfdir}/uefi/
%dir %{_sysconfdir}/uefi/certs/
%{_sysconfdir}/uefi/certs/*.crt
%if %{defined shim_lib64_share_compat}
# provide compatibility sym-link for previous kiwi, etc.
%dir /usr/lib64/efi
/usr/lib64/efi/*.efi
%endif

%files -n shim-debuginfo
%defattr(-,root,root,-)
/usr/lib/debug%{sysefidir}/shim.debug
/usr/lib/debug%{sysefidir}/MokManager.debug
/usr/lib/debug%{sysefidir}/fallback.debug

%files -n shim-debugsource
%defattr(-,root,root,-)
%dir /usr/src/debug/%{name}-%{version}
/usr/src/debug/%{name}-%{version}/*

%changelog
