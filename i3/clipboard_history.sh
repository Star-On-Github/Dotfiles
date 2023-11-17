#!/bin/bash

# Define the path to the clipboard history file
history_file="$HOME/.config/i3/clipboard_history.txt"

# Define the maximum number of entries to keep in the history
max_entries=50

# Check if the history file exists, otherwise create it
if [ ! -f $history_file ]; then
   touch $history_file
fi

# Read the clipboard content and append it to the history file
clipboard_content=$(xclip -selection clipboard -o 2>/dev/null)
if [ -n "$clipboard_content" ]; then
   # Remove older entries if the history exceeds the maximum number of entries
   if [ $(wc -l < $history_file) -ge $max_entries ]; then
      sed -i '1d' $history_file
   fi

   echo -e "$(date +'%Y-%m-%d %H:%M:%S')\t$clipboard_content" >> $history_file
fi

# Display the clipboard history using dmenu
cat $history_file | awk -F'\t' '{print $2}' | dmenu -l 10 -i | xclip -selection clipboard
