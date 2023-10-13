# Syncoid Replication Script

## Introduction

The "syncoid-replicate.sh" script is a Bash script designed for replicating ZFS datasets using the `syncoid` tool. It is especially useful for tasks like replicating virtual machine (VM) disks between different ZFS pools, such as from an SSD pool to a mirrored hard drive pool. This script is intended to simplify and automate the replication process.

## Prerequisites

Before using this script, ensure the following prerequisites are met:

1. A working ZFS setup with both the source and destination datasets properly configured.
2. The `syncoid` tool should be installed and accessible. You can install it from the [syncoid GitHub repository](https://github.com/jimsalterjrs/sanoid).
3. Appropriate permissions to run the script and access the ZFS pools.

## Usage
To use the "syncoid-replicate.sh" script, follow these steps:

1. Download the script to your system.
   ``` shell
   wget https://raw.githubusercontent.com/Mikesco3/syncoid-replicate.sh/main/syncoid-replicate.sh
   ```
2. Make the script executable using the following command:
   ```shell
   chmod +x syncoid-replicate.sh
   ```
3. Run the script with the source and destination ZFS datasets as arguments. For example, to replicate a dataset from "fast200" to "local-zfs", use the following command:
``` shell
./syncoid-replicate.sh fast200/vm-vmname rpool/vm-vmname
```
Replace `fast200/vm-vmname` with your source dataset and `rpool/vm-vmname` with your destination dataset.
4. The script will use `syncoid` to replicate the dataset, and you will be notified of the replication status (success or failure).

## Scheduling Replication
To automate dataset replication, consider using a tool like `cron` to schedule the script to run at specific intervals. For example, to run the script daily, you can add a cron job:

1. Open your crontab for editing:
``` shell
crontab -e
```
2. Add a line to schedule the script, providing the full path to the script and the desired schedule. For example, to run the script daily at midnight:
``` shell
0 0 * * * /path/to/syncoid-replicate.sh fast200/vm-vmname rpool/vm-vmname
```
Save the file.

## Troubleshooting
- If you encounter issues with the script, check for errors in the script output and logs.
- Ensure that the required permissions and paths are correctly configured.
- Verify that the syncoid tool is installed and properly configured.

## Disclaimer
This script is provided as-is and without warranty. Use it at your own discretion and ensure that it aligns with your specific requirements and system setup.

## License
<a href="https://github.com/Mikesco3/syncoid-replicate.sh/blob/main/LICENSE" target="_blank">AGPL-3.0 license</a>.
 
