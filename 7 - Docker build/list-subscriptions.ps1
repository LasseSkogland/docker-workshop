# Connects to Azure using existing credentials and lists subscriptions.
# Use interactive login or service principal env vars.

if ($env:AZURE_TENANT_ID -and $env:AZURE_CLIENT_ID -and $env:AZURE_CLIENT_SECRET) {
    $secureSecret = ConvertTo-SecureString $env:AZURE_CLIENT_SECRET -AsPlainText -Force
    $cred = New-Object System.Management.Automation.PSCredential ($env:AZURE_CLIENT_ID, $secureSecret)
    Connect-AzAccount -ServicePrincipal -Tenant $env:AZURE_TENANT_ID -Credential $cred | Out-Null
} else {
    Connect-AzAccount | Out-Null
}

Get-AzSubscription | Select-Object Name, Id, State
