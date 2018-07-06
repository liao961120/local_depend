######### Install R + RStudio on Ubuntu 16.04 ###############

#sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

# Ubuntu 12.04: precise
# Ubuntu 14.04: trusty
# Ubuntu 16.04: xenial

# /etc/apt/sources.list
# Basic format of next line deb https://<my.favorite.cran.mirror>/bin/linux/ubuntu <enter your ubuntu version>/
# Use Rstudio mirror

sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu xenial/'


### On Ubuntu 18.04, skip steps above (5/20 2018)
sudo apt-get update
sudo apt-get install r-base
sudo apt-get install r-base-dev


### Install Rstudio with GUI method

# Download and Install RStudio from
# https://download1.rstudio.org/rstudio-xenial-1.1.447-amd64.deb
#sudo apt-get install gdebi-core
#wget https://download1.rstudio.org/rstudio-xenial-1.1.447-amd64.deb
#sudo gdebi rstudio-xenial-1.1.447-amd64.deb
#rm rstudio-xenial-1.1.447-amd64.deb


######### Install pdflatex (for knitting PDF_documents) ###########

sudo apt-get install texlive-latex-base

## additional packages
sudo apt-get install texlive-fonts-recommended
sudo apt-get install texlive-fonts-extra
sudo apt-get install texlive-latex-extra

sudo apt-get install texlive-xetex # xelatex engine
sudo apt-get install texlive-lang-chinese # for chinese
