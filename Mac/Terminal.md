# Terminal.app Notes

## Disable AppNap for Terminal

```sh
# 10.9 and before:
$ defaults write com.apple.Terminal NSAppSleepDisabled -bool YES

# 10.10 and after:
$ defaults write com.apple.Terminal LSAppNapIsDisabled -bool YES
```

# end: Terminal.md
