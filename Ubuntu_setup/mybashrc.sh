alias app_link='xdg-open /usr/share/applications/'
alias dict='goldendict'
alias r='Rscript -e' #Note capital 'R' is for running R in bash
alias render_rmdbk='~/bin/render_rmarkdown_book'
alias rmdbk='xdg-open ~/Rmd_ref'
alias mypython='code ~/private_repo/python/python_notes.Rmd'
alias new_rmd='~/bin/append_head_rmd'
alias R='R --no-save -q'
alias r="radian"
#alias pyvir='cd ~/jupyter; source bin/activate; cd -'
alias xampp='sudo /opt/lampp/manager-linux-x64.run'
alias serve_j='chromium-browser "http://127.0.0.1:4000"; bundle exec jekyll serve --drafts'
alias ipython='ipython --no-autoindent'
alias serve='chromium-browser "http://0.0.0.0:8000/"; python3 -m http.server'
alias micro='~/micro'
alias bitly='chromium-browser --incognito https://bitly.com &'
alias pdf_resize='java -jar Desktop/briss-0.9/briss-0.9.jar'
alias gephi='~/Desktop/SNA/gephi-0.9.2/bin/gephi'
alias lopessh='ssh yongfu@140.112.147.125'
alias pandoc='/usr/lib/rstudio/bin/pandoc/pandoc'
alias loderunner='bash ~/Desktop/LODERUNN/LODERUNN'
alias slp='systemctl suspend'
alias psudow='python3 ~/Desktop/psudoword_gen.py'
alias open='xdg-open'

export RSTUDIO_PANDOC=/usr/lib/rstudio/bin/pandoc
PS1="\[\033[1;32m\]\u@nb:\[\033[1;34m\]\w\[\033[00m\]$ "
export PS1
export PATH=~/bin:"$PATH"  #Add ~/bin to PATH so custom shell programs can be found
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH
export FLASK_APP=application.py
export FLASK_DEBUG=1



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
:

# pyvir
function pyvir(){
  if [[ $1 == '3.6' ]]; then
    dir='/home/liao/jupyter'
  else
    dir='/home/liao/py3.7'
  fi
  
  ori_dir=`pwd`
  cd $dir
  source bin/activate
  cd $ori_dir
}

# bris
#java -jar briss-0.9.jar xx.pdf
function briss(){
  java -jar ~/Desktop/briss-0.9/briss-0.9.jar ${1}
}


# Backup ~/bin (Custom shell programs)
cp -r ~/bin/* ~/local_depend/Ubuntu_setup/sh_program_bak/

# Backup self-defined cmd in git repo (prt lines after 'line 120')
tail -n +120  ~/.bashrc > ~/local_depend/Ubuntu_setup/mybashrc.sh
alias bak_rc='tail -n +120  ~/.bashrc > ~/local_depend/Ubuntu_setup/mybashrc_man.sh; echo -e "\n\n\n#### Backup Time\t$(date) ####" >> ~/local_depend/Ubuntu_setup/mybashrc_man.sh'

# added by travis gem
[ -f /home/liao/.travis/travis.sh ] && source /home/liao/.travis/travis.sh

if [ $TILIX_ID ] || [ $VTE_VERSION ] ; then source /etc/profile.d/vte.sh; fi # Ubuntu Budgie END

cd ~
