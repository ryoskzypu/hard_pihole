# hard pihole

#### This script is based on [this] post from [/r/pihole] sub.

It checks status of:

- Network
- Pi-hole
- Firewall
- Web server

Then prompts to:

- Reset firewall and apply the recommended rules
- Restrict Pi-hole or web interface

## Dependencies
- [Pi-hole]
- firewalld or UFW

## Installation
`curl -sSO` [`copy & paste this link`]

`chmod u+x hard_pihole`

## Usage
`./hard_pihole`

[this]: <https://www.reddit.com/r/pihole/comments/x7wns0/pihole_hardening_tips_4fun/>
[/r/pihole]: <https://www.reddit.com/r/pihole/>
[Pi-hole]: <https://github.com/pi-hole/pi-hole>
[`copy & paste this link`]: <https://github.com/ryoskzypu/hard_pihole/raw/main/hard_pihole>
