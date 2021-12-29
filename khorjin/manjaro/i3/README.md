# Manjaro i3

## Bypass Password Authentication in sudo 

```sh
echo \
'# hasan can sudo whitout password
hasan ALL=(ALL) NOPASSWD:ALL' \
    | sudo tee /etc/sudoers.d/hasan
```
## Sync package manager mirrors and update 

```sh
sudo sed -i -e "s/#Color/Color/" \
	-e "s/#TotalDownload/TotalDownload/" \
	-e "s/#VerbosePkgLists/VerbosePkgLists/" \
	/etc/pacman.conf
sudo pacman-mirrors -c France --api --protocol https;
sudo pacman -Syu --noconfirm;
```

## Internet browser

```sh
sudo pacman -Rsunc --noconfirm palemoon-bin;
sudo pacman -S --noconfirm firefox;
```

## Google Drive sync

```sh
sudo pacman --noconfirm -S rclone;
rclone config create google drive;

# docker run -it --rm \
# 	--volume ~/.config/rclone:/config/rclone \
# 	--user $UID:$GID \
# 	--network host \
# 	rclone/rclone config create google drive;
```

## Firefox sync

```sh
rclone sync --progress google:home/hasan/.mozilla ~/.mozilla;
```

## Shell config

```sh
sudo pacman --noconfirm -S \
    oh-my-zsh \
    zsh-autosuggestions \
    zsh-syntax-highlighting \
    zsh-history-substring-search;
rclone --progress sync google:.zshrc ~/;
rclone --progress sync google:.zsh_history ~/;
echo \
'#Aliases
alias c="clear"
alias b="bat -Pp"
' \
    | sudo tee /usr/share/oh-my-zsh/custom/aliases.zsh
chsh -s /bin/zsh;
```

## Konsole

```sh
rclone sync --progress google:.local/share/konsole ~/.local/share/konsole;
sudo pacman -S --noconfirm konsole;
```

## SSH

```sh
rclone sync --progress google:.ssh ~/.ssh;
sudo chown -R hasan:hasan /home/hasan/.ssh;
sudo chmod -R 700 /home/hasan/.ssh;
sudo sed -i -e "s/#PasswordAuthentication .*/PasswordAuthentication no/" \
	-e "s/#PermitRootLogin .*/PermitRootLogin no/" \
	/etc/ssh/sshd_config;
sudo systemctl enable --now sshd;
```

## Fonts

```sh
pamac build --no-confirm vazir-fonts
```

## File Manager

```sh
sudo pacman -Rsunc --noconfirm pcmanfm;
rclone sync --progress google:.local/share/dolphin ~/.local/share/dolphin;
sudo pacman -S --noconfirm dolphin dolphin-plugins;
```

## Rofi

```sh
sudo pacman -S --noconfirm rofi rofi-calc;
rclone sync --progress google:.config/rofi ~/.config/rofi;
```

## i3 Config

```sh
rclone sync --progress google:.i3 ~/.i3;
```

## Editors

```sh
sudo pacman -Rsunc --noconfirm mousepad;
rclone sync --progress google:.local/share/kate ~/.local/share/kate;
sudo pacman -S --noconfirm kate;
```

## Tor

```sh
sudo pacman -S --noconfirm tor privoxy torsocks;
pamac build --no-confirm obfs4proxy-bin;

sudo sed -i -e "s/#SocksPort 192.168.0.1:9100/SocksPort 0.0.0.0:9050/" \
	-e "s/#%include/%include/" \
	/etc/tor/torrc;
sudo mkdir -p /etc/torrc.d/;
echo \
'
#TransPort 0.0.0.0:9040 
DNSPort 0.0.0.0:53
UseBridges 1
ClientTransportPlugin obfs4 exec /usr/bin/obfs4proxy

   #Date      #IP:PORT              #FINGERPRINT                             #CERTIFICATE
## 2021/10/07
#bridge obfs4 51.158.185.158:6720   36B6962ED6408D91E917BD430E24ADC2939787D0 cert=OQaiMx86hCcrYSQmCFvGoJpDqRp+3h9x6XaDiVcT0oiE6New0d58jhrH5KfG4CDmRU2XUQ iat-mode=0 #Country: France (FR)
#bridge obfs4 165.120.255.22:8080   8849995F05369DDE6E2E0A256BC72DEE8D5F8F54 cert=ytPoBUqaEOkjL+y07xpYyI5KALQXw1uxvq1RTpsCgO1jyyj2KsL5AY9QQ3nWrRf9XGj9Xg iat-mode=0 #Country: United Kingdom (GB)
#bridge obfs4 86.4.50.213:9337      1CAA9A8D4ED21E980F5DF54A1546BEC8DB45DDB3 cert=3ENHcQpElXkm9qVj4WhLgsjbDFCrNa2v2ccgxgeL7YiOHk/KGagKKZc6+bQEijMTWKWWLQ iat-mode=0 #Country: United Kingdom (GB)
#bridge obfs4 167.99.37.78:1723     16EF41DE3FB1F347223B0394EE990876AABC3F1D cert=dM5K7e0tsbk6G2Ps+Q++BDv8BnDv2Owk+oW0v2O1+8tgERTubkUlzhZ9AAcYmBz8jynIag iat-mode=0 #Country: Netherlands (NL)
## 2021/08/08
#bridge obfs4 72.19.15.147:443      F12E59AA3EF26CFF4623D379E8358617BB24C1F6 cert=vhf1NSQL3A1dsi+yNAGHmrMHZmBkJRacSrofqqP9QM1tVW/qh1nAY9Q4JCWwvC81AMwNYg iat-mode=0 #Country: United States (US)
 bridge obfs4 88.97.48.15:52091     2F4E2921E7005D873C1FB7235AC2F36853FA8334 cert=95VB0GuDhUd6T4u7vKH7jnZcY0BsfzaaCu/+CShch8B8xnie5cEu17j+NfuDYFCbv4jKFg iat-mode=0 #Country: United Kingdom (GB)
## 2021/05/14
#bridge obfs4 90.194.79.103:51121   86BDA202CAAD3865220C79DC564BFE07727D27F5 cert=jkDM9kE7J/GpeXdlM3v6GXeWLuoXroEWscav/LBZ0DQIQQG/DrL7WSoedMmqS8EfP5vdIA iat-mode=0 #Country: United Kingdom (GB)
#bridge obfs4 99.232.142.243:51987  CCEA79197A59ABCD2BDCAEF796D68654B3C84895 cert=bbMKfqgR3KUHImGQEInuhWOm1hly8jEgDkaDTU9AAVtnp1oC0iw+Jwv/mTXKnTvxn2jFGA iat-mode=0 #Country: Canada (CA)
## 2021/04/23
#bridge obfs4 98.149.15.16:42786    9EB94D29047DBAEFF56035353D4306B732C79F05 cert=rLYOqY0szSm5HndAVNCVN1vxuEhOmdQp1vwLfrw+cQePBQbfmSnlOnyJzUGlQMQVtxegPg iat-mode=0 #Country: United States (US)
## 2021/04/10
#bridge obfs4 71.33.251.73:35539    0BBFEF1B86046EB311DCD6CB2938D1D888134C7D cert=pPCJl+5Sw5d/vXxtTbepFqLXWgBHAEoW6lCKsqfZhvf/YhsrHZXNJAyZiRYa+p1vQyBoVA iat-mode=0 #Country: United States (US)  (Not Work: ADSL-2020)
#bridge obfs4 46.165.188.249:38693  0BABF4BAB3C5C9377A3330009DDFE923568CA63B cert=0c+D6Pi9s2WuwhvcUN4bRw1zGKUA32n7c7puVi5PNEGXeDr3Rw5/PXzPudVn8st9upGaDQ iat-mode=0 #Country: Germany (DE)        (Not Work: ADSL-2020)
## 2021/04/01
#bridge obfs4 38.229.33.140:57275   EC4F9DA66F520A094E5B534AA08DFC1AB5E95B64 cert=OJJtSTddonrjXMCWGX97lIagsGtGiFnUI6t/OGFbKtpvWiFEfS0sLBnhLmHUENLoW1soeg iat-mode=1 #Country: United States (US)  (Not Work: ADSL-2020)
#bridge obfs4 99.230.168.201:45061  0EED8757367D4F2EA0855E37703B346A6FCF8F94 cert=UcwhOZQgsbKvCX66hmHmLrMd5eYrCeipUh9A0eWTkrUpG8ZutYEeAEI5XohYFJJzFjQsAA iat-mode=0 #Country: Canada (CA)         (Not Work: ADSL-2020)
## 2021/01/26
#bridge obfs4 2.221.78.163:2487     2563C0683242FDA2A620821B35BA00182A11CE67 cert=xelYkjVTY45G72AJqSZENWOpJQvt09/qtB0y92ipK2LChMWHClfYGpIzjJqR4JTh32iwAA iat-mode=0 #Country: United Kingdom (GB) (Not Work: ADSL-2020, Hamrah-Aval)
#bridge obfs3 38.229.33.140:57275   EC4F9DA66F520A094E5B534AA08DFC1AB5E95B64 cert=OJJtSTddonrjXMCWGX97lIagsGtGiFnUI6t/OGFbKtpvWiFEfS0sLBnhLmHUENLoW1soeg iat-mode=1 #Country: United States (US)  (Not Work: ADSL-2020)
## 2021/01/25
#bridge obfs4 51.195.56.248:443     B0CA184812DFE17EA84B0677E77E9965CCDC488F cert=PwljC+dc5FIYCiIAOgp/qDO+fmoQTpZK0Ar0URQJmCFGFrwfDhdM70b7CqkxTvK9iwkOZA iat-mode=0 #Country: Lithuania (LT)      (Not Work: ADSL-2020)
#bridge obfs4 185.220.101.123:63640 AFCB750E08673D08D70562AD2E20A52EB815E2B4 cert=p9L6+25s8bnfkye1ZxFeAE4mAGY7DH4Gaj7dxngIIzP9BtqrHHwZXdjMK0RVIQ34C7aqZw iat-mode=0 #Country: Germany (DE)        (Not Work: ADSL-2020)
## 2020/05/14
#bridge obfs4 71.36.201.197:37491   A10929E8DC3D6CE9AF2BE3A579A3053A67621933 cert=xFZMOe4a5LIcDduir9J0n9n6xEhto4bk9n1T8pSKYzxus1uafYOlx7mOUlcsD7oYHl9TXA iat-mode=0 #Country: United States (US)  (Not Work: ADSL-2020)
#bridge obfs4 87.81.44.213:51121    86BDA202CAAD3865220C79DC564BFE07727D27F5 cert=jkDM9kE7J/GpeXdlM3v6GXeWLuoXroEWscav/LBZ0DQIQQG/DrL7WSoedMmqS8EfP5vdIA iat-mode=0 #Country: United Kingdom (GB) (Not Work: ADSL-2020)
#bridge obfs4 195.88.84.138:40445   7B1749DAE33496CAF4C829447AC2657322461044 cert=VB7mQFAGV/jXguEiXDDthSlXMh5Xr+h7OCfd7ZLXySfzmipU0lmdqLsQiegtsKAE/vurZg iat-mode=0 #Country: France (FR)         (Not Work: ADSL-2020)
## 2020/04/28
#bridge obfs4 139.59.103.137:44278  88DD931616BD2459E5243390A2CD5BF5E10F6F88 cert=szxkmXq4rB6rUYh/TveORT1WrDFGxWedtHdBh463BsWHh5P/fDMvZodloDF8TMCGpfKfeA iat-mode=0 #Country: Singapore (SG)      (Not Work: ADSL-2020)
#bridge obfs4 13.81.48.139:43981    C128E91BCF541FE0F6323F51D6B3C67326E441F4 cert=GlYLwHazlIfTYpJETZRkjx2PNlcJAKajCV6CoqyR8/Xceph5EpstUK176KvTBJmaG+UnFA iat-mode=0 #Country: Netherlands (NL)    (Not Work: ADSL-2020)
#bridge obfs4 176.250.244.87:2487   2563C0683242FDA2A620821B35BA00182A11CE67 cert=xelYkjVTY45G72AJqSZENWOpJQvt09/qtB0y92ipK2LChMWHClfYGpIzjJqR4JTh32iwAA iat-mode=0 #Country: United Kingdom (GB) (Not Work: ADSL-2020)
#bridge obfs4 59.167.129.32:8011    2888A5454854B4749137C6AC1DF4A83FA8437689 cert=nuzMHDHn5pogBp59CknCjdaoIxSJKpJkQEubJTX1vbwllMG8uNuAV23D6102LQ8C3gXnDQ iat-mode=0 #Country: Australia (AU)      (Not Work: ADSL-2020)
## 2020/03/26
#bridge obfs4 88.198.46.98:49168    1F7B521B5E61D034B72EA965EA12133F9D992568 cert=bIBPFb5bVqeeGL6OFxEXm+qNuZwR9ZH7qkvMrermYpF3o7ENQsvLIRPMQL6hc/mETD7ePQ iat-mode=0 #Country: Germany (DE)        (Not Work: ADSL-2020)
#bridge obfs4 95.216.141.22:443     1CDA1660823AE2565D7F50DE8EB99DFDDE96074B cert=4bwNXedHutVD0ZqCm6ph90Vik9dRY4n9qnBHiLiqQOSsIvui4iHwuMFQK6oqiK8tyhVcDw iat-mode=0 #Country: Finland (FI)        (Not Work: ADSL-2020)
#bridge obfs4 103.79.79.6:11432     FC6F169578A5F5EA4077B8BF75DCA8198C15C364 cert=2e/GvjYP7s22fW+Pcs022VFoqSu6vUxRIaw7hmyl/teDBygzTJL45syVzaVnTcynwii0Ag iat-mode=0 #Country: United States (US)  (Not Work: ADSL-2020)
## 2020/01/24
#bridge obfs4 71.163.104.175:15764  730DAB9D7614DD0875FD3E3797C679B154EBD9A4 cert=qSCOkX5yjgPdMXDqWnxG00YYZ6AI8LTqMFwxl03V+UZpEjoScz8iRnQLzVJXjr2b4EzSDA iat-mode=0 #Country: United States (US)  (Not Work: ADSL-2020)
#bridge obfs4 88.193.235.54:52313   13499A6677D38C132DB84A5BCC841A61210B2491 cert=0TC1Ul9jW1nCALKm5pKYcrrKoZm/ttDvbMsf0qJ9SyhhHSlXwpbrJUeFYiHAtjptMRpAXw iat-mode=0 #Country: Finland (FI)        (Not Work: ADSL-2020)
#bridge obfs4 175.211.109.73:443    7561F8F902957490421282F3D12F81F8115B9AF9 cert=WFJBHYP/MYBU9bgPkU/JqIxZfz9RHiBA+tSZpVtofIUzgItq7bi14lqKQb85csCWQsKsYQ iat-mode=0 #Country: South Korea (KR)

 MiddleNodes {GB}
 ExitNodes   {GB}
' \
    | sudo tee /etc/torrc.d/bridges.conf;

sudo sed -i -e "s/listen-address  127.0.0.1:8118/listen-address  0.0.0.0:8118/" \
	/etc/privoxy/config;
echo \
'
forward-socks5 / localhost:9050 .
forward-socks4 / localhost:9050 .
forward-socks4a / localhost:9050 .
' \
    | sudo tee -a /etc/privoxy/config;

sudo systemctl enable --now tor privoxy; sudo systemctl status tor privoxy;
```

## Audio & Cmus

```sh
rclone sync --progress google:Music ~/Music;
rclone sync --progress google:.config/cmus ~/.config/cmus;
sudo pacman -S --noconfirm pulseaudio pavucontrol pa-applet cmus;
sudo pacman -Rsncu --noconfirm volumeicon;
```

## Multiplayer

```sh
rclone sync --progress google:.config/mpv/mpv.conf ~/.config/mpv;
rclone sync --progress google:.config/mpv/input.conf ~/.config/mpv;
sudo pacman -S --noconfirm mpv;
rclone sync --progress google:.config/vlc ~/.config/vlc;
```

## Java

```sh
sudo pacman -S --noconfirm jdk-openjdk java-openjfx;
```

## Telegram

```sh
sudo pacman -S --noconfirm ttf-opensans telegram-desktop;
```

## Docker

```sh
sudo pacman -S --noconfirm docker;
sudo usermod -aG docker hasan;
```

## Other

```sh
sudo pacman -S --noconfirm \
	kubectl remmina freerdp wol mkvtoolnix-gui \
	tree base-devel obs-studio whois traceroute \
	aircrack-ng aria2 jq mtr nmap unrar dnsutils \
	wireshark-qt qbittorrent tigervnc tmux nyx \
	ark x11vnc bmon gradle helm cuda yt-dlp foliate \
    docker-compose;
pamac build --no-confirm yt-dlp rtl8192eu jcal-git \
    spring-boot-cli linkerd;
sudo pacman -Rsncu --noconfirm clipit;
```

## Samba

```sh
sudo pacman -S --noconfirm samba;
sudo mkdir -p /etc/samba;
echo \
'
[Home]
        path = /home/hasan/
        valid users = hasan
        writeable = yes
' \
    | sudo tee -a /etc/samba/smb.conf;
sudo smbpasswd -a hasan;
sudo systemctl enable --now smb;
```

## VSCode & Angular

```sh
pamac build --no-confirm visual-studio-code-bin angular-cli;
```

## VirtualBox

```sh
uname -a;
sudo pacman -S virtualbox;
pamac build --no-confirm remotebox virtualbox-ext-oracle;
sudo usermod -aG vboxusers hasan;
```

## Eclipse

```sh
pamac build --no-confirm eclipse-avr;
sudo pacman -S --noconfirm avr-gdb;
sudo sed -i -e "s/Exec=eclipse/Exec=env GTK_THEME=:light eclipse/" \
	/usr/share/applications/eclipse.desktop
# eclipse -application org.eclipse.equinox.p2.director \
#     -repository http://download.eclipse.org/releases/2020-06 \
#     -installIU org.eclipse.cdt.feature.group;
# all_proxy=socks://localhost:9050 eclipse -application org.eclipse.equinox.p2.director \
#     -repository http://avr-eclipse.sourceforge.net/updatesite \
#     -installIU de.innot.avreclipse.feature.group;
sudo chmod +s /bin/avrdude;
```

## IntelliJ

```sh
pamac build --no-confirm intellij-idea-ultimate-edition intellij-idea-ultimate-edition-jre;
```

## nVidia

```sh
#sudo bat -Pp /etc/X11/xorg.conf.d/90-mhwd.conf;
sudo rm /etc/X11/xorg.conf.d/90-mhwd.conf;

#sudo bat -Pp /etc/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf;
echo \
'                                 
Section "ServerLayout"
    Identifier "layout"
    Option "AllowNVIDIAGPUScreens"
EndSection

Section "OutputClass"
    Identifier "intel"
    MatchDriver "i915"
    Driver "modesetting"
EndSection

Section "OutputClass"
    Identifier "nvidia"
    MatchDriver "nvidia-drm"
    Driver "nvidia"
    Option "PrimaryGPU" "yes"
    Option "AllowEmptyInitialConfiguration"
    ModulePath "/usr/lib/nvidia/xorg"
    ModulePath "/usr/lib/xorg/modules"
EndSection
' \
    | sudo tee /etc/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf;

#sudo bat -Pp /etc/modprobe.d/mhwd-gpu.conf;
sudo rm /etc/modprobe.d/mhwd-gpu.conf;

#sudo bat -Pp /etc/modprobe.d/nvidia.conf;
echo \
'
blacklist nouveau
blacklist nvidiafb
blacklist rivafb
' \
    | sudo tee /etc/modprobe.d/nvidia.conf;

#sudo bat -Pp /etc/modprobe.d/nvidia-drm.conf;
echo \
'
options nvidia_drm modeset=1
' \
    | sudo tee /etc/modprobe.d/nvidia-drm.conf;

## LightDM ####################################################################################################
#sudo bat -Pp /etc/lightdm/display_setup.sh
echo \
'                                 
#!/bin/sh
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
' \
    | sudo tee /etc/lightdm/display_setup.sh;
sudo chmod +x /etc/lightdm/display_setup.sh;

#sudo bat -Pp /etc/lightdm/lightdm.conf
sudo sed -i -e "s/#display-setup-script=/display-setup-script=\/etc\/lightdm\/display_setup.sh/" \
	/etc/lightdm/lightdm.conf;
###############################################################################################################

## GDM ########################################################################################################
echo \
'[Desktop Entry]
Type=Application
Name=Optimus
Exec=sh -c "xrandr --setprovideroutputsource modesetting NVIDIA-0; xrandr --auto"
NoDisplay=true
X-GNOME-Autostart-Phase=DisplayServer
' \
    | sudo tee /usr/share/gdm/greeter/autostart/optimus.desktop \
    | sudo tee /etc/xdg/autostart/optimus.desktop;
###############################################################################################################
```

## Compositor

```sh
rclone sync --progress google:.config/picom.conf ~/.config;
```

## Theme

```sh
pamac build --no-confirm whitesur-kvantum-theme-git whitesur-icon-theme-git whitesur-gtk-theme-git;
rclone sync --progress google:.config/Kvantum ~/.config/Kvantum;
```

## Login Page

```sh
sudo pacman -S --noconfirm numlockx;
sudo sed -i -e 's/^#greeter-setup-script=/greeter-setup-script=\/usr\/bin\/numlockx on/' \
	/etc/lightdm/lightdm.conf;
```

## Eagle

```sh
rclone sync --progress google:EAGLE ~/EAGLE;
pamac build --no-confirm eagle;
```

## Jupyter And Octave

```sh
sudo pacman -S --noconfirm jupyter-notebook octave
https_proxy=http://localhost:8118 pamac build --no-confirm jupyter-octave_kernel
jupyter notebook --notebook-dir=~/jupyter-workspace
```

## Pictures

```sh
rclone sync --progress google:Pictures ~/Pictures;
```

## Documents

```sh
rclone sync --progress google:Documents ~/Documents;
```

## Workspace

```sh
rclone sync --progress google:Workspace/statics ~/Workspace/statics;
```

## User bin

```sh
rclone sync --progress google:.local/bin ~/.local/bin;
chmod +x ~/.local/bin/*;
```

## PDF reader

```sh
sudo pacman -S --noconfirm okular
```