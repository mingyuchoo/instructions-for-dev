# Install Chocolatey
#######################################
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Essentials
#######################################
C:\ProgramData\chocolatey\choco.exe install -y 7zip
C:\ProgramData\chocolatey\choco.exe install -y notepadplusplus
C:\ProgramData\chocolatey\choco.exe install -y procexp
C:\ProgramData\chocolatey\choco.exe install -y procmon
C:\ProgramData\chocolatey\choco.exe install -y googlechrome
C:\ProgramData\chocolatey\choco.exe install -y microsoft-windows-terminal

# Development Tools
#######################################
C:\ProgramData\chocolatey\choco.exe install -y wget
C:\ProgramData\chocolatey\choco.exe install -y jq
C:\ProgramData\chocolatey\choco.exe install -y git
C:\ProgramData\chocolatey\choco.exe install -y shellcheck
C:\ProgramData\chocolatey\choco.exe install -y putty
C:\ProgramData\chocolatey\choco.exe install -y conemu
C:\ProgramData\chocolatey\choco.exe install -y vscode
C:\ProgramData\chocolatey\choco.exe install -y atom

# Runtimes
#######################################
C:\ProgramData\chocolatey\choco.exe install -y openjdk11
C:\ProgramData\chocolatey\choco.exe install -y gradle
C:\ProgramData\chocolatey\choco.exe install -y python
C:\ProgramData\chocolatey\choco.exe install -y nvm
C:\ProgramData\chocolatey\choco.exe install -y haskell-dev
C:\ProgramData\chocolatey\choco.exe install -y haskell-stack
C:\ProgramData\chocolatey\choco.exe install -y haskell-language-server
C:\ProgramData\chocolatey\choco.exe install -y ruby
C:\ProgramData\chocolatey\choco.exe install -y golang
C:\ProgramData\chocolatey\choco.exe install -y rust

# IDEs
#######################################
C:\ProgramData\chocolatey\choco.exe install -y intellijidea-community
C:\ProgramData\chocolatey\choco.exe install -y pycharm-community
C:\ProgramData\chocolatey\choco.exe install -y dbeaver
C:\ProgramData\chocolatey\choco.exe install -y filezilla

# AWSs
#######################################
C:\ProgramData\chocolatey\choco.exe install -y awscli
C:\ProgramData\chocolatey\choco.exe install -y awssamcli

# Infra as Code
#######################################
C:\ProgramData\chocolatey\choco.exe install -y chef-client
C:\ProgramData\chocolatey\choco.exe install -y puppet-agent
C:\ProgramData\chocolatey\choco.exe install -y terraform

# Test Tools
#######################################
C:\ProgramData\chocolatey\choco.exe install -y insomnia-rest-api-client
C:\ProgramData\chocolatey\choco.exe install -y postman
C:\ProgramData\chocolatey\choco.exe install -y cypress

# Upgrade WSL1 to WSL2
#######################################
dism.exe /online /Enable-feature /Featurename:Microsoft-Hyper-V-All /Featurename:Microsoft-Windows-Subsystem-Linux /Featurename:VirtualMachinePlatform /All Norestart

# Closing Messages
#######################################
echo "---------------------------------------"
echo "Congratulations! Packages are installed successfully."
echo "Please reboot your system."
echo "---------------------------------------"
