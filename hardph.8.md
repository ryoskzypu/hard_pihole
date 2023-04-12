% HARDPH(8) hardph 2.0 | System Administration Commands
%
% 2023-04-10

---
# For man page conventions, see grep(1), man(1), host.conf(5), man-pages(7).
#
# Also:
#   https://www.gnu.org/prep/standards/standards.html#GNU-Manuals
#   https://www.gnu.org/software/help2man/
#   https://en.wikipedia.org/wiki/Man_page
#   https://ubuntu-mate.community/t/how-to-create-your-own-man-pages/7931/2
#
# For pandoc guides, see:
#   https://www.howtogeek.com/682871/how-to-create-a-man-page-on-linux/
#   https://unix.stackexchange.com/questions/6891/how-can-i-add-man-page-entries-for-my-own-power-tools/375035#375035
---

# NAME
hardph - hardening command-line tool for Pi-hole

# SYNOPSIS
**hardph** *[OPTION]*... \
**hardph** [*OPTION*]... -d *MODE* *IP*[,...] ... \
**hardph** [*OPTION*]... -r *MODE* *IP*[,...] ...

# DESCRIPTION
**hardph** applies allowlist desktop firewall rules, based on *MODE*s from its
config file. It supports firewalld or UFW and assumes a GNU/Linux system.

The *MODE*s are: **pihole**, **ssh**, and **web**. The allowed *IP*s must be IPv4
and comma delimited (if option defined) in order to be validated.

In addition, **hardph** includes commands to delete/restrict the allowed *IP*s,
reset the firewall and apply the recommended Pi-hole rules, also output the system's
network information.

After parsing its *IP*s from the config file/command-line, **hardph** checks if a
port/service of *MODE* is active, then removes it before applying the firewall
allow rules — hence it is recommended in advance to save the current rules, or use
the **--dry-run** option — to avoid losing the previous rules.

# OPTIONS
## General Information
**-h**, **--help**
: Output the help usage and exit.

**-i**, **--info**
: Output the system's network information, all *MODE*s status information, and exit.

**-V**, **--version**
: Output the **hardph** version number and exit.

## Output Control
**-q**, **--quiet**
: Do not write anything to the standard output.

**-v**, **--verbose**
: Show more output information.

## Firewall Control
**-n**, **--dry-run**
: Print and do not execute the firewall commands.

**-d** *MODE* *IP*[,...], **--delete**=*MODE* *IP*[,...]
: Delete *IP* address of *MODE* and do not parse the config file.

**-r** *MODE* *IP*[,...], **--restrict**=*MODE* *IP*[,...]
: Restrict *MODE* by *IP* address and do not parse the config file.

**-R**, **--reset**
: Reset the firewall and apply the recommended Pi-hole rules.

## Configuration File
**--config-path**=*PATH*
: Set the pathname of config file, otherwise *PATH* is set to the user's home directory.

# FILES
*~/.hardph.cfg*
: The default **hardph.cfg** config file directory. See **hardph.cfg**(5) for usage
information.

# ENVIRONMENT
**CFGPATH**
: If **$CFGPATH** is set, its value overrides the pathname of **hardph.cfg** file.

# EXIT STATUS
**0**
: Successful program execution.

**1**
: Usage, syntax or file error.

**2**
: Firewall command error.

# EXAMPLES
**$ hardph --quiet**
: Parse/apply the *IP*s of *~/.hardph.cfg* file and suppress the stdout, including
errors.

**$ hardph -r pihole 192.168.0.0/24 -r web 192.168.0.3,192.168.0.7**
: Allow only the 192.168.0.1–254 range of *IP*s to access Pi-hole, also only the
192.168.0.3 and 192.168.0.7 *IP*s to access the web interface.

**$ hardph -d pihole 192.168.0.0/24 -d web 192.168.0.3,192.168.0.7**
: Undo the command above.

**$ hardph --dry-run --reset**
: Print and do not execute the **--reset** firewall commands, for testing.

**$ hardph --verbose --restrict=ssh 10.0.0.5,10.0.0.6,10.0.0.7**
: Execute **hardph** in verbose mode; allow only the 10.0.0.5, 10.0.0.6, and 10.0.0.7 *IP*s to access the SSH server.

**$ export CFGPATH=/tmp; hardph**
: Export **$CFGPATH** environment variable to the */tmp* directory and execute **hardph**.
Equivalent to **hardph --config-path=/tmp**.

# BUGS
Report bugs to <https://github.com/ryoskzypu/hard_pihole/issues>.

# SEE ALSO
**firewall-cmd**(1), **hardph.cfg**(5), **pihole**(8), **ufw**(8)

<https://docs.pi-hole.net/main/prerequisites/#firewalls>, <https://reddit.com/r/pihole/comments/x7wns0/pihole_hardening_tips_4fun>

# AUTHOR
ryoskzypu <ryoskzypu@proton.me>

# COPYRIGHT
Copyright © 2023 ryoskzypu. License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl-3.0.html>. \
This is free software: you are free to change and redistribute it. There is NO WARRANTY, to the extent permitted by law.
