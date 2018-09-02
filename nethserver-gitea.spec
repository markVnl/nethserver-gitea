Summary:    NethServer configuration for Gitea
Name:       nethserver-gitea
Version:    0.0.8
Release:    1%{?dist}
License:    GPL
URL:        %{url_prefix}/%{name} 
Source0:    %{name}-%{version}.tar.gz
BuildArch:  noarch

Requires:   nethserver-httpd
Requires:   nethserver-mysql
Requires:   gitea >= 1.5.0

BuildRequires: nethserver-devtools 

%description
NethServer configuration for Gitea, a selfhosted Git service

%prep
%setup -q

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
* Sun Sep 02 2018 Mark Verlinde <mark.verlinde@gmail.com> 0.0.8-1
- implement virtual host
- bug fix app.ini: path to private gitea.key
- fix app.ine fallback gitea TCPPort 

* Fri Aug 31 2018 Mark Verlinde <mark.verlinde@gmail.com> 0.0.7-1
- do not restart webserver > reload httpd
- app.ini reomve unneeded bits
- hook into nethserver-openssh-save event for update on ssh port

* Wed Aug 29 2018 Mark Verlinde <mark.verlinde@gmail.com> 0.0.6-1
- Do not make assumptions for paths, during "disaster recovery" some are unknown

* Tue Aug 28 2018 Mark Verlinde <mark.verlinde@gmail.com> 0.0.5-1
- wait until full running state for populating db with tables, drop fixed running time 
- create and use db entry's

* Sat Aug 25 2018 Mark Verlinde <mark.verlinde@gmail.com> 0.0.4-2
- Ease running time gitea for populating db with tables

* Thu Aug 23 2018 Mark Verlinde <mark.verlinde@gmail.com> 0.0.4-1
- fix ssh: usermod 'home directory of gitea run user' tk @danb35
- populate database with tables on the fly

* Wed Aug 22 2018 Mark Verlinde <mark.verlinde@gmail.com> 0.0.3-1
- bump to Gitea version 1.5.0
- correction of database character set for future update path;
  note NOW NO update path from 0.0.2-1
- enable basic mailer
- tweaks for logging

* Wed Aug 22 2018 Mark Verlinde <mark.verlinde@gmail.com> 0.0.2-1
- implement backup; note NO update path from 0.0.1-1 :
  moved home- work- and repository-directory to var/lib/nethserver/gitea

* Thu Aug 02 2018 Mark Verlinde <mark.verlinde@gmail.com> 0.0.1-1
- First Build
