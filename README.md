# PowerShell_ProcessMonitor
This script will monitor any running process in your task manager.</br>
If the process is closed, it will automatically try to re-launch the process.</br>
</br>
```
$ProcessName = "HueSync" # Process name as it appears in Task manager
$ProcessExacutableLocation = "C:\Program Files\Hue Sync\HueSync.exe" # Path to the executable
$ProcessCheckInterval = "30" # Number in minutes to wait between process checks. Needs to be at least 1
```