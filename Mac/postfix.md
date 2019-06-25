# postfix Notes

`postfix` controls how to handle email.

You will need 'sudo' to edit the following files:

```
/etc/postfix/main.cf
/etc/aliases
```

You need to make definitions in `/etc/postfix/main.cf` to get `postfix` to
relay mail thru your mail server.  In the following, suppose the machine
name is `mach`, and `mach` lives in the domain `domain.com`, and the
email server is named `server` in the same domain:

```
myhostname = mach.domain.com
mydomain = domain.com
relayhost = server.domain.com
```

You can also make email aliases by adding lines to

```
/etc/aliases
```

# end: postfix.md
