alias app_link='xdg-open /usr/share/applications/'
alias screen_shot='xdg-open ~/Pictures/'
alias cp_rmd='cp ~/local_depend/GitHubPage/my_R_book/Rmarkdown_features/rmd_features.html ~/liao961120.github.io/notes/rmd_features.html; cp ~/local_depend/GitHubPage/my_R_book/Rmarkdown_features/beamer/beamer.pdf ~/liao961120.github.io/notes/beamer.pdf'
alias timecal='bash ~/sh_program/time_cal.sh'
alias dict='goldendict'
alias mylinux='vim ~/local_depend/Ubuntu_16.04_setup/mylinux.Rmd'
export RSTUDIO_PANDOC=/usr/lib/rstudio/bin/pandoc
PS1="\[\033[1;32m\]\u@nb:\[\033[1;34m\]\w\[\033[00m\]$ "
export PS1

# Define variables for SSH remote pc.
### Reads IP from git repo ~/local_depend/hostname/hostname.txt ###

rm_MAC="44:87:fc:a1:0b:cc" #MAC address of remote pc
rm_ip="`head -1 ~/local_depend/hostname/hostname.txt`" #Now floating IP, needs to change to static
rm_ip_b=`bash ~/ip2ipb.sh $rm_ip` #see 'ip2ipb.sh for detail'
ssh_pc="liao961120@$rm_ip"  #used as 'ssh $ssh_pc'


# Backup self-defined cmd in git repo (prt lines after 'line 120')
tail -n +120  ~/.bashrc > ~/local_depend/Ubuntu_16.04_setup/mybashrc.sh
