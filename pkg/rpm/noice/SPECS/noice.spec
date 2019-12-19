Name:           noice
Version:        bfe589a
Release:        1%{?dist}
Summary:        A small curses-based file browser

License:        BSD
URL:			http://git.2f30.org/noice/
Source0:        noice-bfe589a.tar.gz
Source1:        noiceconf.h
Source2:        nopenconf.h
Source3:        select.sh
Source4:        list.sh
Source5:        move.sh
Source6:        copy.sh

BuildRequires:  git make gcc ncurses-devel
Requires:       bash ncurses

%description


%prep
%setup -q
cp %{SOURCE1} %{SOURCE2} .


%build
make %{?_smp_mflags}


%install
make PREFIX=%{_prefix} MANPREFIX=%{_mandir} DESTDIR=%{buildroot} install
install -m 0755 -D %{SOURCE3} %{buildroot}/%{_libdir}/%{name}/select.sh
install -m 0755 -D %{SOURCE4} %{buildroot}/%{_libdir}/%{name}/list.sh
install -m 0755 -D %{SOURCE5} %{buildroot}/%{_libdir}/%{name}/move.sh
install -m 0755 -D %{SOURCE6} %{buildroot}/%{_libdir}/%{name}/copy.sh
install -m 0644 -D README  %{buildroot}/usr/share/doc/%{name}/README
install -m 0644 -D LICENSE %{buildroot}/usr/share/licenses/%{name}/LICENSE


%files
${_bindir}/noice
${_bindir}/nopen
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

