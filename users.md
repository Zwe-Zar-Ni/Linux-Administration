# Managing Users

## Creating and removing users

### Creating user using useradd

```bash
sudo useradd -d /home/mary -m mary

-d specifies the home directory for the user
/home/mary is the home directory for the user mary
-m create a home directory for the user during process
mary is the username for the user
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

### Removing user

```bash
sudo userdel -r mary
-r flag to remove user's home directory
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
