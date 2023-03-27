[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    $ORIGINALPATH
)
Write-Output "The Path in which the .bat-File was called was:"
Write-Output $ORIGINALPATH