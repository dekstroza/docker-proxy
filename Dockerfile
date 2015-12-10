FROM hpess/dockerproxy

COPY files/squid.conf.erb /chef/cookbooks/squid/templates/default/
COPY files/iptables.py.erb /chef/cookbooks/iptables/templates/default/




