# Connect to Azure Active Directory module
Connect-AzureAD

# Create 20 Azure Active Directory User accounts
for ($i = 1; $i -le 20; $i++) {
    $userName = "Test User $i"
    $user = New-AzureADUser -DisplayName $userName -UserPrincipalName "$userName@example.com" -PasswordProfile (New-AzureADPasswordCredential -Password "P@ssw0rd1" -EndDate (Get-Date).AddYears(1))
}

# Create an Azure Active Directory Security group
$groupName = "Varonis Assignment Group"
$group = New-AzureADGroup -DisplayName $groupName -MailEnabled $false -SecurityEnabled $true

# Get all users created
$users = Get-AzureADUser -Filter "startswith(DisplayName, 'Test User')"

# Add users to the Security group and log the details
foreach ($user in $users) {
    $result = Add-AzureADGroupMember -ObjectId $group.ObjectId -RefObjectId $user.ObjectId -ErrorAction SilentlyContinue

    $logEntry = @{
        Username = $user.DisplayName
        Timestamp = Get-Date
        Result = if ($null -eq $result) { "Success" } else { "Failure" }
    }

    $logEntry | Export-Csv -Append -Path "C:\Path\To\Log\File.csv" -NoTypeInformation
}

# Disconnect from Azure Active Directory module
Disconnect-AzureAD
