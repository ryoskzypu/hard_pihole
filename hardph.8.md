% HARDPH(8) hardph 2.0 | System Administration Commands Manual
%
% Apr 2023

# NAME
hardph - hardening command-line tool for Pi-hole 

# SYNOPSIS
**hardph** *[OPTION]*... \
**hardph** *[OPTION]*... *-r* *MODE* *IP[,IP]* ...

# DESCRIPTION
Apply allowlist desktop firewall rules from its config file.

# OPTIONS
With no --config-path= *OPTION*, set PATH to the user's home directory.

With the --restrict= *OPTION*, do not parse the config file.

**-d**, **--delete**=*MODE* *IP*
: delete IP address of *MODE*

**-h**, **--help**
: display this help and exit

**-i**, **--info**
: output all *MODE*s status information and exit

**-n**, **--dry-run**
: print firewall commands without execution

**-q**, **--quiet**
: show no output

**-r**, **--restrict**=*MODE* *IP*
: restrict *MODE* by IP address

**-R**, **--reset**
: reset firewall and apply the recommended Pi-hole rules

**-v**, **--version**
: output version information and exit

**-V**, **--verbose**
: more output verbosity

**--config-path**=*PATH*
: set PATH of config file

# FIREWALLS
firewalld, UFW

# MODES
pihole, ssh, web

# IPS
Valid allowed IPs must be IPv4 and comma delimited.

# EXIT STATUS
**0**
: success

**1**
: error

# ENVIRONMENT VARIABLES
*CFGPATH*
: If $CFGPATH is set, its value overrides the default **hardph** config pathname.

# FILES
**~/.hardph.cfg**
: The default **hardph** configuration file directory.

# EXAMPLES
**$ hardph -r pihole 192.168.0.0/24 -r web 192.168.0.3,192.168.0.7**
: Allow only the 192.168.0.1–254 range of IPs to access Pi-hole, also only the 192.168.0.3 and 192.168.0.7 IPs to access web interface.

# AUTHOR
ryoskzypu <ryoskzypu@proton.me>

# REPORTING BUGS
If you find a bug, please create an issue at https://github.com/ryoskzypu/hard_pihole/issues.

# COPYRIGHT
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.

# SEE ALSO
**firewall-cmd(1)**, **ufw(8)**, **pihole(8)**
