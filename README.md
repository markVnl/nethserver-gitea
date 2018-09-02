Nethserver-gitea
=====================================

(WORK IN PROGRESS)

Gitea a selfhosted code repository
-------------------------------------

Git with a cup of tea, A painless self-hosted Git service. Gitea is a community managed lightweight code hosting solution written in Go and published under the MIT license. 
Being self-hosted it is ideal for projects in an early stage of development, not ready for publication; private projects with no public use in general or if you are new to git/github and want to learn it in your own environment.

Installation
------------

_At the time of writing package and it’s dependency gitea are not available in package repositories._  

 After installation the web-ui is available at `https://FQDN_Server/git` 

The internal admin user created at first install is:

> Username: gitea  
> Password: gitea  

Change this password immediately in the web-ui (Settings > Account > Password)

As an alternative it is possible to add administrator rights  to a (at least once logged-in) nethserver-user at Site Administration > User Account > edit . This user may remove the default admin account gitea.

Note:
> Gitea has an internal account for admin (among other things used for command line interaction) as an consequence it is impossible to login as admin

Nethserver users must login in with the short username (omitting the @FQDN_Server!).  

To receive notifications users have to set their e-mail address at Settings > Profile > Account > Email Address. This is the down side of the by default configured authentication source PAM.  

_TODO: describe advanced configuration with bind to  Ldap/AD_

Configuration
-------------

(with default values)

`DisableRegistration=true` - if set to false non nethserver-user can register  
`EnableNotifyMail=true` – notification emails are send  
`HttpAccess=public` – if set to private web-ui and https clone are exclusively available on private networks  
`MailerEnabled=true` – set to false to disable mailer  
`MirrorInterval=30m` – interval to update a mirrored code repository  
`TCPPort=5321` – listening port of gittea  
`VirtualHost=` - if a FQDN is given gitea is available at FQDN, https url atlers to https:/FQDN/user/project.git  
`access=localhost` - recommend to keep this:  proxy takes care of external connections  
`status=enabled` – enable / disable gitea service  

To be able to clone/push/pull over SSH from public networks SSH must be enabled on public (red) networks. 

Known Limitations
-----------------

* Gittea does not have a configuration reload option (yet), to reload the configuration gitea needs to be restarted. This will end the session of logged in users.
This ocours if:  
Nethserver-gitea is updated (`nethserver-gitea-update event`)  
The server certificate is updated (`certificate-update event`)  
The SSH port is changed (`nethserver-openssh-save event`)  
* No large file support due to centos git version 1.8.x  
* Impossible to login as admin  

TODO FIXME
----------

* Evaluate db setup method
* Evaluate mailer setup
* Redis cache support
* Enhance this documentation
* What ever comes up to the table
