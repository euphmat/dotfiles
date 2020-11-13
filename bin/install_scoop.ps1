Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
[environment]::setEnvironmentVariable('SCOOP','D:\Scoop','User')
$env:SCOOP='D:\Scoop'
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
Read-Host "続けるには Enter キーを押してください..." 
