# Sharing and Transferring Files

- Setting up NFS shares
- Transferring files with rsync
- Transferring files with scp

## Transferring files with rsync

### Local to local

```bash
sudo rsync -r /contents /destination
# -r = recursive
# -a (the same as -rlptgoD) = archive (retains as much metadata as possible i.e permissions, timestamps, etc)
# -v = verbose (show what is being done)
# -b = backup (backup files that are being overwritten)

# -l = copy symlinks as symlinks
# -p = preserve permissions
# -t = preserve timestamps
# -g = preserve group
# -o = preserve owner
# -D = preserve device files
```

### SSH support

```bash
sudo rsync -av /contents admin@192.168.1.5:/destination
```

### Synchronize two directories

```bash
sudo rsync -av --delete /contents /destination
```

### Backup a directory

```bash
sudo rsync -avb --delete --backup-dir=/backup-directory /contents /destination
```

### Bash Example

```bash
#!/bin/bash
CURDATE=$(date +%m-%d-%Y)
sudo rsync -avb --delete --backup-dir=/backup-directory/$CURDATE /contents /destination
```
