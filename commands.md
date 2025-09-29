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
# -i for inode
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

### Redirect stream output

```bash
cat hello.txt > world.txt
```

### Append into a file

````bash
cat hello.txt >> world.txt
```

### Find and display the line of file that matches keyword

```bash
grep world hello.txt
# -i for case-insensitive
````

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

## Copy, move, rename

### Copy a file or directory

```bash
cp /path/to/hello.txt /path/to/world.txt
# OR
cp /path/to/hello.txt .
# dot represent current working directory

# Copy a directory
cp -r /path/to/myDir /path/to/copyDir

# copy multiple
cp dir1 dir2 dir3 /path/to/new/location
```

### Move or remane a file or directory

```bash
mv /path/to/hello.txt /path/to/world.txt
# OR
mv /path/to/hello.txt .
# dot represent current working directory
mv hello world
# Rename the file hello to world

# Move a directory
mv -r /path/to/myDir /path/to/copyDir

# move multiple
mv dir1 dir2 dir3 /path/to/new/location
```

## View Bash History

### Bash History File

```bash
cat ~/.bash_history
```

### View Recent Bash History

```bash
history
# Output : id command
# history --help
```

### Re-run a command

```bash
#!(command's id in history)
!123

# !! for last command (useful with sudo if forgot to add sudo last time)
sudo !!
```

### Delete a command from history

```bash
history -d 123
```

## Useful shortcuts

| Shortcut            | Description                                                                                       |
| ------------------- | ------------------------------------------------------------------------------------------------- |
| Ctrl + a            | Moves the cursor to the beginning of the line                                                     |
| Ctrl + e            | Moves the cursor to the end of the line                                                           |
| Ctrl + l            | Clears the screen                                                                                 |
| Ctrl + k            | Deletes characters from the cursor to the end of the line                                         |
| Ctrl + u            | Deletes everything you’ve typed on that line (also works to clear text while entering a password) |
| Ctrl + w            | Deletes the word to the left of the cursor                                                        |
| Ctrl + r            | Searches the history for the command history (Repeatable)                                         |
| Ctrl + r and then e | Edit the command in text editor                                                                   |

### Check the last command's success

```bash
echo $?
# 0 for success
```
