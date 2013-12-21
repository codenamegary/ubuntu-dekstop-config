# PHP / Web Dev Installer for Ubuntu Desktop 12.04 LTS

This script can be run on Ubuntu Desktop 12.04 to automatically install all of the components needed to have a beautiful and fully functional Desktop IDE environment for PHP and web development.

![screenshot](https://raw.github.com/guari/eclipse-ui-theme/master/com.github.eclipseuitheme.themes.plugin/screenshot/screenshot-ubuntu_v0.8.2.png)

## How-To

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
  * NodeJS / NPM - Latest from PPA, grunt-cli installed globally
  * MySQL Workbench 6.0.8
  * Git
  * OpenJDK 7
  * CURL
  * Build Essentials
  * Chromium Web Browser

