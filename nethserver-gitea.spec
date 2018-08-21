Summary:    NethServer configuration for Gitea
Name:       nethserver-gitea
Version:    0.0.1
Release:    2%{?dist}
License:    GPL
URL:        %{url_prefix}/%{name} 
Source0:    %{name}-%{version}.tar.gz
BuildArch:  noarch

Requires:   nethserver-httpd
Requires:   nethserver-mysql
Requires:   gitea

BuildRequires: nethserver-devtools 

%description
NethServer configuration for Gitea, a selfhosted Git service

%prep
%setup

%build
perl createlinks

%install
rm -rf %{buildroot}
(cd root; find . -depth -print | cpio -dump %{buildroot})
%{genfilelist} %{buildroot} > %{name}-%{version}-filelist
mkdir -p %{buildroot}%{_sharedstatedir}/nethserver/gitea


%post

%preun

%files -f %{name}-%{version}-filelist
%defattr(-,root,root)
%doc COPYING
%dir %{_nseventsdir}/%{name}-update
%attr(0755,gitea,gitea) %dir %{_sharedstatedir}/nethserver/gitea


%changelog
%changelog
* Thu Aug 02 2018 Mark Verlinde <mark.verlinde@gmail.com> 0.0.1-1
- First Build