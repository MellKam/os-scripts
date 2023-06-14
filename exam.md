1. Add a user group named 1K111 with ID number 1001 to the system.

```bash
sudo groupadd -g 1001 "1K111"
```

2. Add two users to the system: the first with the name `antek` and default
   attribute values, the secodn with name `jan` and ID number `1998`. Both users
   should be able to log into the system. The `1K111` group is to became an
   additional group for them.

```bash
sudo useradd -G "1K111" antek
sudo useradd -G "1K111" -u 1998 jan
```

3. On the `/dev/vdb` device, create an `ext4` file system with a data block size
   of `2048 B`. Create a `/shared` directory and mount the previously created
   file system on it. Add to the appropriate configuration file to mount this
   file system at boot time. Specify the command that will open thsi file for
   editing and specify the form of the entry that should be made in it. Specify
   this entry along with the line that immediately precedes this entry in this
   file.

```bash
mkfs.ext4 -b 2048 /dev/vdb

mkdir /shared

mount /dev/vdb /shared

echo "/dev/vdb /shared ext4 defaults 0 0" >> /etc/fstab
```

4. Set the access rights to the `/wspolny` directory so that any user of the
   system can create files in it, and only th owner can delete them. Create a
   `/studencki` directory. Set its owners and access rights so that the root
   user and users of the 1K111 gropu have full access rights. Additionally,
   1K111 group users have to wirte access to files created in it, regardless of
   the individula file owner.

```bash
sudo chmod 1777 wspolny

sudo mkdir studencki
sudo chown root:1K111 studencki
sudo chmod 2775 studencki
```

5. Check if the `traceroute` package is installed on the system. Install the
   `gnuplot` package.

```bash
dnf info traceroute
dnf install gnuplot
```

6. Specify the command showing the status of the `sshd` process? Specify the
   command to stop the sshd process. Specify the command to continue executing
   the `sshd` process.

```bash
systemctl status sshd
systemctl stop sshd
systemctl start sshd
```

7. Give the command to run the program called `działaj` while increasing its
   `NICE` parameter value by 5. Change the NICE parameter of the running process
   named `działaj` to 10. Terminate the running process `działaj` by giving it
   the opportunity to close any tip files it has opened.

```bash
nice -n 5 ./działaj
renice 10 <PID>
kill -SIGTERM <PID>
```

8. Specify a command that writes (overwrites) the file `/tmp/lists` the result
   of a long list of all regular fies in the current directory. Define the
   ssystem to execute this command every Monday at 9:00. Enter the command that
   will start editing the appropriate file and the form of the line to be added
   to it.

```bash
ls -l > /tmp/lists

crontab -e
0 9 * * 1 ls -l /path/to/current/directory > /tmp/lists
```

9. Write a script called `skrypt`. Write the command to start editing it. Script
   must contain an infinite loop displaying nothing on screen, not responding to
   `Ctrl + Z`, and reacting completion of the operation (without any additional
   messages, apart from the standart messages for switching the task to the
   background) after pressing `Ctrl + C` print its entire content. Make sure you
   can run this script.

```bash
nano script.sh
```

```bash
#!/bin/sh

# Ignore Ctrl + Z signal (SIGTSTP)
trap '' SIGTSTP

# Trap Ctrl + C signal (SIGINT)
trap 'cat "$0"' SIGINT

while true; do
  :
done
```

```bash
chmod +x script.sh
./script.sh
```

10. We assume that in the current directory there is a BINARKI directory, which
    contains a gzip-compressed archive anmed archive.tar.gz. Write a command
    that will recreate the contents of this archive in the current directory.

```bash
tar -xzf BINARKI/archive.tar.gz
```
