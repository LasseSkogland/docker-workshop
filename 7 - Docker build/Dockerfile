FROM mcr.microsoft.com/powershell:7.4-ubuntu-22.04
# Use the official PowerShell image as a base

WORKDIR /app
# All following commands run inside /app

RUN pwsh -NoLogo -NoProfile -Command \
	Set-PSRepository -Name PSGallery -InstallationPolicy Trusted; \
	Install-Module Az -Scope AllUsers -Force -AllowClobber
# Install Azure PowerShell modules at build time

COPY list-subscriptions.ps1 /app/list-subscriptions.ps1
# Copy the example script into the image

CMD ["pwsh", "/app/list-subscriptions.ps1"]
# Default command when the container starts
