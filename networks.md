# Connecting to Networks

- Setting the hostname
- Managing network interfaces
- Assigning static IP addresses
- Understanding Linux name resolution
- Getting started with OpenSSH
- Getting started with SSH key management
- Simplifying SSH connections with a config file

## Setting the hostname

### View the current hostname

```bash
hostname
# OR
cat /etc/hostname
```

### Set the hostname

```bash
hostnamectl set-hostname <new-hostname>

edit /etc/hosts
```

## Managing network interfaces

```bash
ip a
```

### Preventing a device from connecting to networks

```bash
ip link set <device> down
```

### Bringing a device back up

```bash
ip link set <device> up
```
