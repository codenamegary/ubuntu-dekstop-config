# PHP / Web Dev Installer for Ubuntu Desktop 12.04 LTS

This script can be run on Ubuntu Desktop 12.04 to automatically install all of the components needed to have a beautiful and fully functional Desktop IDE environment for PHP and web development.

![screenshot](https://raw.github.com/guari/eclipse-ui-theme/master/com.github.eclipseuitheme.themes.plugin/screenshot/screenshot-ubuntu_v0.8.2.png)

## How-To

If you're already familiar with installing Ubuntu just skip to step 3.

### Step 1 - Install Ubuntu

* Good instructions for creating a bootable USB installer on Windows can be found here - http://www.ubuntu.com/download/desktop/create-a-usb-stick-on-windows
* Note that the Pen Drive Linux USB Installer can automagically download the ISO image for you, no need to download it in advance

### Step 2 - Apply Updates

* Boot your new Ubuntu install, wait a few minutes, software updates should popup, install them
  * Note: If software update prompt does not show up, ensure you are connected to a network and stop being so impatient
* Reboot
* Wait for a few minutes and install additional drivers for video etc. if prompted
  * Note: If not prompted, go into system settings and click on the "additional drivers" icon
* Reboot
* Potentially experience video driver issues
* Possibly Google and muck around with Video drivers for an hour and wonder why you're doing this
* Contemplate going back to Windows
* Fix video driver issues, feel better

### Step 3 - Run The Script

Copy and paste the following command inside a terminal.

```
wget https://raw.github.com/codenamegary/ubuntu-php-webdev-installer/master/install.sh -P ~/ && chmod +x ~/install.sh && ~/install.sh
```

## What You Get

* Eclipse
  * Aptana Studio 3 PHP Plugin - http://www.aptana.com/products/studio3
  * Moonrise Dark Theme - https://github.com/guari/eclipse-ui-theme
  * PSR-1 Compliant code formatter (CTRL+SHIFT+F in IDE to auto format a file to PSR-1 spec)
  * Auto-complete for PHP 5.4 and earlier
* MySQL Server
  * Latest available from PPA for 12.04
  * Will prompt for root password
* PHP 5.4
  * With mcrypt, pdo, pdo_mysql, xcache and xdebug enabled
  * From https://sury.org/ - ppa:ondrej/php5-oldstable
  * Latest version of composer installed globally, just run "composer" from anywhere
* Apache 2.2.22
  * Rewrite and other common mods enabled
  * From https://sury.org/ - ppa:ondrej/php5-oldstable
* Various dev tools
  * NodeJS / NPM - Latest from PPA, grunt-cli installed globally, because your front end guys think they are Twitter Bootstrap and need a billion node modules to compile 200 lines of JavaScript and 1 stylesheet.
  * MySQL Workbench 6.0.8 - For doing architecty and diagramy things with models and also editing the database manually because the POS framework used in the horrid project you just inherited has no support for any type of migration or other sane method of controlling schema changes.
  * Git - To put your code somewhere safe, the douchebag that worked here before you got fired because he stored everything in a zip file on a server in the janitor's closet and it exploded. Don't be that guy.
  * OpenJDK 7 - Because Java.
  * CURL - Looking at web pages on command line is t3h fun!
  * Build Essentials - When I'm bored, I like to compile things and pretend I'm a real programmer.
  * Chromium Web Browser - Dare to be different.
  * Gimp - For expropriating pieces of the amazing mockups the client's print shop sent over which all contain a million layers and are designed to go on a 3"x5" post card.

