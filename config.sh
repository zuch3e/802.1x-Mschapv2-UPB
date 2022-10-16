#Script bash pentru conectarea 802.1x MSCHAPV2 
echo "Script initial creat de @dariusiurca, modificat ulterior de zuch3e"
echo "Rulati acest script pe propria raspundere si va asumati faptul ca poate dauna echipamentului"
echo -e "Daca doriti sa continuati, apasati Enter"
read ans
opkg update
opkg install nano
opkg remove wpad-mini
opkg remove wpad
opkg install luci-ssl-nginx
opkg install --force-depends --force-depends --force-maintainer --force-overwrite wpad-openssl
opkg update
/etc/init.d/wpa-autostart stop
/etc/init.d/wpa-autostart disable
rm -rf /etc/config/wpa.conf
rm -rf /etc/init.d/wpa-autostart
echo -e "Username cont MyUPB (ex:nume.prenume@stud.acs.upb.ro): "
read email
echo -e "Parola cont MyUPB: "
read password
cd /etc/config/
cat > wpa.conf <<EOF
ctrl_interface=/var/run/wpa_supplicant
ap_scan=0
network=
{
key_mgmt=IEEE8021X
eap=PEAP
identity="$email"
password="$password"
phase2="auth=MSCHAPV2"
priority=2
}
EOF
 echo -e "ID interfata WAN din openwrt(de obicei eth0.1/eth0.2): "
 read interfata
 cd /etc/init.d/
 cat > wpa-autostart <<EOF
START=99

start() {
echo start
wpa_supplicant -D wired -i $interfata -c /etc/config/wpa.conf &
}
EOF
 echo "Conectati cablul de internet in portul WAN al router-ului (daca acesta nu este conectat deja)"
 echo -e "Pentru a continua apasati ENTER"
 read con
 ifdown $interfata
 ifup $interfata
 chmod +x /etc/init.d/wpa-autostart
 /etc/init.d/wpa-autostart enable
 /etc/init.d/wpa-autostart start
 reboot
 echo "Succes." 
fi