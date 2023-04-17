% HARDPH.CFG(5) hardph 2.0 | File Formats and Conventions
%
% 2023-04-10

# NAME
hardph.cfg - hardph configuration file

# DESCRIPTION
The *~/.hardph.cfg* file contains the allowlist *IP*s of *MODE*s that are parsed by
**hardph**(8). The *MODE*s are the ones supported by **hardph**(8) and suffixed with
'_ips=('.

The allowed *IP*s must be defined one-per-line in the enclosing parentheses of its
respective *MODE*s, in order to **hardph**(8) parse them correctly. Blank lines or
lines beginning with '#' are ignored.

# EXAMPLES
\# Allow only the 192.168.0.1–254 range of IPs to access Pi-hole. \
pihole_ips=( \
\  192.168.0.0/24 \
)

\# Allow only the 192.168.0.3 IP to access the SSH server. \
ssh_ips=( \
\  192.168.0.3 \
)

\# Allow only the 192.168.0.3 and 192.168.0.7 IPs to access the web interface. \
web_ips=( \
\  192.168.0.3 \
\  192.168.0.7 \
)

# FILES
*~/.hardph.cfg*
: The default **hardph.cfg** config file directory.

# BUGS
Report bugs to <https://github.com/ryoskzypu/hard_pihole/issues>.

# SEE ALSO
**firewall-cmd**(1), **hardph**(8), **pihole**(8), **ufw**(8)

<https://docs.pi-hole.net/main/prerequisites/#firewalls>, <https://reddit.com/r/pihole/comments/x7wns0/pihole_hardening_tips_4fun>

# AUTHOR
ryoskzypu <ryoskzypu@proton.me>

# COPYRIGHT
Copyright © 2023 ryoskzypu. License: MIT <https://github.com/ryoskzypu/hard_pihole/raw/main/LICENSE> \
This is free software: you are free to change and redistribute it. There is NO WARRANTY, to the extent permitted by law.
