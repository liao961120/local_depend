cd ~/local_depend/hostname
echo -e `hostname -I`'\n'liao@pc'\n'`date` > /home/liao961120/local_depend/hostname/hostname.txt
git add hostname.txt
git commit -m "new ip"
git push origin master
