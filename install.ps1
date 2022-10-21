#Requires -Version 5.1


$depStatus = (Get-Module -ListAvailable -Name PSWriteColor) ?  $true : $false
$depStatus ?  Install() : (Install-Module -Name PSWriteColor -RequiredVersion 0.85; Install())
