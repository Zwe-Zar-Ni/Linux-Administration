# Managing Users

## Creating and Removing Users

### Creating user using useradd

```bash
sudo useradd -d /home/mary -m mary

 #-d specifies the home directory for the user
 #/home/mary is the home directory for the user mary
 #-m create a home directory for the user during process
 #mary is the username for the user
```

### List users

```bash
ls -l /home
```

### Creating password for user

```bash
sudo passwd mary
```

### Creating user using adduser

(Ask for password, and addition stuffs like full name, phone, etc)

```bash
sudo adduser mary
```

### Switching users

Switch to and exit from root

```bash
sudo su -
exit
```

Switch to another account

```bash
su - mary
# (or using sudo)
sudo su - mary
```

### Removing user

```bash
sudo userdel -r mary
# -r flag to remove user's home directory
```

## /etc/passwd and /etc/shadow files

### /etc/passwd

```bash
cat /etc/passwd
```

- Contains information about all users on the system.
- Entries are split into columns, separated by a colon.

```
username : password(x for encrypted password) : UID : GID : userInfo(GECOS) : homeDirectory : shell
```

### /etc/shadow

```bash
sudo cat /etc/shadow
```

Contains encrypted passwords for all users on the system.
Entries are split into columns, separated by a colon.

```
username : passwordHash : number of days since the Unix epoch (January 1, 1970) that the password was last changed
```

### View user's password info

```bash
sudo passwd -S mary
```

Output :

- username
- password's status (L for locked, P for set and usable , NP for no password set)
- date of last password change
- minimum password age
- maximum password age
- password warning period
- account expiration date
- number of days since the Unix epoch that will elapse before the account is disabled

For more info :

```bash
man shadow
man passwd
```

## Distributing Default Configuration Files with /etc/skel

Files that are contained within /etc/skel are copied into the home directory for all new users when created

```bash
ls -la /etc/skel
```

## Managing Groups

### Create new group

```bash
sudo groupadd admins
```

### View groups

```bash
cat /etc/group
```

### Add a user to a group

```bash

sudo gpasswd -a mary admins

# OR

# sudo usermod -aG admins mary
# -a means append (important to not remove all members of the group before appending)
# -G add the user to group as their secondary group
```

### Change a user's primary group

```bash
sudo usermod -g admins mary
```

### Remove user from a group

```bash
sudo gpasswd -d mary admins
```

### Remove group

```bash
sudo groupdel admins
```

## Managing Passwords

### Locking user accounts

```bash
sudo passwd -l mary
```

### Unlocking user accounts

```bash
sudo passwd -u mary
```

### View a user's password information

```bash
sudo chage -l mary
```

### Force a password change for a user when they first log in

```bash
sudo chage -d 0 mary
```

### Require a password change after a certain period of days (Maximum password age)

```bash
sudo chage -M 90 mary
```

### Password can't be changed within a certain period of days (Minimum password age)

```bash
sudo chage -m 7 mary
```

## Setting a password policy

### Using Pluggable Authentication Module (PAM)

!! NEED TO LEARN !!

## Configuring administrator access with sudo

### Give sudo access to a user

```bash
sudo usermod -aG sudo mary
```

### What users can do

```bash
sudo cat /etc/sudoers
```

### Users and groups privilege specification

```bash
root	ALL=(ALL:ALL) ALL
# Group names start with %
%sudo	ALL=(ALL:ALL) ALL

# first ALL : user (root) is able to use sudo from any terminal.
# Second ALL : user (root) can use sudo to impersonate any other user.
# Third ALL : user (root) can impersonate any other group
# Fourth ALL : what commands user (root) is able to use; in this case, any command they wish.
#
# E.g : mary	ubuntu=(charlie:admins) /usr/bin/apt
# E.g : charlie ubuntu= /sbin/reboot,/sbin/shutdown
```

## Setting permissions on files and directories

### Viewing permissions

```bash
ls -l

# First column : permission string for the object
# Second column : link count for the object
# Third column : user that owns the file
# Fourth column : group that owns the file
# Fifth column : size in bytes
# Sixth column : date the file was modified
# Seventh column : file name
```

### Permission string

**Example : drwxrwxr-x**

#### First character (file type):

- "-" = regular file
- d = directory
- l = symbolic link
- c = character device
- b = block device
- s = socket
- p = named pipe

#### Next 9 characters (permissions): They are split into 3 groups of 3:

rwx | rwx | rwx
user | group | others

- r = read
- w = write
- x = the ability to execute the file as a script (or enter, for directories)
- "-" = no permission

**Examples :**

- drwxrwxr-x
  d → directory
  rwx (user) → owner can read, write, enter
  rwx (group) → group can read, write, enter
  r-x (others) → others can read, enter, but not write
  Meaning: A shared directory, where the owner and group can modify, but others only read/enter.

---

- drwxr-xr-x
  d → directory
  rwx (user) → owner can do everything
  r-x (group) → group can read and enter, but not write
  r-x (others) → others can read and enter, but not write
  Meaning: Typical system directory, only owner can modify, others can only browse.

---

- -rw-r--r--
  "-" → regular file
  rw- (user) → owner can read and write
  r-- (group) → group can read
  r-- (others) → others can read
  Meaning: A read-only file for everyone except the owner, who can also edit.

---

- drwx------
  d → directory
  rwx (user) → owner has full control
  --- (group) → no access
  --- (others) → no access
  Meaning: A private directory

---

### Changing permissions

```bash
chmod o-r hello.txt
chmod u+rwx hello.txt
chomd g-rx hello.txt
```

####

1. u for user
2. g for group
3. o for others

####

1. "-" for removing permission
2. "+" for adding permission

####

1. r for read
2. w for write
3. x for execute

### Using octal point values

- Read: 4
- Write: 2
- Execute: 1
- No permission: 0

**Example**

1. Read and Write = 4 + 2 = 6
2. Read and Execute = 4 + 1 = 5
3. All three = 4 + 2 + 1 = 7
4. No permission = 0

- 600: User has read and write (4+2). No other permissions are set. (same as -rw-------)
- 740: User has read, write, and execute. Group has read. Other has nothing. (same as -rwxr-----)
- 770: Both User and Group have full access (read, write, and execute). Other has nothing. (same as -rwxrwx---)
- 777: Everyone has everything. (same as -rwxrwxrwx)

```bash
chmod 600 hello.txt
```

```bash
chmod 770 -R myDirectory
# -R : recursive
```

```bash
find /path/to/dir/ -type f -exec chmod 644 {} \;
# locating all files (-type f) in /path/to/dir/ and everything it finds, it executes chmod 644 against.
```

```bash
find /path/to/dir/ -type d -exec chmod 755 {} \;
# locating all directories  in /path/to/dir/ and changing them all to permission 755.
```

## Changing the ownership of objects

#### FIle owner

```bash
sudo chown mary hello.txt
```

#### Directory owner

```bash
sudo chown -R mary myDirectory
# -R = recursive
```

#### File group

```bash
sudo chgrp admins hello.txt
```

#### Directory group

```bash
sudo chgrp -R admins hello.txt
# -R = recursive
```

#### FIle owner and group

```bash
sudo chown mary:admins hello.txt
# mary user and the admins group to own hello.txt
```

#### Directory owner and group

```bash
sudo chown -R mary:admins myDirectory
# -R = recursive
```
