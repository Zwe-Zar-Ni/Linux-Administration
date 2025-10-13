# Managing Software Packages

- Understanding Linux package management
- Understanding the differences between Debian and Snap packages
- Installing and removing software
- Searching for packages
- Managing package repositories
- Backing up and restoring Debian packages
- Cleaning up orphaned APT packages
- Taking advantage of hardware enablement updates

## Managing Debian Packages with apt (Advanced Package Tool)

### Searching for Packages

```bash
apt search <search term>
```

### View More Information

```bash
apt-cache show <package>
```

### Installing Packages

```bash
sudo apt install <package1> <package2> <package3>
```

### Update Package Sources

```bash
sudo apt update
```

### Upgrade Packages

```bash
sudo apt upgrade
```

### Remove Packages

```bash
sudo apt remove <package1>
# --purge removes configuration files as well
```

## Managing Packages with Snap (Universal Package Manager)

### Find Packages

```bash
snap find <package>
```

### Install Packages

```bash
sudo snap install <package>
```

### Check Location of the Package Binary

```bash
which <package>
```

### Check Package Information

```bash
snap info <package>
```

### Update Packages

```bash
sudo snap refresh
# OR
sudo snap refresh <package>
```

### Remove Packages

```bash
sudo snap remove <package>
```

## Backing up and Restoring Debian Packages

### Back up Packages List

```bash
dpkg --get-selections > packages.list
```

### Restore Packages (reinstall Ubuntu,etc...)

```bash
sudo apt update
which dselect
sudo apt install dselect # if not installed
sudo dselect update
sudo dpkg --set-selections < packages.list
sudo apt-get dselect-upgrade
```

## Cleaning up Orphaned apt Packages

**Never remove outdated kernels.(E.g. linux-image. etc...)**

### Wild card

```bash
sudo apt autoclean
sudo apt autoremove
sudo apt autopurge
```
