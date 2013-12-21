# Install script for various standard web dev things.

# chmod +x and then run

$LOG = config.log

echo "--------------------------------------"
echo "| Starting installs... "
echo "--------------------------------------"

# CURL
echo "CURL..."
sudo apt-get -y install curl > /dev/null

# Build Essentials (in case we want to compile anything later)
echo "Build Essentials (this may take awhile)..."
sudo apt-get -y install build-essential > /dev/null

# Chromium Browser
echo "Chromium..."
sudo apt-get -y install chromium-browser > /dev/null

# GIT
echo "Git..."
sudo apt-get -y install git > /dev/null

# JDK
echo "Open JDK 7..."
sudo apt-get -y install openjdk-7-jdk > /dev/null

# MySQL Workbench
echo MySQL Workbench 6.0.8...
echo " | Downloading..."
sudo wget --quiet "http://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community-6.0.8-1ubu1204-amd64.deb" -P ~/Downloads > /dev/null
echo " | Installing dependencies..."
sudo dpkg -i ~/Downloads/mysql-workbench-community-6.0.8-1ubu1204-amd64.deb > /dev/null
sudo apt-get -y -f install > /dev/null
echo " | Installing workbench..."
sudo dpkg -i ~/Downloads/mysql-workbench-community-6.0.8-1ubu1204-amd64.deb > /dev/null

# PHP 5.4 / Apache2 PPA for Ubuntu 12.04 LTS
echo PHP 5.4 old-stable PPA repos...
sudo apt-add-repository -y ppa:ondrej/php5-oldstable > /dev/null
sudo apt-get update > /dev/null

# Eclipse
echo "Eclipse 4.3.1 Kepler..."
echo " | Downloading (this may take awhile)..."
sudo wget --quiet "http://mirror.csclub.uwaterloo.ca/eclipse/technology/epp/downloads/release/kepler/SR1/eclipse-standard-kepler-SR1-linux-gtk-x86_64.tar.gz" -P ~/Downloads > /dev/null
echo " | Extracting..."
sudo tar -xvf ~/Downloads/eclipse-standard-kepler-SR1-linux-gtk-x86_64.tar.gz > /dev/null
echo " | Moving to /opt..."
sudo mv ~/Downloads/eclipse /opt/eclipse
echo " | Installing eclipse.desktop"

