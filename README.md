# hard pihole

#### This script is based on [this](https://www.reddit.com/r/pihole/comments/x7wns0/pihole_hardening_tips_4fun/) post on [/r/pihole](https://www.reddit.com/r/pihole/) sub.

It checks status of:

- Network
- Pi-hole
- Firewall
- Web server

Then prompts to:

- Reset firewall and apply the recommended rules
- Restrict Pi-hole or web interface

## Dependencies
- [Pi-hole](https://github.com/pi-hole/pi-hole)
- firewalld or UFW

## Installation
`wget -O hard_pihole` [copy and paste this link](https://github.com/ryoskzypu/hard_pihole/raw/main/hard_pihole)

    chmod u+x hard_pihole
## Usage
    sudo ./hard_pihole
