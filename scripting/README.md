# Bash Scripting

- Bash Fundamentals
- Variables and Data Types
- Control Flow Statements
- Functions and Script Arguments
- Input and Output
- Text Processing with Bash
- Advanced Bash Techniques and Automation

**Reference**

- [roadmap.sh](https://roadmap.sh/ai/course/introduction-to-bash-scripting-1760887711085)

## Introduction

### Execution

**Create a .sh file**

```bash
touch index.sh
```

**Open the file in the editor**

```bash
nano index.sh
```

**Write the script**

```bash
#!/bin/bash
echo "Hello World"
```

**Make the script executable**

```bash
chmod +x index.sh
```

**Run the script**

```bash
bash index.sh
# OR
./index.sh
```

### Variables

```bash
#!/bin/bash
NAME="Vaddshah"
echo "Hello $NAME"
```

### Comments

```bash
#!/bin/bash
# This is a comment
echo "Hello World"
```

### Loops

#### For Loop

```bash
#!/bin/bash
for i in {1..5}
do
    echo $i
done
```

#### While Loop

```bash
#!/bin/bash
i=1
while [ $i -le 5 ]
do
    echo $i
    i=$((i+1))
done
```

#### Case Statement

```bash
#!/bin/bash
case $1 in
    "1")
        echo "One"
        ;;
    "2")
        echo "Two"
        ;;
    *)
        echo "Invalid Input"
        ;;
esac
```

### User input

```bash
#!/bin/bash
read -p "Enter your name: " name
echo "Hello $name"
```

### Positional Arguments

Commands can take in arguments at a specific position, counting from 1.( 0 for the command itself)

```bash
#!/bin/bash
echo "First Parameter: $1"
echo "Second Parameter: $2"
echo "Third Parameter: $3"

bash index.sh "argument 1" "argument 2" "argument 3"
```

### Piping

Piping allows the output of one command to be used as the input of another command.

```bash
#!/bin/bash
ls | grep .sh
# Takes the output of ls and pipes it to grep
# | is the pipe operator
```

### Output Redirection

Redirection allows the output of a command to be redirected to a file.

```bash
#!/bin/bash
ls > file.txt
# > write the output of ls to file.txt
ls >> file.txt
# >> append the output of ls to file.txt
```

### Feeding input to a command

```bash
#!/bin/bash
wc -w < file.txt
# Takes the input from file.txt and feeds it to wc -w

cat << EOF
This is a script
Hello world
EOF
# Takes the multiple inputs and feeds it to cat

wc -w <<< "Hello world"
# Takes the input as a string and feeds it to wc -w
```

### Test Conditions

```bash
#!/bin/bash
if [ $1 -eq 1 ]
then
    echo "One"
elif [ $1 -eq 2 ]
then
    echo "Two"
else
    echo "Invalid Input"
fi
# Takes the input and tests it against the conditions
```

```bash
#!/bin/bash
case $1 in
    "1")
        echo "One"
        ;;
    "2")
        echo "Two"
        ;;
    "3" | "4")
        echo "Too much"
        ;;
    *)
        echo "Invalid Input"
        ;;
esac
```

### Arrays

```bash
#!/bin/bash
array=(1 2 3 4 5)
echo ${array[@]} # Prints the array
echo ${array[0]}
echo ${array[1]}
echo ${array[2]}
echo ${array[3]}
echo ${array[4]}
```

### Looping through an array

```bash
#!/bin/bash
array=(1 2 3 4 5)
for i in "${array[@]}"
do
    echo $i
done
```

### Functions

```bash
#!/bin/bash
say_hello() {
    echo "Hello World"
}

say_hello
```

```bash
#!/bin/bash
get_up_time() {
    uptime=$(uptime -p)
    since=$(uptime -s)
    cat << EOF
Up since :
$uptime
$since
EOF
}

get_up_time
```

#### Local Variables

```bash
#!/bin/bash
VARI=1

fun() {
    local VARI=234
    echo $VARI
}
fun
echo $VARI
```

#### Function arguments

```bash
#!/bin/bash
get_up_time() {
    echo "Hello $1"
}

get_up_time "World"
```

```bash
#!/bin/bash
get_up_time() {
    echo "Hello $1" # funciton argument $1
}

get_up_time $1 # command argument $1
```

### Exit Codes

**Exit Codes**

- 0 - Success
- 1 - General Error
- 2 - Misuse of Shell Builtins
- 126 - Command not found
