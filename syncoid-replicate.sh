#!/bin/bash

# Check if both source and destination are provided as arguments
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <source ZFS dataset> <destination ZFS dataset>"
  exit 1
fi

FROM="$1"
TO="$2"

# Defined a function to store the syncoid command and options
SYNC_COMMAND() {
  /usr/sbin/syncoid --force-delete --quiet --no-clone-handling --no-sync-snap  "$@"
  ## If you want output, comment the previous line and uncomment the following one.
  # /usr/sbin/syncoid --force-delete --no-clone-handling  "$@"
}

# Sync the ZFS datasets
SYNC_COMMAND "$FROM" "$TO"

# Check if the syncoid command was successful
if [ "$?" -eq 0 ]; then
 ## if you want output, uncomment the next two lines
  echo "Sync completed successfully."
else
  echo "Sync encountered an error."
fi
