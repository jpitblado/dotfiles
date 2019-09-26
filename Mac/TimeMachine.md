# Time Machine Notes

## Time machine command line interface

`tmutil` is the CLI for managing Time Machine backups.

```sh
$ tmutil -h
$ man tmutil
```

## Delete old backups

To clean up old/unwanted backup identified by macro `$old_bu_date`

```sh
$ tmutil delete $old_bu_date
```

# end: TimeMachine.md
