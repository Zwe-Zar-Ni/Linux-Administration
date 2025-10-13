# Monitoring System Resources

- Viewing disk usage
- Monitoring memory usage
- Understanding load average
- Viewing resource usage with htop

## Viewing disk usage

### Using df

```bash
df -h
# -h = human-readable
# output - Filesystem      Size  Used Avail Use% Mounted on

df -i
# -h = human-readable
# -s = summary
# -c = total amount of space used
# Shows inodes instead of filesystem
# inodes = metadata of the files
```

### Dive deep with du

```bash
du -h
# Scan the current directory
# Which takes time, try to narrow down the directory to scan
```

### NCurses Disk Usage utility (ncdu)

```bash
sudo apt install ncdu

ncdu -x
```

## Monitoring memory usage

### Server memory

```bash
free -m
# Output - total        used        free      shared  buff/cache   available
# total - The total amount of memory installed on the server.
# used - The memory that is used (from any source). This is calculated as follows: used = total - free - buffers/cache.
# free - The memory not being used by anything, the cache or otherwise.
# shared - The memory used by tmpfs as well as other shared resources.
# buff/cache - The amount of memory being used by the buffers and cache.
# available - The memory that is free for applications to use.
```

## Load average

> a series of numbers that represents the server’s trend in CPU utilization over a given time.
> a set of three numbers, each corresponding to a portion of time. From left to right, these numbers correspond to 1 minute, 5 minutes, and 15 minutes respectively.
> each number represents how many tasks were waiting for attention from the CPU for that given time period.

```bash
htop
# OR
uptime
# OR
cat /proc/loadavg
```

## Resource usage with htop

```bash
sudo apt install htop

htop
# progress meter for each of the cores
# a meter for memory as well as swap
# uptime, Load average, and the number of Tasks that have running.
# a list of processes running on the server
```
