#!/bin/bash
#based on https://github.com/nahamsec/bbht
sudo apt -y update
sudo apt -y upgrade


echo "installing bash_profile aliases from recon_profile"
git clone https://github.com/nahamsec/recon_profile.git
cd recon_profile
cat bash_profile >> ~/.bash_profile
source ~/.bash_profile
cd ~/tools/
echo "done"


#install go
if [[ -z "$GOPATH" ]];then
echo "It looks like go is not installed, would you like to install it now"
PS3="Please select an option : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
        case $choice in
                yes)

					echo "Installing Golang"
					#wget https://golang.org/dl/go1.15.7.linux-amd64.tar.gz
					#sudo tar -xvf go1.15.7.linux-amd64.tar.gz
					#sudo mv go /usr/local
					sudo apt install -y golang
					export GOROOT=/usr/local/go
					export GOPATH=$HOME/go
					export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
					echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
					echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
					echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile	
					source ~/.bash_profile
					sleep 1
					break
					;;
				no)
					echo "Please install go and rerun this script"
					echo "Aborting installation..."
					exit 1
					;;
	esac	
done
fi


#Don't forget to set up AWS credentials!
echo "Don't forget to set up AWS credentials!"
apt install -y awscli
echo "Don't forget to set up AWS credentials!"



#create a tools folder in ~/
mkdir ~/tools
cd ~/tools/

#install aquatone
echo "Installing Aquatone \n github.com/michenriksen/aquatone"
go get github.com/michenriksen/aquatone
echo "done"

#install chromium
echo "Installing Chromium"
sudo snap install chromium
echo "done"


echo "installing JSParser \n https://github.com/nahamsec/JSParser.git"
git clone https://github.com/nahamsec/JSParser.git
cd JSParser*
sudo python setup.py install
cd ~/tools/
echo "done"


echo "installing Sublist3r \n https://github.com/aboul3la/Sublist3r.git"
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r*
pip install -r requirements.txt
cd ~/tools/
echo "done"


echo "installing teh_s3_bucketeers \n https://github.com/tomdev/teh_s3_bucketeers.git"
git clone https://github.com/tomdev/teh_s3_bucketeers.git
cd ~/tools/
echo "done"


echo "installing dirsearch \n https://github.com/maurosoria/dirsearch.git"
git clone https://github.com/maurosoria/dirsearch.git
cd ~/tools/
echo "done"


echo "installing lazys3 \n https://github.com/nahamsec/lazys3.git"
git clone https://github.com/nahamsec/lazys3.git
cd ~/tools/
echo "done"

echo "installing virtual host discovery \n https://github.com/jobertabma/virtual-host-discovery.git"
git clone https://github.com/jobertabma/virtual-host-discovery.git
cd ~/tools/
echo "done"


echo "installing knock.py \n https://github.com/guelfoweb/knock.git"
git clone https://github.com/guelfoweb/knock.git
cd ~/tools/
echo "done"


echo "installing lazyrecon \n https://github.com/nahamsec/lazyrecon.git"
git clone https://github.com/nahamsec/lazyrecon.git
cd ~/tools/
echo "done"

echo "installing nmap"
sudo apt install -y nmap
echo "done"


echo "installing asnlookup\n https://github.com/yassineaboukir/asnlookup.git"
git clone https://github.com/yassineaboukir/asnlookup.git
cd ~/tools/asnlookup
pip install -r requirements.txt
cd ~/tools/
echo "done"


echo "installing httprobe \n github.com/tomnomnom/httprobe"
go get -u github.com/tomnomnom/httprobe 
echo "done"


echo "installing unfurl \n github.com/tomnomnom/unfurl"
go get -u github.com/tomnomnom/unfurl 
echo "done"


echo "installing waybackurls \n github.com/tomnomnom/waybackurls"
go get github.com/tomnomnom/waybackurls
echo "done"


echo "installing crtndstry \n\ https://github.com/nahamsec/crtndstry.git"
git clone https://github.com/nahamsec/crtndstry.git
echo "done"


echo "downloading Seclists \n https://github.com/danielmiessler/SecLists.git"
cd ~/tools/
git clone https://github.com/danielmiessler/SecLists.git
cd ~/tools/SecLists/Discovery/DNS/
##THIS FILE BREAKS MASSDNS AND NEEDS TO BE CLEANED
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
cd ~/tools/
echo "done"


echo "installing  PEAS Suite \n https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git"
cd ~/tools/
git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git
echo "done"


echo "installing github-search \n https://github.com/gwen001/github-search.git"
cd ~/tools/
git clone https://github.com/gwen001/github-search.git


echo -e "\n\n\n\n\n\n\n\n\n\n\nDone! All tools are set up in ~/tools"
ls -la
echo "One last time: don't forget to set up AWS credentials in ~/.aws/!"
echo "TODO: For Nuclei - Download latest binary from https://github.com/projectdiscovery/nuclei/releases"
