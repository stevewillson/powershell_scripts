# a place to put things that I'm not using now that may be useful later
# 
# Steve Willson
# 5/19/18
# 
# 

# set a registry key to prevent the last username that was used to login
set-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -name "dontdisplaylastusername" -Value 1

# why is an exit code of 1001 used - symmantec website shows that this corresponds to 'recursion too deep'?
exit 1001



# Powershell commands to set up a domain controller

Install-WindowsFeature AD-Domain-Services

# Import the ADDSDeployment module to set up a new forest
Import-Module ADDSDeployment


# Prompt for domain name

$domain_name = Read-Host -Prompt 'Input your domain name'
$netbios_name = $domain_name.split(".")[0]

Install-ADDSForest
-CreateDnsDelegation:$false
-DatabasePath “C:\Windows\NTDS”
-DomainMode “WinThreshold"
-DomainName $domain_name
-DomainNetbiosName $netbios_name
-ForestMode “WinThreshold"
-InstallDns:$true
-LogPath “C:\Windows\NTDS”
-NoRebootOnCompletion:$false
-SysvolPath “C:\Windows\SYSVOL”
-Force:$true




== Adding a computer to the domain through powershell

Get-NetIPInterface -InterfaceAlias "Ethernet"

Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddress IP_ADDR


# Add the computer to the 'test.local' domain

This will prompt for some domain admin credentials

Add-Computer -Domain "test.local"




== Powershell DSC

Install-Module -Name xPSDesiredStateConfiguration

x - means that it is experimental
