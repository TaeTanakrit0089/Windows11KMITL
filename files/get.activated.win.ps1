# The following get.ps1 code is hosted on get.activated.win for massgrave.dev. For more info, please visit massgrave.dev.
Set-ExecutionPolicy unrestricted

# Enable TLSv1.2 for compatibility with older clients for current session
[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12

& ([ScriptBlock]::Create((irm https://get.activated.win))) /HWID-NoEditionChange

