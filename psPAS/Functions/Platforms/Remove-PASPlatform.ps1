Function Remove-PASPlatform {
	<#
.SYNOPSIS
Deletes a platform.

.DESCRIPTION
Deletes, target, dependent, group or rotational group platform.

.PARAMETER TargetPlatform
Specify if ID relates to Target platform

.PARAMETER DependentPlatform
Specify if ID relates to Dependent platform

.PARAMETER GroupPlatform
Specify if ID relates to Group platform

.PARAMETER RotationalGroup
Specify if ID relates to Rotational Group platform

.PARAMETER ID
The unique ID number of the platform to delete.

.EXAMPLE
Remove-PASPlatform -TargetPlatform -ID 9

Deletes Target Platform with ID of 9

.EXAMPLE
Remove-PASPlatform -DependentPlatform -ID 9

Deletes Dependent Platform with ID of 9

.EXAMPLE
Remove-PASPlatform -GroupPlatform -ID 39

Deletes Group Platform with ID of 39

.EXAMPLE
Remove-PASPlatform -RotationalGroup -ID 59

Deletes Rotational Group Platform with ID of 59

.NOTES
PAS 11.4 minimum

.LINK
https://pspas.pspete.dev/commands/Remove-PASPlatform
#>
	[System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter', 'TargetPlatform', Justification = "False Positive")]
	[System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter', 'DependentPlatform', Justification = "False Positive")]
	[System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter', 'GroupPlatform', Justification = "False Positive")]
	[System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter', 'RotationalGroup', Justification = "False Positive")]
	[CmdletBinding(SupportsShouldProcess)]
	param(
		[parameter(
			Mandatory = $true,
			ValueFromPipelinebyPropertyName = $true,
			ParameterSetName = "targets"
		)]
		[switch]$TargetPlatform,

		[parameter(
			Mandatory = $true,
			ValueFromPipelinebyPropertyName = $true,
			ParameterSetName = "dependents"
		)]
		[switch]$DependentPlatform,

		[parameter(
			Mandatory = $true,
			ValueFromPipelinebyPropertyName = $true,
			ParameterSetName = "groups"
		)]
		[switch]$GroupPlatform,

		[parameter(
			Mandatory = $true,
			ValueFromPipelinebyPropertyName = $true,
			ParameterSetName = "rotationalGroups"
		)]
		[switch]$RotationalGroup,

		[parameter(
			Mandatory = $true,
			ValueFromPipelinebyPropertyName = $true
		)]
		[int]$ID
	)

	BEGIN {

		Assert-VersionRequirement -RequiredVersion 11.4

	}#begin

	Process {

		#Create URL for request
		$URI = "$Script:BaseURI/API/Platforms/$($PSCmdLet.ParameterSetName)/$ID"

		if ($PSCmdlet.ShouldProcess($ID, "Delete $($PSCmdLet.ParameterSetName) Platform")) {

			#send request to web service
			Invoke-PASRestMethod -Uri $URI -Method DELETE -WebSession $Script:WebSession

		}

	}

}