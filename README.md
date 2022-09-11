# xbar plugin org-clock

![screenshot](./screenshot.png)

This xbar plugin shows the current clock-in item on the menu bar.
[xbar](https://xbarapp.com/)(ex-BitBar) is a macOS tool that shows the custom message on the menu bar.

## Installation

### xbar

1. Download `org-clock.1m.sh` from this repository.
2. Open xbar plugin folder.
3. Store the script in the above directory.

### Emacs

Create a data directory and then add configuration to init.el.

```bash
mkdir -p ~/.xbar/org-clock/
```

```emacs-lisp
(leaf xbar-plugin-org-clock
  :defvar clockin-task-file
  :custom
  (clockin-task-file . "~/.xbar/org-clock/status")
  :preface
  (defun write-clockin-task-file ()
    (with-temp-buffer
      (insert (concat (format-time-string "%s" org-clock-start-time) "\t" org-clock-heading))
      (write-region (point-min) (point-max) clockin-task-file)))
  (defun delete-clockin-task-file ()
    (delete-file clockin-task-file))
  :hook
  (org-clock-in-hook     . write-clockin-task-file)
  (org-clock-out-hook    . delete-clockin-task-file)
  (org-clock-cancel-hook . delete-clockin-task-file))
```

## References

- [matryer/xbar-plugins - Writing plugins](https://github.com/matryer/xbar-plugins/blob/main/CONTRIBUTING.md#metadata)
- [org-modeでclock-inしているタスクをMacのメニューバーに表示する](https://qiita.com/tamanugi/items/ef43056d5c9709e4f7ab)
