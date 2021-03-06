# =============================================================================
# Windows PowerShell Source File 
# NAME:			Untitled.ps1
# AUTHOR: 	%Username% , %Company%
# DATE: 		%Date%
# COMMENT: 	Comment for a file.
# =============================================================================

<#        
.SYNOPSIS
 A brief summary of the commands in the file.

.DESCRIPTION
A detailed description of the commands in the file.

.NOTES
#>

# Warning: Do not rename Start-MyService, Invoke-MyService and Stop-MyService functions

function Start-MyService {
  # Place one time startup code here.
  # Initialize global variables and open connections if needed
  $global:bRunService = $true
  $global:bServiceRunning = $false
}

function Invoke-MyService {
	$global:bServiceRunning = $true
	
  while ($global:bRunService) {
    try {
      #Place code for your service here
      #e.g. $ProcessList = Get-Process solitaire -ErrorAction SilentlyContinue
			
      # Use Write-Host or any other PowerShell output function to write to the System's application log
			
    }
    catch {
      # Log exception in application log
      Write-Host $_.Exception.Message 
    }		
    # Adjust sleep timing to determine how often your service becomes active.
    Start-Sleep –Seconds 10 # a lower number will make your service active more often and use more CPU cycles
  }
  $global:bServiceRunning	= $false
}

function Stop-MyService {
  $global:bRunService = $false # Signal main loop to exit
  $CountDown = 30 # Maximum wait for loop to exit
  while ($global:bServiceRunning -and $Countdown -gt 0) {
    Start-Sleep -Seconds 1 # wait for your main loop to exit
    $Countdown = $Countdown - 1
  }
  # Place code to be executed on service stop here 
  # Close files and connections, terminate jobs and 
  # use remove-module to unload blocking modules
}
