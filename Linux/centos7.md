# CentOS 7 notes

## Get and set the size of the mouse pointer

```
$ gsettings get org.gnome.desktop.interface cursor-size
24

$ gsettings set org.gnome.desktop.interface cursor-size 48
```

## Make Gnome 3 workspaces work on both monitors in a dual-monitor setup

```
$ gsettings get org.gnome.shell.overrides workspaces-only-on-primary
true

$ gsettings set org.gnome.shell.overrides workspaces-only-on-primary false
```

However, this did not seem to work.  I then noticed that the
Gnome-Tweak-Tool has a 'Workspaces' tab, and found an on/off
toggle for 'Workspaces only on primary display'.  I turned it
off, and now have the behavior that I wanted.

## Gnome shell favorite apps

Get the current list

```
$ gsettings get org.gnome.shell favorite-apps | tee apps-list
```

Add a .desktop file to ~/.local/share/applications and to the list in
`apps-list` file created by above command, then write the list using

```
$ gsettings set org.gnome.shell favorite-apps "`cat apps-list`"
```

See the following files for a examples.
Place .desktop files in `~/.local/share/applications/`.

- Gnome3/apps-list
- Gnome3/firefox.desktop
- Gnome3/MediumTerminal.desktop
- Gnome3/SmallTerminal.desktop

## Setup the apache web server

Install the server

```
$ sudo yum install httpd
```

Edit `DocumentRoot` in `/etc/httpd/conf/httpd.conf`

Enable `UserDir` in `/etc/httpd/conf.d/userdir.conf`

Turn on the service

```
$ sudo systemctl enable httpd.service
```

To start/stop/restart the server

```
$ sudo apachectl start
$ sudo apachectl stop
$ sudo apachectl restart
```

## Set the default printer

```
$ lpoptions -d <printer-name>
```

## Restart cups (printer) queues

```
$ sudo systemctl restart cups-browsed
$ sudo systemctl restart cups
```

## Mount iso file

Create folder to mount on

```
$ mkdir -p ~/tmp/mnt/iso
```

Mount the iso file, such as `file.iso`, onto the folder

```
$ sudo mount -t iso9660 -o loop file.iso ~/tmp/mnt/iso
```

Unmount the iso file

```
$ sudo umount ~/tmp/mnt/iso
```

# end: centos7.md
