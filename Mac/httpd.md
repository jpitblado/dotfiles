# httpd Notes

## Start, restart, and stop httpd

```
$ sudo apachectl start
$ sudo apachectl restart
$ sudo apachectl stop
```

## Configuring httpd

Edit the file `/etc/apache2/httpd.conf`.

Make sure the following modules are loaded.

- `mod_include.so`
- `mod_userdir.so`
- `mod_rewrite.so`

Give your server a name and port using `ServerName`.

Fix the path for `DocumentRoot`, make sure `Options` for this folder
includes `Indexes`, and `AllowOveride` is `All`.

Turn on loading/searching Sites from user home directories by including
`extra/httpd-userdir.conf`.  Make sure this file includes all files in
`users/*.conf`.  An example file in `users/` could be

```
<Directory "/Users/dude/Sites/">
	AllowOverride All
	Options Indexes MultiViews FollowSymlinks
	Require all granted
</Directory>
```

Turn on added security for RCS by including `extra/security-git.conf`.
This file might already contain something like the following.

```
<DirectoryMatch "/\.git">
	Require all denied
</Directory>
```

# end: httpd.md
