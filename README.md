# docker-proxy
Docker container running squid caching http/https traffic on ports 80,443 and 8443


## Backround

Once you start building enough containers you will get tired of waiting for rpm's or tgz to download from Internet, and you will wish for some caching to speed things up - even more so if you are on slow internet, or wish to work offline. There are more then few of these squid in containers, this one works for me, has support for http/https and https works both on 443 and 8443, plus it uses mounted volume on the host to keep cache files between runs.


Based on hpess/dockerproxy, so all kudos go there. Extended to cache traffic to 8443 as well, since some sites don't use 443 and use 8443 instead.

## Getting started

1. Run the build.sh to build the image
2. Create directory where you wish to store cached content and set env variable CACHE_DIR=your_dir
3. Run run-proxy.sh

Squid inside container will transparently redirect all docker containers through it, so all traffic destined to ports 80, 443 and 8443 will go through it. Since squid will be using ssl-bump for https (443 and 8443) usual notes apply on it, for more details see: http://wiki.squid-cache.org/Features/SslBump

To stop container, run stop-proxy.sh and hit CTRL+C, it will clean up iptables rules it has set up for transparent proxying.

## Problems

You can always start shell inside the container and see what happens with:
```bash
docker exec -it CONTAINER_ID bash
tail -f /var/log/squid/access
for example.
```

Happy hacking.
