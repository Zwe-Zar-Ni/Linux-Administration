# Controlling and Managing Processes

- Managing jobs
- Understanding the ps command
- Changing the priority of processes
- Dealing with misbehaving processes
- Managing system processes
- Scheduling tasks with cron

## Managing jobs

### Stopping a process or a job

```bash
nano
```

```bash
# append an ampersand (&) at the end of the command
nano file.txt &
#Output : [jobId] processId
Ctrl + z
# Ctrl T + Ctrl Z to stop nano
#Output : [1]+ Stopped nano
```

### See stopped jobs

```bash
jobs
# OUtput : [jobID]-  Stopped                 actualJob
```

### Go back to most recent stopped job

```bash
fg
# Stands for foreground
```

### Go back to any stopped job

```bash
fg jobId
```

## ps command

### Viewing running processes with ps

```bash
ps

# -l flag for pri and ni
# PID : Process Id
# TTy : teletypewriter (terminals or access to the eserver)
# Time : amount of time a process needs the CPU in order to calculate something
# Stats : status code of the process (uninterruptible sleep (D), defunct (Z), stopped (T), interruptible sleep (S), and in the run queue (R))
# PRI : Priority of the process
# Ni : Niceness

# a option for more information
# au option for  even more information
# aux option for no limit on a single TTy (All the processes will show including system-level processes)
# ps aux --sort=-pcpu | head -n 5
# --sort=-pcpu for sorting by cpu usage
# --sort=-pmem for sorting by memory usage
```

### Search for processes

```bash
ps aux | grep apache2
# OR
ps u -C apache2
```

### Find a process by name

```
pidof [command]
```

### TTy

Processes run on TTy(s) which is a terminal that grabs input and manages the output.
Open different TTy(s) to access to the system. (through different terminals)

### Open a TTy

```bash
Ctrl + Alt + function keys from F1 to F7 for TTy 1 to 7
```

## Changing the priority of processes

> Higher the niceness level (being nice to other users' processes), lower the priority level (bigger niceness number = better niceness, bigger priority number = lower priority level)

### Start new process with specific niceness

```bash
nice -n 10 nano file.txt
```

### Change the niceness and prioriity of existing process

```bash
renice -n 10 -p PID
# 10 : niceness level (-20 to 19)
# increases the niceness level and priority by 10

# Needs sudo to decrease
```

## Dealing with misbehaving processes

### Killing a process

```bash
sudo kill PID
```

## Linux signals

Signals are used by both administrators and developers and can be sent to a process
either by the kernel, another process, or manually with a command. A signal instructs the process
of a request or change, and in some cases, to completely terminate. An example of such a signal is
SIGHUP, which tells processes that their controlling terminal has exited. Each signal is also represented by a value, such as 15 for SIGTERM and 9 for SIGKILL.

1. SIGHUP (tells processes that their controlling terminal has exited.)
2. SIGINT (an application is running in the foreground and is stopped by pressing Ctrl + c on the keyboard)
3. SIGTERM (when sent to a process, asks it to cleanly terminate.)
4. SIGKILL (forces a process to terminate uncleanly)
   ...

```bash
man 7 signal
```

### Kill process with a signal

```bash
sudo kill -9 PID
```

### killall command

- safer than the kill command
- instead of pid, can be called by process name
- kills any process it finds with the given name

```bash
sudo killall myprocess
```

## Managing system processes (daemons)

> Programs that run in the background on the server and are typically started automatically when it boots.
> Services are managed by its init system, referred to as PID 1. **(systemd)**
> systemd manages multiple things (services , DNS resolving, networking, and more)

### systemctl command

```bash
systemctl | grep mysql
```

```bash
systemctl status mysql
systemctl start mysql
systemctl stop mysql
systemctl restart mysql
systemctl reload mysql # Only some units(daemons)
```

### Automatically start or not start a unit when the server boots

```bash
sudo systemctl enable mysql
sudo systemctl disable mysql
```

## Scheduling tasks with cron

### View cron jobs

```bash
crontab -l
```

### Create a cron jobs

```bash
crontab -e
```

> m h dom mon dow command

1. m = minute
2. h = hour in 24-hour format (0 - 23)
3. dom = Day of the month
4. mon = Month
5. dow = Day of the week (0-6 , Sunday - Saturday)
6. command = Command to execute (fully qualified , long form like "/user/bin/apt update")

> 3 0 \* \* 4 /usr/bin/apt update
> The cleanup.sh script, located in /usr/local/bin, will be run at 12:03 a.m. every Thursday.

> 0 1 1 \* \* /usr/local/bin/run_report.sh
> the first day of every month at 01:00 a.m.
