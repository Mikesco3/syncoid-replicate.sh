#!/usr/bin/bash

# Check if at least source and destination are provided as arguments
if [ "$#" -lt 2 ] || [ "$#" -gt 3 ]; then
  echo "Usage: $0 <source ZFS dataset> <destination ZFS dataset> [<identifier>]"
  echo "Use a keyword for <identifier> as the 3rd argument when replicating to multiple targets."
  exit 1
fi

FROM="$1"
TO="$2"
IDENTIFIER=""

# Check if the third argument (identifier) is provided
if [ "$#" -eq 3 ]; then
  IDENTIFIER="--identifier=$3"
fi

# Define a function to store the syncoid command and options
SYNC_COMMAND() {
  /usr/sbin/syncoid --force-delete --quiet "$@" $IDENTIFIER
  ## If you want output, comment the previous line and uncomment the following one.
  # /usr/sbin/syncoid --force-delete "$@" $IDENTIFIER
}

# Sync the ZFS datasets
SYNC_COMMAND "$FROM" "$TO"

# Check if the syncoid command was successful
if [ "$?" -eq 0 ]; then
  ## If you want output, uncomment the next two lines
  echo "Sync completed successfully."
else
  echo "Sync encountered an error."
fi
