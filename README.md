<p align="center">
  <img src="https://raw.githubusercontent.com/U039b/PiRogue/master/pictures/icon.png" alt="PiRogue icon"/>
</p>

# 🇬🇧 PiRogue
PiRogue is a small device meant to ease network interception and analysis. PiRogue is based on a [Raspberry Pi 3](https://www.raspberrypi.org/) and [Kali GNU/Linux](https://www.kali.org/). This project is for educational purpose. 

By default, PiRogue will mount a rogue Wi-fi access point with the SSID `PiRogue` without password available on `wlan1` which is the Wi-fi dongle. The Internet connection will be dynamically shared with the rogue Wi-fi network. PiRogue will automatically share the active connection (`wlan0` or `eth0`). 

The OLED screen on top of the PiRogue will display: 
*  disk and memory information
*  ethernet IP address
*  Wifi IP address
*  rogue Wifi IP address
*  rogue Wifi SSID
*  indication about network capture

Since PiRogue is based on [Kali GNU/Linux](https://www.kali.org/), it offers [plenty of tools](https://tools.kali.org/).

This project was initiated with the participation of [@MaliciaRogue](https://twitter.com/MaliciaRogue).

## Hardware
The PiRogue is based on:
*  a Raspberry Pi 3
*  a `TL WN725N` version `2.1` or `2.2` 
*  a 32GB SD-card
*  a `SSD1306` I2C 0.96" OLED screen

A custom 3D printed case is [available on Thingiverse](https://www.thingiverse.com/thing:2822262).

### Connect the OLED screen
To display things on the tiny screen, you have to connect it to the Rapberry Pi GPIO. Follow this wiring schema:
<p align="center">
  <img src="https://raw.githubusercontent.com/U039b/PiRogue/master/pictures/screen_wiring.png" alt="OLED screen wiring"/>
</p>

For more details about the screen and the GPIO, have a look to [my PiRouter tutorial](https://esther.codes/post/pi_router_story/#ep4).

## Demo
* [Ep1 - Capture HTTP/S traffic](https://www.youtube.com/watch?v=o0OSaSh0HJw)

## Installation
* [Installation guide](doc/install_en.md)

## Use cases
### Transparent proxying with MITMproxy
While using `mitmproxy` you can use between at least 2 different modes:
* _normal_ you have to specify IP address and port of `mitmproxy` in the HTTP proxy section of the Wifi connection on your target device
* _transparent_ you do not need to specify a HTTP proxy on your target device

An helper script `/usr/share/PiRogue/proxy/transparent.sh` is available. By executing this script, HTTP and HTTPS traffic from `wlan1` will be redirected to `mitmproxy`.

### Google Location Services live map
Please refer to the [GLS live map plugin](https://github.com/PiRanhaLysis/PiRogue/tree/master/mitmproxy)

<hr>

# 🇫🇷 PiRogue
Le PiRogue est un petit équipement ayant pour objectif de faciliter l'interception de trafic réseau et de l'analyser. Le PiRogue
est basé sur un [Raspberry Pi 3](https://www.raspberrypi.org/) et la distribution [Kali GNU/Linux](https://www.kali.org/). 
Ce projet est à but éducatif. 

Par défaut, le PiRogue crée un point d'accès wi-fi avec le SSID `PiRogue` utilisable sans mot de passe diffusé sur l'interface `wlan1` 
(dongle wi-fi). La connection Internet est dynamiquement partagée avec ce réseau wi-fi. C'est-à-dire que le PiRogue va automatiquement partager la connection active soit `wlan0` soit `eth0`.

L'écran OLED situé sur le dessus du PiRogue affichera : 
*  les informations d'utilisation disque et RAM
*  l'adresse IP de l'interface ethernet 
*  l'adresse IP de l'interface wi-fi `wlan0`
*  l'adresse IP de l'interface wi-fi `wlan1`
*  le SSID du réseau wi-fi dédié à la capture
*  l'indication de capture ou non

Le PiRogue étant basée sur [Kali GNU/Linux](https://www.kali.org/), il offre [un grand nombre d'outils](https://tools.kali.org/).

Ce projet a été initié avec l'active participation de [@MaliciaRogue](https://twitter.com/MaliciaRogue).

## Hardware
Le PiRogue se base sur :
*  un Raspberry Pi 3
*  un dongle `TL WN725N` version `2.1` ou `2.2` 
*  une SD-card de 32GB
*  un écran OLED I2C de 0.96" `SSD1306`

Un boîtier réalisable avec une imprimante 3D est [disponible sur Thingiverse](https://www.thingiverse.com/thing:2822262).

### Connexion de l'écran OLED
Afin de tirer profit de l'écran, vous devez le connecter aux GPIO du Raspberry Pi en suivant ce schéma : 
<p align="center">
  <img src="https://raw.githubusercontent.com/U039b/PiRogue/master/pictures/screen_wiring.png" alt="OLED screen wiring"/>
</p>

Pour plus de détails, vous pouvez consulter le [tutoriel du PiRouter](https://esther.codes/post/pi_router_story/#ep4).

## Demo
* [Ep1 - Capture du trafic HTTP/S](https://www.youtube.com/watch?v=o0OSaSh0HJw)

## Installation
* [Guide d'installation](doc/install_fr.md)

## Cas d'usage
### Proxy transparent avec MITMproxy
L'utilisation de `mitmproxy` permet 2 modes différents :
* _normal_ il est nécessaire de préciser l'adresse IP et le port d'écoute de `mitmproxy` dans la section _HTTP proxy_ de la connexion wi-fi de votre équipement (smartphone) cible
* _transparent_ il n'est pas nécessaire de préciser l'adresse IP ni le port d'écoute de `mitmproxy`

Un script permettant l'utilisation du mode transparent est disponible ici `/usr/share/PiRogue/proxy/transparent.sh`.

### Carte interactive pour Google Location Services
Rendez-vous sur [GLS live map plugin](https://github.com/PiRanhaLysis/PiRogue/tree/master/mitmproxy).
