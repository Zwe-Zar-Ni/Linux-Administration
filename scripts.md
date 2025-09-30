# Writing and Running Scripts

## Variables

### Write and read variables

```bash
var=value
echo $var
```

### read command

```bash
read var
echo $var
```

## Create a script

1. Create an sh file

```bash
nano hello.sh
```

2. Add content

```bash
#!/bin/bash
echo "My name is $USER"
echo "My home directory is $HOME"

#NOTE
# First line is shebang or hashbang
```

3. Mark as executable

```bash
chmod +x hello.sh
```

## Run a script

```bash
./hello.sh
```
