FROM mcr.microsoft.com/powershell:7.4-ubuntu-22.04
# Use the official PowerShell image as a base

WORKDIR /app
# All following commands run inside /app

SHELL ["pwsh", "-NoLogo", "-NoProfile", "-Command" ]
# Set PowerShell as the default shell and configure it for non-interactive use

RUN Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
# Configure the PowerShell Gallery as a trusted repository

RUN Install-Module Az.Accounts -Scope AllUsers -Force -AllowClobber
# Install Azure PowerShell modules at build time

COPY list-subscriptions.ps1 /app/list-subscriptions.ps1
# Copy the example script into the image

CMD ["pwsh", "-File", "/app/list-subscriptions.ps1"]
# Default command when the container starts