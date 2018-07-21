alias app_link='xdg-open /usr/share/applications/'
alias timecal='bash ~/sh_program/time_cal.sh'
alias dict='goldendict'
alias mylinux='vim ~/local_depend/Ubuntu_16.04_setup/mylinux.Rmd'
alias render_mylinux='bash ~/sh_program/render_mylinux.sh'
alias r='Rscript -e' #Note capital 'R' is for running R in bash
alias render_rmdbk='bash ~/sh_program/render_rmarkdown_book.sh'
alias rmdbk='vim ~/local_depend/GitHubPage/my_R_book/Rmarkdown_features/rmd_features.rmd'
alias new_rmd='bash ~/sh_program/append_head_rmd.sh'

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
alias bak_rc='tail -n +120  ~/.bashrc > ~/local_depend/Ubuntu_16.04_setup/mybashrc_man.sh; echo -e "\n\n\n#### Backup Time\t$(date) ####" >> ~/local_depend/Ubuntu_16.04_setup/mybashrc_man.sh'
# Backup ~/sh_program
cp -r ~/sh_program ~/local_depend/Ubuntu_16.04_setup/sh_program_bak




#### Backup Time	Sat Jul 21 12:15:55 CST 2018 ####
