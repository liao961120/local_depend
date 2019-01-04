alias app_link='xdg-open /usr/share/applications/'
alias dict='goldendict'
alias r='Rscript -e' #Note capital 'R' is for running R in bash
alias render_rmdbk='~/bin/render_rmarkdown_book'
alias rmdbk='xdg-open ~/Rmd_ref'
alias mypython='code ~/private_repo/python/python_notes.Rmd'
alias new_rmd='~/bin/append_head_rmd'
alias R='R --no-save -q'
alias pyvir='source bin/activate'
alias xampp='sudo /opt/lampp/manager-linux-x64.run'
alias serve='chromium-browser "http://127.0.0.1:4000"; bundle exec jekyll serve --drafts'

export RSTUDIO_PANDOC=/usr/lib/rstudio/bin/pandoc
PS1="\[\033[1;32m\]\u@nb:\[\033[1;34m\]\w\[\033[00m\]$ "
export PS1
export PATH=~/bin:"$PATH"  #Add ~/bin to PATH so custom shell programs can be found
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH

# Define variables for SSH remote pc.
### Reads IP from git repo ~/local_depend/hostname/hostname.txt ###

rm_MAC="44:87:fc:a1:0b:cc" #MAC address of remote pc
rm_ip="`head -1 ~/local_depend/hostname/hostname.txt`" #Now floating IP, needs to change to static
rm_ip_b=`bash ~/ip2ipb.sh $rm_ip` #see 'ip2ipb.sh for detail'
ssh_pc="liao961120@$rm_ip"  #used as 'ssh $ssh_pc'

# CSV viewer
function csv_viewer {
    perl -pe 's/((?<=,)|(?<=^)),/ ,/g;' "$@" | column -t -s, | less  -F -S -X -K
}

# TSV viewer
function tsv_viewer {
    perl -pe 's/((?<=\t)|(?<=^))\t/ \t/g;' "$@" | column -t -s $'\t' | less  -F -S -X -K
}

# timer
function timer(){
  date1=`date +%s`; 
   while true; do 
    echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r"; 
    sleep 0.1
   done
}


# Backup ~/bin (Custom shell programs)
cp -r ~/bin/* ~/local_depend/Ubuntu_16.04_setup/sh_program_bak/

# Backup self-defined cmd in git repo (prt lines after 'line 120')
tail -n +120  ~/.bashrc > ~/local_depend/Ubuntu_16.04_setup/mybashrc.sh
alias bak_rc='tail -n +120  ~/.bashrc > ~/local_depend/Ubuntu_16.04_setup/mybashrc_man.sh; echo -e "\n\n\n#### Backup Time\t$(date) ####" >> ~/local_depend/Ubuntu_16.04_setup/mybashrc_man.sh'
