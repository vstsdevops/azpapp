$NewDIR = "C:\SoftwaresDump\QTP12.5"

$SoftwareWebLink = "http://artifacts.g7crm4l.org/Artifacts/QTP12.5/QTP%2012%20-%20HP%20UFT%2012.54.zip"

$AutoITEXEWebLink = "http://artifacts.g7crm4l.org/Artifacts/QTP12.5/qtpsetup.exe"

$SoftwarePath = "C:\SoftwaresDump\QTP12.5\QTP 12 - HP UFT 12.54.zip"


# Create temp directory
New-Item "$NewDIR" -ItemType Directory -ErrorAction SilentlyContinue

# Download
(New-Object System.Net.WebClient).DownloadFile("$SoftwareWebLink", "$SoftwarePath")


#Extracting

$shell = New-Object -ComObject shell.application
$zip = $shell.NameSpace("$SOftwarePath")
foreach ($item in $zip.items()) {
  $shell.Namespace("$NewDIR").CopyHere($item)
}

(New-Object System.Net.WebClient).DownloadFile("$AutoITEXEWebLink", "$NewDIR")

# Install
Start-Process "$NewDIR\setup.exe"
Start-Process "$NewDIR\qtpsetup.exe"
