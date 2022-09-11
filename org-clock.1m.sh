#!/usr/bin/env bash

# <xbar.title>Org Clock</xbar.title>
# <xbar.version>v1.0</xbar.version>
# <xbar.author>Aya Igarashi</xbar.author>
# <xbar.author.github>Ladicle</xbar.author.github>
# <xbar.desc>Show clock-in item for Emacs org-clock.</xbar.desc>
# <xbar.image>https://raw.githubusercontent.com/Ladicle/xbar-plugin-org-clock/main/screenshot.png</xbar.image>
# <xbar.dependencies>bash</xbar.dependencies>
# <xbar.abouturl>https://github.com/Ladicle/xbar-plugin-org-clock</xbar.abouturl>

FILE="~/.xbar/org-clock/clock-in"

if [ -e ~/.clockin_task ]; then
  title=$(cat $FILE | cut -f 2)
  startAt=$(cat $FILE | cut -f 1)

  elapsed=$(expr `date +%s` - $startAt)

  h=$(expr $elapsed / 3600)
  m=$(expr $elapsed % 3600 / 60)

  printf "%s(%02d:%02d)\n" "$title" "$h" "$m"
else
  printf "no target"
fi
