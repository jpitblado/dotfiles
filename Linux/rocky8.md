# Rocky 8 notes

## Get and set the size of the mouse pointer

```
$ gsettings get org.gnome.desktop.interface cursor-size
24

$ gsettings set org.gnome.desktop.interface cursor-size 48
```

## Gnome shell favorite apps

Get the current list

```
$ gsettings get org.gnome.shell favorite-apps | tee apps-list
```

Add a .desktop file to ~/.local/share/applications and to the list in
`app-list` file created by above command, then write the list using

```
$ gsettings set org.gnome.shell favorite-apps "`cat apps-list`"
```

See the following files for a examples.
Place .desktop files in `~/.local/share/applications/`.

- firefox.desktop
- MediumTerminal.desktop
- SmallTerminal.desktop

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
$ sudo mount -o loop file.iso ~/tmp/mnt/iso
```

Unmount the iso file

```
$ sudo umount ~/tmp/mnt/iso
```

# end: centos8.md
