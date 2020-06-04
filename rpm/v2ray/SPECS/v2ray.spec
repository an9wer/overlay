Name:           v2ray
Version:        4.23.3
Release:        2%{?dist}
Summary:        A platform for building proxies to bypass network restrictions.

License:        MIT
URL:            https://www.v2ray.com/
Source0:        https://github.com/v2ray/v2ray-core/releases/download/v%{version}/v2ray-linux-64.zip
Source1:        v2ray@.service
Patch0:         v2ray.service.patch
BuildRequires:  systemd-devel
%{?systemd_requires}


%description
A platform for building proxies to bypass network restrictions.


%prep
%setup -n v2ray -c v2ray
cd systemd
%patch -P 0


%install
install -m 0755 -D v2ray %{buildroot}%{_bindir}/v2ray
install -m 0755 -D v2ctl %{buildroot}%{_bindir}/v2ctl
install -m 0644 -D geoip.dat %{buildroot}%{_libdir}/%{name}/geoip.dat
install -m 0644 -D geosite.dat %{buildroot}%{_libdir}/%{name}/geosite.dat
install -m 0644 -D config.json %{buildroot}%{_sysconfdir}/%{name}/config.json
install -m 0644 -D systemd/v2ray.service %{buildroot}/usr/lib/systemd/system/v2ray.service
install -m 0644 -D %{SOURCE1} %{buildroot}/usr/lib/systemd/system/v2ray@.service
install -m 0644 -D doc/readme.md %{buildroot}%{_datadir}/doc/%{name}/readme.md


%preun
%systemd_preun v2ray.service v2ray@*.service


%postun
%systemd_postun_with_restart v2ray.service v2ray@*.service


%files
%{_bindir}/v2ray
%{_bindir}/v2ctl
%{_libdir}/%{name}/geoip.dat
%{_libdir}/%{name}/geosite.dat
/usr/lib/systemd/system/v2ray.service
/usr/lib/systemd/system/v2ray@.service
%config %{_sysconfdir}/%{name}/config.json
%doc %{_datadir}/doc/%{name}/readme.md


%changelog
* Wed Jun 03 2020 Runney Wu <an9wer@gmail.com> 4.23.3-2
- Restart systemd service while updating

* Wed Jun 03 2020 Runney Wu <an9wer@gmail.com> 4.23.3-1
- Bump to version 4.23.3

* Tue Feb 26 2020 Runney Wu <an9wer@gmail.com> 4.22.1-2
- Add v2ray@.service

* Tue Feb 26 2020 Runney Wu <an9wer@gmail.com> 4.22.1-1
- Initial RPM release
