$NewDIR = "C:\SoftwaresDump\QTP12.5"
$SoftwareWebLink = "http://artifacts.g7crm4l.org/Artifacts/QTP12.5/QTP%2012%20-%20HP%20UFT%2012.54.zip"
$SoftwarePath = "C:\SoftwaresDump\QTP12.5\QTP 12 - HP UFT 12.54.zip"

# Create temp directory
New-Item "C:\SoftwaresDump\QTP12.5" -ItemType Directory -ErrorAction SilentlyContinue
# Download
(New-Object System.Net.WebClient).DownloadFile("$SoftwareWebLink", "$SoftwarePath")

#Extracting
$shell = New-Object -ComObject shell.application
$zip = $shell.NameSpace("$SOftwarePath")
foreach ($item in $zip.items()) {
  $shell.Namespace("$NewDIR").CopyHere($item)
}

(New-Object System.Net.WebClient).DownloadFile("http://artifacts.g7crm4l.org/Artifacts/QTP12.5/qtpsetup.exe", "C:\SoftwaresDump\QTP12.5\qtpsetup.exe")



# Install
Start-Process "C:\SoftwaresDump\QTP12.5\setup.exe"
Start-Process "C:\SoftwaresDump\QTP12.5\qtpsetup.exe" 
