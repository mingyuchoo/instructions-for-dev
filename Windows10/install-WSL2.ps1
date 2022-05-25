# Install WSL Update
########################################
Invoke-WebRequest -Uri 'https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi' -Outfile C:\Temp\wsl_update_x64.msi
msiexec.exe /i C:\Temp\wsl_update_x64.msi /quiet
wsl --set-default-version 2

# Install Ubuntu 20.04
########################################
wsl --install --distribution Ubuntu-20.04

# Closing Messages
#######################################
echo "---------------------------------------"
echo "Congratulations! Ubuntu 20.04 is installed successfully."
echo "Please create your account in Ubuntu 20.04"
echo "---------------------------------------"

