# 802.1x-Mschapv2-UPB
Script bash-openwrt pentru conectarea la internetul din campusul Regie 

Scriptul este predominant al (@DariusIurca) si modificat de mine pentru conflictele generate de pachetul open-ssl.

Aveti nevoie de un router compatibil cu sistemul de operare OpenWRT (puteti verifica aici : https://openwrt.org/toh/start ) Veti conecta routerul la laptop/desktop printr-un cablu ethernet in unul din porturile LAN (pentru a evita instabilitati la wifi in timpul instalarii openwrt si configurarii acestuia).

Dupa instalarea OpenWRT pe routerul dvs. Va trebui sa faceti un hotspot de pe telefon pentru a putea descarca update-urile si script-ul pe router.In sectiunea Network->Wireless veti apasa butonul de Scan al modulului wireless( de preferat cel de 2.4Ghz pentru configurare ). Urmeaza sa vedeti toate retelele wireless disponibilie urmand sa va conectati la hotspot-ul facut mai devreme.

In continuare veti deschide un terminal/command prompt si veti introduce comanda "ssh root@192.168.1.1" pentru a va conecta la routerul dvs. unde veti introduce urmatoarea comanda:

cd ~ | wget https://raw.githubusercontent.com/zuch3e/802.1x-Mschapv2-UPB/main/config.sh | chmod 777 config.sh | ./config.sh |
