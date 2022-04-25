$ProcessName = "HueSync" # Process name as it appears in Task manager (Under Details, omit .exe)
$ProcessExecutableLocation = "C:\Program Files\Hue Sync\HueSync.exe" # Path to the executable
$ProcessCheckInterval = "30" # Number in minutes to wait between process checks. Needs to be at least 1
# --------------------------------------------------------------------------------------
# -------------------- DO NOT MODIFY BELOW THIS LINE -----------------------------------
# --------------------------------------------------------------------------------------
$Global:TimeNextRun = (Get-Date).AddMinutes($ProcessCheckInterval)
$Global:Checking = $false
Clear-Host
Write-Host "Starting process monitor"
CheckProcess
Function  CheckProcess {
    $Global:TimeNextRun = (Get-Date).AddMinutes($ProcessCheckInterval)
    If($null -eq (Get-Process -Name $ProcessName -ErrorAction SilentlyContinue))
        {
            $CurrentTime = Get-Date -Format "HH:mm"
            Write-Host "[$CurrentTime]" -ForegroundColor white -NoNewline; Write-Host " - Not Running - Executing start process!!" -ForegroundColor Red;
            Start-Process -FilePath $ProcessExecutableLocation
            $Global:Checking = $false
            LoopTime
        }
    Else {
        $CurrentTime = Get-Date -Format "HH:mm"
        Write-Host "[$CurrentTime]" -ForegroundColor White -NoNewline; Write-Host " - Process is running, returning to time loop" -ForegroundColor Green;
        $Global:Checking = $false
        LoopTime
    } 
}

Function LoopTime {
    Do {        
        If ((Get-Date) -ge (Get-Date $Global:TimeNextRun))
            {
                $Global:Checking = $true
                Write-Host "Checking Process status ..."
                CheckProcess
            }
        #Write-Host "Sleeping"
        Start-Sleep -Seconds 30
    } while ($Global:Checking -eq $false)
}
