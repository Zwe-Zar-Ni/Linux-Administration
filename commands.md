# Navigating and Essential Commands

## Learning Essential Linux Commands

### View os release

```bash
lsb_release -a
# OR
cat /etc/os-release
```

### View Manual Pages

```bash
man man
# shows manual page for man command
```

### Print Working Directory

```bash
pwd
```

### Change Directory

```bash
cd /myDir/subDir
```

### Return Home

```bash
cd
# OR
cd ~
```

### Return to Most Recent Directory

```bash
cd -
```

### List the Contents of the Working Directory

```bash
ls
# -l for details
```

### Removing FIles

```bash
rm hello.txt
```

### Removing Directories

```bash
rm -rf myDir
# -r for recursive
# -f for force
```

### Create a file if not exist or update modification time if exist

```bash
touch hello.txt
```

### Viewing the contents of files

```bash
cat hello.txt
```

### Find and display the line of file that matches keyword

```bash
grep world hello.txt
# -i for case-insensitive
```

```bash
cat hello.txt | grep world
# takes the output of the cat command and redirects it as input to the grep command.
```

### View first or last lines of a file

```bash
tail -n 10 hello.txt
# -n for number of lines to be shown
```

### Watch realtime file changes

```bash
tail -f hello.txt
```
