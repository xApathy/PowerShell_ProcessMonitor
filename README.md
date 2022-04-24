# PowerShell_ProcessMonitor
This script will monitor any running process in your task manager.</br>
If the process is closed, it will automatically try to re-launch the process.</br>
</br>
The following variables need to set to suit your application.
```
$ProcessName = "HueSync" # Process name as it appears in Task manager
$ProcessExacutableLocation = "C:\Program Files\Hue Sync\HueSync.exe" # Path to the executable
$ProcessCheckInterval = "30" # Number in minutes to wait between process checks. Needs to be at least 1
```
<b>$ProcessName</b> is the name of the process as it appears in the task manager.</br>
<i>Note: This generally does NOT include the extension on the end of the name</i>
