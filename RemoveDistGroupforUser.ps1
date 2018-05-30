# -------------------------------------------------------------------------------------------------
# Script: RemoveDistGroupforUser.ps1
# Author: Akash Masand
# Date: 30/05/2018 13:19:00 hrs
# Keywords: Office 365, Distribution Groups, Office365, Decommisioning
# Comments:
# The scripts displays the distribution lists the user is a member of an deletes them
# -------------------------------------------------------------------------------------------------


# Connect to Exchange Online
$exchangeSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "https://outlook.office365.com/powershell-liveid/" -Credential $credential -Authentication "Basic" -AllowRedirection
Import-PSSession $exchangeSession -AllowClobber

#get details of the user
$user = Get-User 'alana'

# Get all the distribution lists the user is a member of
$distributionGroups = Get-DistributionGroup -Filter "Members -like '$($user.distinguishedName)'"

foreach($distributionGroup in $distributionGroups) 
{
    #remove user from the membership list
    Remove-DistributionGroupMember -Member $user.UserPrincipalName -Identity $distributionGroup.Name

}

#Close the Exchange Online Session
Remove-PSSession $exchangeSession

