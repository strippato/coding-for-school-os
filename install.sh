#!/bin/sh

if [ $USER != "root" ]; then
   echo "Devi sudare per essere root"
   exit
fi

echo "Copy icons pack..."
rm -rf /usr/share/icons/coding-for-school
cp -R ./cfs-ui/icons/coding-for-school/ /usr/share/icons/

echo "Copy theme pack..."
rm -rf /usr/share/themes/coding-for-school
cp -R ./cfs-ui/themes/coding-for-school/ /usr/share/themes/

echo "Copy artwork pack..."
rm -rf /usr/share/coding-for-school
cp -R ./cfs-ui/artwork/coding-for-school/* /usr/share/coding-for-school/

echo "Set correct shutdown icon for panel"
sed -i 's/gnome-logout/system-shutdown-panel/g' /usr/share/applications/lxde-logout.desktop 

echo "Remove desktop icons"
rm -f /home/pi/Desktop/debian-reference-common.desktop
rm -f /home/pi/Desktop/idle*
rm -f /home/pi/Desktop/shutdown.desktop
rm -f /home/pi/Desktop/python-games.desktop
rm -f /home/pi/Desktop/minecraft-pi.desktop 
rm -f /home/pi/Desktop/lxterminal.desktop 
rm -f /home/pi/Desktop/wolfram-*
rm -f /home/pi/Desktop/ocr_resources.desktop
rm -f /home/pi/Desktop/epiphany-browser.desktop 

echo "Setting wallpaper" 
su -l pi -c "pcmanfm --set-wallpaper /usr/share/coding-for-school/wallpapers/cfs-wallpaper.png"

#echo "Install pavucontrol"
#apt-get install -y pavucontrol

echo "Togliere l'icona screenlock dal pannello"
echo "1. Tasto destro sull'icona"
echo "2. Impostazioni pannello"
echo "3. In scheda Applet pannello scegliere barra avvio applicazioni (ultima)"
echo "4. Cliccare Modifica"
echo "5. Rimuovere Screenlock"
echo "6. Rimuovere Workspace selector"

