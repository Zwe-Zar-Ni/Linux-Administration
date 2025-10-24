# Serving Web Content

- Installing and configuring Apache
- Securing Apache with TLS
- Installing and configuring NGINX

## Installing and configuring Apache

```bash
sudo apt install apache2
```

### Main Apache configuration file

> /etc/apache2/apache2.conf

### Document root

> /var/www/html

## Virtual hosts

> serve multiple websites from a single server. Each virtual host consists of an individual configuration file, which differentiates itself based on either name or IP address.
> stored in the /etc/apache2/sites-available directory
> .conf files
> Each configuration file would include a <VirtualHost> stanza.

### Basic workflow for setting up a new site (virtual host)

- The web developer creates the website and related files
- These files are uploaded to Ubuntu Server, typically in a subdirectory of /var/www or another
  directory the administrator has chosen
- After adding the necessary files into the Document Root directory, the administrator will make
  sure that the www-data user owns all of the files within
- The server administrator creates a configuration file for the site and copies it into the /etc/
  apache2/sites-available directory
- The administrator enables the site and reloads Apache

### a2ensite for enabling a site

```bash
sudo a2ensite exmaple.com.conf
sudo systemctl reload apache2
# creates a symbolic link to that file and stores it in the /etc/apache2/ sites-enabled directory
```

### a2dissite for disabling a site

```bash
sudo a2dissite exmaple.com.conf
sudo systemctl reload apache2
# symbolic link is removed. The file is no longer served.
```

## Securing Apache with TLS

> Alternative : Secure Sockets Layer (SSL)
> a method of utilizing cryptography by installing signed certificates that protect and encrypt web traffic.
> encrypt and make the site available over HTTPS.

> By default, Ubuntu’s Apache configuration listens for traffic on port 80, but not port 443 (HTTPS).

```bash
sudo ss -tulpn | grep apache
```

! Needs to learn more

## Installing and configuring NGINX

```bash
sudo apt install nginx
```
