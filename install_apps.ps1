# install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force 
Invoke-Expression((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# setup webclient for download
$wc = New-Object System.net.WebClient

# download the first run batch file and put it on the desktop
$baturl = "https://cloudplatformsstreaming.blob.core.windows.net/provisioningassets/firstrun.bat"
$batoutput = "C:\firstrun.bat"
$wc.DownloadFile($baturl, $batoutput)

# download a sysprep oobe config
$configurl = "https://cloudplatformsstreaming.blob.core.windows.net/provisioningassets/deploy.xml"
$configoutput = "C:\deploy.xml"
$wc.DownloadFile($configurl, $configoutput)

# download a sysprep batch file
$configurl = "https://cloudplatformsstreaming.blob.core.windows.net/provisioningassets/prepme.bat"
$configoutput = "C:\prepme.bat"
$wc.DownloadFile($configurl, $configoutput)

# install chocolatey packages
choco install -y obs-studio
choco install -y zoom
choco install -y git
