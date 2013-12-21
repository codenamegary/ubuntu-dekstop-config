# Install script for various standard web dev things.

# chmod +x and then run
echo "_________________________________________________________"
echo "UBUNTU PHP WEB-DEV INSTALLER FOR UBUNTU DESKTOP 12.04 LTS"
echo "---------------------------------------------------------"
echo 
echo " FOR MORE INFORMATION AND LATEST REVISIONS SEE:"
echo 
echo "  https://github.com/codenamegary/ubuntu-php-webdev-installer"
echo 
echo "--------------------------------------"
echo "| Starting installs... "
echo "--------------------------------------"

# Build Essentials (in case we want to compile anything later)
echo "| Build Essentials (this may take awhile)..."
sudo apt-get -y install build-essential > /dev/null

# CURL
echo "| CURL..."
sudo apt-get -y install curl > /dev/null

# Chromium Browser
echo "| Chromium..."
sudo apt-get -y install chromium-browser > /dev/null

# GIT
echo "| Git..."
sudo apt-get -y install git > /dev/null

# JDK
echo "| Open JDK 7..."
sudo apt-get -y install openjdk-7-jdk > /dev/null

# MySQL Workbench
echo "| MySQL Workbench 6.0.8..."
if [ -f /usr/bin/mysql-workbench ]
then
    echo " -| Already installed, skipping..."
else
    echo " -| Downloading..."
    wget --quiet "http://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community-6.0.8-1ubu1204-amd64.deb" -P ~/Downloads > /dev/null
    echo " -| Installing dependencies..."
    sudo dpkg -i ~/Downloads/mysql-workbench-community-6.0.8-1ubu1204-amd64.deb > /dev/null
    sudo apt-get -y -f install > /dev/null
    echo " -| Installing workbench..."
    sudo dpkg -i ~/Downloads/mysql-workbench-community-6.0.8-1ubu1204-amd64.deb > /dev/null
fi

# Eclipse
echo "| Eclipse 4.3.1 Kepler..."
if [ -d /opt/eclipse ]
then
    echo " -| Already installed, skipping..."
else
    echo " -| Downloading (this may take awhile)..."
    wget --quiet "http://mirror.csclub.uwaterloo.ca/eclipse/technology/epp/downloads/release/kepler/SR1/eclipse-standard-kepler-SR1-linux-gtk-x86_64.tar.gz" -P ~/Downloads > /dev/null
    echo " -| Extracting and installing to /opt/eclipse..."
    sudo tar -xvf ~/Downloads/eclipse-standard-kepler-SR1-linux-gtk-x86_64.tar.gz -C /opt > /dev/null
    echo " -| Aptana plugin (RC for PHP 5.4 support, may take a moment)..."
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
    echo " | Installing Eclipse Monrise Dark Theme...."
    /opt/eclipse/eclipse \
    -application org.eclipse.equinox.p2.director \
    -noSplash \
    -repository \
    https://raw.github.com/guari/eclipse-ui-theme/master/com.github.eclipseuitheme.themes.updatesite \
    -installIUs \
    com.github.eclipseuitheme.themes.feature.feature.group > /dev/null
    if [ ! -f /usr/share/applications/eclipse.desktop ]; then
        echo " -| Installing eclipse.desktop..."
        sudo wget --quiet "https://raw.github.com/codenamegary/ubuntu-php-webdev-installer/master/eclipse.desktop" -P /usr/share/applications > /dev/null
    fi
    if [ ! -d ~/workspace ]; then
        echo " -| Downloading default workspace with UI and theme settings..."
        wget --quiet "https://raw.github.com/codenamegary/ubuntu-php-webdev-installer/master/workspace.tar.gz" -P ~/Downloads > /dev/null
        echo " -| Extracting and installing default workspace..."
        tar -xvf ~/Downloads/workspace.tar.gz -C ~/ > /dev/null
    fi
fi

# SyncDrive (Google Drive, DropBox, etc.)
echo "| SyncDrive (Google Drive, DropBox, etc.)..."
if [ -f /usr/bin/syncdrive ]
then
    echo " -| Already installed, skipping..."
else
    sudo add-apt-repository -y ppa:noobslab/pear-apps > /dev/null
    sudo apt-get update > /dev/null
    sudo apt-get -y install syncdrive > /dev/null
fi

# MySQL Server
echo "| MySQL Server..."
if [ -f /usr/bin/mysql ]
then
    echo " -| Already installed, skipping..."
else
    sudo apt-get -y install mysql-server > /dev/null
fi

# Latest NodeJS from PPA...
echo "| Node.js..."
if [ -f /usr/bin/npm ]
then
    echo " -| Already installed, skipping..."
else
    echo " -| Installing dependencies..."
    sudo apt-get -y install python-software-properties python g++ make > /dev/null
    echo " -| Adding sources..."
    sudo add-apt-repository -y ppa:chris-lea/node.js > /dev/null
    echo " -| Updating sources..."
    sudo apt-get update > /dev/null
    echo " -| Installing..."
    sudo apt-get -y install nodejs > /dev/null
fi

# PHP 5.4 / Apache2 PPA for Ubuntu 12.04 LTS
echo "| PHP 5.4 old-stable PPA repos..."
if [ -f /usr/bin/php5 ]
then
    echo " -| Already installed, skipping..."
else
    sudo apt-add-repository -y ppa:ondrej/php5-oldstable > /dev/null
    sudo apt-get update > /dev/null
    echo " -| PHP..."
    sudo apt-get -y install php5 > /dev/null
    echo " -| mcrypt..."
    sudo apt-get -y install php5-mcrypt > /dev/null
    echo " -| xcache..."
    sudo apt-get -y install php5-xcache > /dev/null
    echo " -| pdo mysql..."
    sudo apt-get -y install php5-mysql > /dev/null
    echo " -| xdebug..."
    sudo apt-get -y install php5-xdebug > /dev/null
    echo " -| Replacing default index.html in favour of a phpinfo page..."
    sudo wget --quiet "https://raw.github.com/codenamegary/ubuntu-php-webdev-installer/master/index.php" -P /var/www > /dev/null
    sudo rm /var/www/index.html
    echo " -| Dat php..."
    echo "  --------------------------------------"
    php -v
    echo "  --------------------------------------"
fi

echo 
echo "--------------------------------------"
echo "| All done! Launching http://localhost"
echo "--------------------------------------"

firefox http://localhost
