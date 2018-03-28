<p align="center">
  <img src="https://raw.githubusercontent.com/U039b/PiRogue/master/pictures/icon.png" alt="PiRogue icon"/>
</p>

# PiRogue
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
*  [Ep1 - Capture HTTP/S traffic](https://www.youtube.com/watch?v=o0OSaSh0HJw)

## Installation
This tutorial was tested with Kali GNU/Linux rolling `2018.1`.

### 1 - Install Kali GNU/Linux - _on your computer_
Please refer to the [Kali documentation](https://docs.kali.org/kali-on-arm/install-kali-linux-arm-raspberry-pi) for this step.

### 2 - Prepare the system - _on your PiRogue_
Connect your PiRogue to your ethernet network. An Internet connection is required. Once done, power it on and use `root` as username and `toor` as password to log in.
You need to get its IP address in order to install the customization. To do, open a terminal and type:
```
ifconfig eth0
```
and remember the IP address. It should look like `192.128.0.12`.

### 3 - Install Ansible - _on your computer_
To install ansible, please follow the [Ansible documentation guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).

### 4 - Install PiRogue customization - _on your computer_
To install and configure your PiRogue, you have to clone the [PiRogue-ansible](https://github.com/U039b/PiRogue-ansible) Git repository:
```
git clone https://github.com/U039b/PiRogue-ansible.git /tmp/PiRogue
```

Then, go into the `/tmp/PiRogue` directory:
```
cd /tmp/PiRogue
```
and edit the `inventory.ini` file and correct the IP address specified just after `ansible_host=`. It should look like:
```
pirogue_1 ansible_host=192.128.0.12  ansible_ssh_user=root
```

**NB**: if you want to install the PiRogue customization on multiple PiRogue devices at the same time, just duplicate the configuration, one line per device. Be sure to specify the correct IP address for each device. Example:
```
pirogue_1 ansible_host=192.168.1.123  ansible_ssh_user=root
pirogue_2 ansible_host=192.168.1.124  ansible_ssh_user=root
pirogue_3 ansible_host=192.168.1.125  ansible_ssh_user=root
```

Finally, start the installation by using the following command:
```
ansible-playbook -i inventory.ini --ask-pass pirogue.yml
```
It will ask you an SSH password, use `toor` if you do not have change your password on your PiRogue, otherwise, use your new passord.

### 5 - Reboot - _on your PiRogue_
On you PiRogue, open a terminal and type the following command:
```
reboot
```
**NB**: Remember that all the PiRogue files reside in `/usr/share/PiRogue` on your PiRogue.

### 6 - Screen customization - _on your PiRogue_
PiRogue has a tiny OLED screen on top of it. This screen displays two different screens:
*  the boot screen defined in `oled-screen/boot.py`
*  the details screen defined in `oled-screen/infos.py`

## Use cases
### Transparent proxying with MITMproxy
While using `mitmproxy` you can use between at least 2 different modes:
* _normal_ you have to specify IP address and port of `mitmproxy` in the HTTP proxy section of the Wifi connection on your target device
* _transparent_ you do not need to specify a HTTP proxy on your target device

An helper script `/usr/share/PiRogue/proxy/transparent.sh` is available. By executing this script, HTTP and HTTPS traffic from `wlan1` will be redirected to `mitmproxy`.

### Google Location service live map
Please refer to the [GLS live map plugin](https://github.com/U039b/PiRogue/tree/master/mitmproxy)
