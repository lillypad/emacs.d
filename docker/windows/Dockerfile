FROM microsoft/windowservercore:latest

RUN @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
RUN choco upgrade chocolatey
RUN choco install -y git make
RUN cmd /s /k cd %APPDATA%
RUN git clone https://github.com/lillypad/emacs.d.git .emacs.d
RUN cd .emacs.d
RUN make windows
