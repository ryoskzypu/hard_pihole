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
- sudo
- [Pi-hole](https://github.com/pi-hole/pi-hole)
- firewalld or UFW

## Installation
`wget -O hard_pihole` [copy and paste this link](https://gist.github.com/ryoskzypu/f3cff6877c5fbdab00f1e12b3522ac22/raw/a3e6a07793d7d9ca79af2776a32b3419d475820b/hard_pihole)

## Usage
    chmod u+x hard_pihole
    sudo ./hard_pihole
