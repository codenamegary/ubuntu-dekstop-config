# Install script for various standard web dev things.

# chmod +x and then run

$LOG = config.log

echo "--------------------------------------"
echo "| Starting installs... "
echo "--------------------------------------"

# Build Essentials (in case we want to compile anything later)
echo "Build Essentials (this may take awhile)..."
sudo apt-get -y install build-essential > /dev/null

# CURL
echo "CURL..."
sudo apt-get -y install curl > /dev/null

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
if [ ! -f ~/Downloads/mysql-workbench-community-6.0.8-1ubu1204-amd64.deb ]; then
    echo " | Downloading..."
    wget --quiet "http://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community-6.0.8-1ubu1204-amd64.deb" -P ~/Downloads > /dev/null
fi
echo " | Installing dependencies..."
sudo dpkg -i ~/Downloads/mysql-workbench-community-6.0.8-1ubu1204-amd64.deb > /dev/null
sudo apt-get -y -f install > /dev/null
echo " | Installing workbench..."
sudo dpkg -i ~/Downloads/mysql-workbench-community-6.0.8-1ubu1204-amd64.deb > /dev/null

# Eclipse
echo "Eclipse 4.3.1 Kepler..."
if [ ! -f ~/Downloads/eclipse-standard-kepler-SR1-linux-gtk-x86_64.tar.gz ]; then
    echo " | Downloading (this may take awhile)..."
    wget --quiet "http://mirror.csclub.uwaterloo.ca/eclipse/technology/epp/downloads/release/kepler/SR1/eclipse-standard-kepler-SR1-linux-gtk-x86_64.tar.gz" -P ~/Downloads > /dev/null
fi
echo " | Extracting and installing to /opt/eclipse..."
sudo tar -xvf ~/Downloads/eclipse-standard-kepler-SR1-linux-gtk-x86_64.tar.gz -C /opt > /dev/null
echo " | Aptana plugin (RC for PHP 5.4 support, may take a moment)..."
/opt/eclipse/eclipse \
-application org.eclipse.equinox.p2.director \
-noSplash \
-repository \
http://preview.appcelerator.com/aptana/studio3/plugin/update/rc \
-installIUs \
com.aptana.feature.studio.feature.group,\
com.aptana.php.feature.feature.group,\
com.aptana.pydev.feature.feature.group,\
org.radrails.rails.feature.group,\
com.aptana.feature.feature.group,\
com.aptana.ide.feature.libraries.subscription.feature.group,\
com.aptana.webkitbrowser.feature.group > /dev/null
echo " | Installing eclipse.desktop..."
sudo wget --quiet "https://raw.github.com/codenamegary/ubuntu-dekstop-config/master/eclipse.desktop" -P /usr/share/applications > /dev/null

# SyncDrive (Google Drive, DropBox, etc.)
echo "SyncDrive (Google Drive, DropBox, etc.)..."
sudo add-apt-repository -y ppa:noobslab/pear-apps > /dev/null
sudo apt-get update > /dev/null
sudo apt-get -y install syncdrive > /dev/null

# MySQL Server
echo "MySQL Server..."
sudo apt-get install mysql-server

# PHP 5.4 / Apache2 PPA for Ubuntu 12.04 LTS
echo "PHP 5.4 old-stable PPA repos..."
sudo apt-add-repository -y ppa:ondrej/php5-oldstable > /dev/null
sudo apt-get update > /dev/null
echo " | PHP..."
sudo apt-get install php5
echo " | mcrypt..."
sudo apt-get install php5-mcrypt
echo " | xcache..."
sudo apt-get install php5-xcache
echo " | pdo mysql..."
sudo apt-get install php5-mysql
echo " | xdebug..."
sudo apt-get install php5-xdebug
