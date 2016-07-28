# Puppet Node Query Tool

This is a simple script which takes the fqdn of a server and returns
the information concerning that node.  In order for the script to work
the node which is running the query must be added to the auth.conf on
the master server.  This can be done by finding the authentication line
in /etc/puppetlabs/puppet/auth.conf (for puppetserver <2.2.0) or
/etc/puppetlabs/puppetserver/conf.d/auth.conf (for puppetserver >2.2.0)
for /puppet/v3/node([^/]+)$ and amending the allow line to inlude an
array.  For >2.2.0 this looks like:
            "allow" : ["$1","centos6a.pdx.puppet.vm"],
