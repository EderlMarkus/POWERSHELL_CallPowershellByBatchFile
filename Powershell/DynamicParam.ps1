#a dynamic parameter, based on which option was chosen in the first Parameter, the second will be asked or not

[CmdletBinding()]
param (
    [Parameter(Mandatory = $true, Position = 1)]
    [ValidateSet("SayHello", "ShowMessage")]
    [string]$MODE,
    [Parameter(Mandatory = $false, Position = 2)]
    [string]$MESSAGE
)
DynamicParam {
    if ($MODE -eq "ShowMessage" -And $null -eq $MESSAGE) {
        #create a new ParameterAttribute Object
        $MessageAttribute = New-Object System.Management.Automation.ParameterAttribute
        $MessageAttribute.Mandatory = $true
        $MessageAttribute.HelpMessage = "Please define the Message (e.g. Hello World):"

        #create an attributecollection object for the attribute we just created.
        $attributeCollection = new-object System.Collections.ObjectModel.Collection[System.Attribute]

        #add our custom attribute
        $attributeCollection.Add($MessageAttribute)

        #add our paramater specifying the attribute collection
        $MessageParam = New-Object System.Management.Automation.RuntimeDefinedParameter('MyMessage', [string], $attributeCollection)

        #expose the name of our parameter
        $paramDictionary = New-Object System.Management.Automation.RuntimeDefinedParameterDictionary
        $paramDictionary.Add('MyMessage', $MessageParam)
        return $paramDictionary
    }
}

Process {
    if ($MODE -eq "SayHello") {
        Write-Host "Hello World!"
    }
    if ($MODE -eq "ShowMessage" ) {
        if ([string]::IsNullOrEmpty($MESSAGE)) {
            $MESSAGE = $PSBoundParameters.MyMessage
        }
        Write-Host "Your Message is: $MESSAGE"
    }
}
