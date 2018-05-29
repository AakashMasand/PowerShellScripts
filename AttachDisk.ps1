# -------------------------------------------------------------------------------------------------
# Script: AttachDisk.ps1
# Author: Akash Masand
# Date: 29/05/2018 15:24:00 hrs
# Keywords: Custom Script Extensions, Attach Disks, Data Disks
# Comments:
# do not delete. This script is being used by an ARM template
# -------------------------------------------------------------------------------------------------
$offlinedisks = get-disk | where OperationalStatus -EQ offline
foreach ($disk in $offlinedisks)
{
    Set-Disk -Number $disk.Number -IsOffline $false 
    Set-Disk -Number $disk.Number -IsReadOnly $false
}
