# Create temp directory
New-Item "C:\temp\zipfile" -ItemType Directory -ErrorAction SilentlyContinue

# Download
(New-Object System.Net.WebClient).DownloadFile("http://ftp.mphasism4l.cloud/Artifacts/QTP%2012%20-%20HP%20UFT%2012.54.zip", "C:\temp\zipfile\QTP 12 - HP UFT 12.54.zip")
#Invoke-WebRequest "http://ftp.mphasism4l.cloud/Artifacts/QTP%2012%20-%20HP%20UFT%2012.54.zip" -OutFile "C:\temp\zipfile\QTP 12 - HP UFT 12.54.zip" 

#Extracting

$shell = New-Object -ComObject shell.application
$zip = $shell.NameSpace("C:\temp\zipfile\QTP 12 - HP UFT 12.54.zip")
foreach ($item in $zip.items()) {
  $shell.Namespace("C:\temp").CopyHere($item)
}

(New-Object System.Net.WebClient).DownloadFile("http://ftp.mphasism4l.cloud/Artifacts/qtpsetup.exe", "C:\temp\qtpsetup.exe")
#Invoke-WebRequest "http://ftp.mphasism4l.cloud/Artifacts/qtpsetup.exe" -OutFile "C:\temp\qtpsetup.exe" 



# Install
Start-Process "C:\temp\setup.exe"
Start-Process "C:\temp\qtpsetup.exe"

