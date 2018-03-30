Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco upgrade chocolatey
choco install -y git make
cmd /s /k cd %APPDATA%
git clone https://github.com/lillypad/emacs.d.git .emacs.d
cd .emacs.d
make windows
