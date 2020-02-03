Name:           noice
Version:        bfe589a
Release:        1%{?dist}
Summary:        A small curses-based file browser

License:        BSD
URL:            http://git.2f30.org/noice/
Source0:        noiceconf.h
Source1:        nopenconf.h
Source2:        select.sh
Source3:        list.sh
Source4:        move.sh
Source5:        copy.sh

BuildRequires:  git make gcc ncurses-devel
Requires:       bash ncurses


%description
Noice is a small curses-based file browser. It was first developed to be used
with a TV remote control for a media center solution.


%prep
pushd %{_sourcedir}
git clone git://git.2f30.org/noice
cd noice
git checkout %{version}
popd
rm -rf noice
mv %{_sourcedir}/noice .
%setup -T -D -n noice
cp %{SOURCE0} %{SOURCE1} .


%build
make %{?_smp_mflags} CFLAGS=-g


%install
make PREFIX=%{_prefix} MANPREFIX=%{_mandir} DESTDIR=%{buildroot} install
install -m 0755 -D %{SOURCE2} %{buildroot}/%{_libdir}/%{name}/select.sh
install -m 0755 -D %{SOURCE3} %{buildroot}/%{_libdir}/%{name}/list.sh
install -m 0755 -D %{SOURCE4} %{buildroot}/%{_libdir}/%{name}/move.sh
install -m 0755 -D %{SOURCE5} %{buildroot}/%{_libdir}/%{name}/copy.sh
install -m 0644 -D README  %{buildroot}/usr/share/doc/%{name}/README
install -m 0644 -D LICENSE %{buildroot}/usr/share/licenses/%{name}/LICENSE


%files
%{_bindir}/noice
%{_bindir}/nopen
%{_libdir}/%{name}
%{_libdir}/%{name}/copy.sh
%{_libdir}/%{name}/list.sh
%{_libdir}/%{name}/move.sh
%{_libdir}/%{name}/select.sh
%{_mandir}/man1/noice.1.gz
%{_mandir}/man1/nopen.1.gz
/usr/share/doc/%{name}
%doc /usr/share/doc/%{name}/README
/usr/share/licenses/%{name}
%license /usr/share/licenses/%{name}/LICENSE


%changelog
* Mon Feb 03 2020 Runney Wu <an9wer@gmail.com> bfe589a
- Initial RPM release
