ace.define("ace/mode/powershell_highlight_rules",["require","exports","module","ace/lib/oop","ace/mode/text_highlight_rules"],function(e,t,n){"use strict";var o=e("../lib/oop"),r=e("./text_highlight_rules").TextHighlightRules,i=function(){var e="begin|break|catch|continue|data|do|dynamicparam|else|elseif|end|exit|filter|finally|for|foreach|from|function|if|in|inlinescript|hidden|parallel|param|process|return|sequence|switch|throw|trap|try|until|while|workflow",t="Get-AppBackgroundTask|Start-AppBackgroundTask|Unregister-AppBackgroundTask|Disable-AppBackgroundTaskDiagnosticLog|Enable-AppBackgroundTaskDiagnosticLog|Set-AppBackgroundTaskResourcePolicy|Get-AppLockerFileInformation|Get-AppLockerPolicy|New-AppLockerPolicy|Set-AppLockerPolicy|Test-AppLockerPolicy|Get-AppxLastError|Get-AppxLog|Add-AppxPackage|Add-AppxVolume|Dismount-AppxVolume|Get-AppxDefaultVolume|Get-AppxPackage|Get-AppxPackageManifest|Get-AppxVolume|Mount-AppxVolume|Move-AppxPackage|Remove-AppxPackage|Remove-AppxVolume|Set-AppxDefaultVolume|Clear-AssignedAccess|Get-AssignedAccess|Set-AssignedAccess|Add-BitLockerKeyProtector|Backup-BitLockerKeyProtector|Clear-BitLockerAutoUnlock|Disable-BitLocker|Disable-BitLockerAutoUnlock|Enable-BitLocker|Enable-BitLockerAutoUnlock|Get-BitLockerVolume|Lock-BitLocker|Remove-BitLockerKeyProtector|Resume-BitLocker|Suspend-BitLocker|Unlock-BitLocker|Add-BitsFile|Complete-BitsTransfer|Get-BitsTransfer|Remove-BitsTransfer|Resume-BitsTransfer|Set-BitsTransfer|Start-BitsTransfer|Suspend-BitsTransfer|Add-BCDataCacheExtension|Clear-BCCache|Disable-BC|Disable-BCDowngrading|Disable-BCServeOnBattery|Enable-BCDistributed|Enable-BCDowngrading|Enable-BCHostedClient|Enable-BCHostedServer|Enable-BCLocal|Enable-BCServeOnBattery|Export-BCCachePackage|Export-BCSecretKey|Get-BCClientConfiguration|Get-BCContentServerConfiguration|Get-BCDataCache|Get-BCDataCacheExtension|Get-BCHashCache|Get-BCHostedCacheServerConfiguration|Get-BCNetworkConfiguration|Get-BCStatus|Import-BCCachePackage|Import-BCSecretKey|Publish-BCFileContent|Publish-BCWebContent|Remove-BCDataCacheExtension|Reset-BC|Set-BCAuthentication|Set-BCCache|Set-BCDataCacheEntryMaxAge|Set-BCMinSMBLatency|Set-BCSecretKey|Export-BinaryMiLog|Get-CimAssociatedInstance|Get-CimClass|Get-CimInstance|Get-CimSession|Import-BinaryMiLog|Invoke-CimMethod|New-CimInstance|New-CimSession|New-CimSessionOption|Register-CimIndicationEvent|Remove-CimInstance|Remove-CimSession|Set-CimInstance|ConvertFrom-CIPolicy|Add-SignerRule|Edit-CIPolicyRule|Get-CIPolicy|Get-CIPolicyInfo|Get-SystemDriver|Merge-CIPolicy|New-CIPolicy|New-CIPolicyRule|Remove-CIPolicyRule|Set-CIPolicyVersion|Set-HVCIOptions|Set-RuleOption|Add-MpPreference|Get-MpComputerStatus|Get-MpPreference|Get-MpThreat|Get-MpThreatCatalog|Get-MpThreatDetection|Remove-MpPreference|Remove-MpThreat|Set-MpPreference|Start-MpScan|Start-MpWDOScan|Update-MpSignature|Disable-DAManualEntryPointSelection|Enable-DAManualEntryPointSelection|Get-DAClientExperienceConfiguration|Get-DAEntryPointTableItem|New-DAEntryPointTableItem|Remove-DAEntryPointTableItem|Rename-DAEntryPointTableItem|Reset-DAClientExperienceConfiguration|Reset-DAEntryPointTableItem|Set-DAClientExperienceConfiguration|Set-DAEntryPointTableItem|Add-ProvisionedAppxPackage|Apply-WindowsUnattend|Get-ProvisionedAppxPackage|Remove-ProvisionedAppxPackage|Add-AppxProvisionedPackage|Add-WindowsCapability|Add-WindowsDriver|Add-WindowsImage|Add-WindowsPackage|Clear-WindowsCorruptMountPoint|Disable-WindowsOptionalFeature|Dismount-WindowsImage|Enable-WindowsOptionalFeature|Expand-WindowsCustomDataImage|Expand-WindowsImage|Export-WindowsDriver|Export-WindowsImage|Get-AppxProvisionedPackage|Get-WIMBootEntry|Get-WindowsCapability|Get-WindowsDriver|Get-WindowsEdition|Get-WindowsImage|Get-WindowsImageContent|Get-WindowsOptionalFeature|Get-WindowsPackage|Mount-WindowsImage|New-WindowsCustomImage|New-WindowsImage|Optimize-WindowsImage|Remove-AppxProvisionedPackage|Remove-WindowsCapability|Remove-WindowsDriver|Remove-WindowsImage|Remove-WindowsPackage|Repair-WindowsImage|Save-WindowsImage|Set-AppXProvisionedDataFile|Set-WindowsEdition|Set-WindowsProductKey|Split-WindowsImage|Update-WIMBootEntry|Use-WindowsUnattend|Add-DnsClientNrptRule|Clear-DnsClientCache|Get-DnsClient|Get-DnsClientCache|Get-DnsClientGlobalSetting|Get-DnsClientNrptGlobal|Get-DnsClientNrptPolicy|Get-DnsClientNrptRule|Get-DnsClientServerAddress|Register-DnsClient|Remove-DnsClientNrptRule|Set-DnsClient|Set-DnsClientGlobalSetting|Set-DnsClientNrptGlobal|Set-DnsClientNrptRule|Set-DnsClientServerAddress|Resolve-DnsName|Add-EtwTraceProvider|Get-AutologgerConfig|Get-EtwTraceProvider|Get-EtwTraceSession|New-AutologgerConfig|New-EtwTraceSession|Remove-AutologgerConfig|Remove-EtwTraceProvider|Remove-EtwTraceSession|Send-EtwTraceSession|Set-AutologgerConfig|Set-EtwTraceProvider|Set-EtwTraceSession|Get-WinAcceptLanguageFromLanguageListOptOut|Get-WinCultureFromLanguageListOptOut|Get-WinDefaultInputMethodOverride|Get-WinHomeLocation|Get-WinLanguageBarOption|Get-WinSystemLocale|Get-WinUILanguageOverride|Get-WinUserLanguageList|New-WinUserLanguageList|Set-Culture|Set-WinAcceptLanguageFromLanguageListOptOut|Set-WinCultureFromLanguageListOptOut|Set-WinDefaultInputMethodOverride|Set-WinHomeLocation|Set-WinLanguageBarOption|Set-WinSystemLocale|Set-WinUILanguageOverride|Set-WinUserLanguageList|Connect-IscsiTarget|Disconnect-IscsiTarget|Get-IscsiConnection|Get-IscsiSession|Get-IscsiTarget|Get-IscsiTargetPortal|New-IscsiTargetPortal|Register-IscsiSession|Remove-IscsiTargetPortal|Set-IscsiChapSecret|Unregister-IscsiSession|Update-IscsiTarget|Update-IscsiTargetPortal|Get-IseSnippet|Import-IseSnippet|New-IseSnippet|Add-KdsRootKey|Clear-KdsCache|Get-KdsConfiguration|Get-KdsRootKey|Set-KdsConfiguration|Test-KdsRootKey|Compress-Archive|Expand-Archive|Export-Counter|Get-Counter|Get-WinEvent|Import-Counter|New-WinEvent|Start-Transcript|Stop-Transcript|Add-Computer|Add-Content|Checkpoint-Computer|Clear-Content|Clear-EventLog|Clear-Item|Clear-ItemProperty|Clear-RecycleBin|Complete-Transaction|Convert-Path|Copy-Item|Copy-ItemProperty|Debug-Process|Disable-ComputerRestore|Enable-ComputerRestore|Get-ChildItem|Get-Clipboard|Get-ComputerRestorePoint|Get-Content|Get-ControlPanelItem|Get-EventLog|Get-HotFix|Get-Item|Get-ItemProperty|Get-ItemPropertyValue|Get-Location|Get-Process|Get-PSDrive|Get-PSProvider|Get-Service|Get-Transaction|Get-WmiObject|Invoke-Item|Invoke-WmiMethod|Join-Path|Limit-EventLog|Move-Item|Move-ItemProperty|New-EventLog|New-Item|New-ItemProperty|New-PSDrive|New-Service|New-WebServiceProxy|Pop-Location|Push-Location|Register-WmiEvent|Remove-Computer|Remove-EventLog|Remove-Item|Remove-ItemProperty|Remove-PSDrive|Remove-WmiObject|Rename-Computer|Rename-Item|Rename-ItemProperty|Reset-ComputerMachinePassword|Resolve-Path|Restart-Computer|Restart-Service|Restore-Computer|Resume-Service|Set-Clipboard|Set-Content|Set-Item|Set-ItemProperty|Set-Location|Set-Service|Set-WmiInstance|Show-ControlPanelItem|Show-EventLog|Split-Path|Start-Process|Start-Service|Start-Transaction|Stop-Computer|Stop-Process|Stop-Service|Suspend-Service|Test-ComputerSecureChannel|Test-Connection|Test-Path|Undo-Transaction|Use-Transaction|Wait-Process|Write-EventLog|Export-ODataEndpointProxy|ConvertFrom-SecureString|ConvertTo-SecureString|Get-Acl|Get-AuthenticodeSignature|Get-CmsMessage|Get-Credential|Get-ExecutionPolicy|Get-PfxCertificate|Protect-CmsMessage|Set-Acl|Set-AuthenticodeSignature|Set-ExecutionPolicy|Unprotect-CmsMessage|ConvertFrom-SddlString|Format-Hex|Get-FileHash|Import-PowerShellDataFile|New-Guid|New-TemporaryFile|Add-Member|Add-Type|Clear-Variable|Compare-Object|ConvertFrom-Csv|ConvertFrom-Json|ConvertFrom-String|ConvertFrom-StringData|Convert-String|ConvertTo-Csv|ConvertTo-Html|ConvertTo-Json|ConvertTo-Xml|Debug-Runspace|Disable-PSBreakpoint|Disable-RunspaceDebug|Enable-PSBreakpoint|Enable-RunspaceDebug|Export-Alias|Export-Clixml|Export-Csv|Export-FormatData|Export-PSSession|Format-Custom|Format-List|Format-Table|Format-Wide|Get-Alias|Get-Culture|Get-Date|Get-Event|Get-EventSubscriber|Get-FormatData|Get-Host|Get-Member|Get-PSBreakpoint|Get-PSCallStack|Get-Random|Get-Runspace|Get-RunspaceDebug|Get-TraceSource|Get-TypeData|Get-UICulture|Get-Unique|Get-Variable|Group-Object|Import-Alias|Import-Clixml|Import-Csv|Import-LocalizedData|Import-PSSession|Invoke-Expression|Invoke-RestMethod|Invoke-WebRequest|Measure-Command|Measure-Object|New-Alias|New-Event|New-Object|New-TimeSpan|New-Variable|Out-File|Out-GridView|Out-Printer|Out-String|Read-Host|Register-EngineEvent|Register-ObjectEvent|Remove-Event|Remove-PSBreakpoint|Remove-TypeData|Remove-Variable|Select-Object|Select-String|Select-Xml|Send-MailMessage|Set-Alias|Set-Date|Set-PSBreakpoint|Set-TraceSource|Set-Variable|Show-Command|Sort-Object|Start-Sleep|Tee-Object|Trace-Command|Unblock-File|Unregister-Event|Update-FormatData|Update-List|Update-TypeData|Wait-Debugger|Wait-Event|Write-Debug|Write-Error|Write-Host|Write-Information|Write-Output|Write-Progress|Write-Verbose|Write-Warning|Connect-WSMan|Disable-WSManCredSSP|Disconnect-WSMan|Enable-WSManCredSSP|Get-WSManCredSSP|Get-WSManInstance|Invoke-WSManAction|New-WSManInstance|New-WSManSessionOption|Remove-WSManInstance|Set-WSManInstance|Set-WSManQuickConfig|Test-WSMan|Debug-MMAppPrelaunch|Disable-MMAgent|Enable-MMAgent|Get-MMAgent|Set-MMAgent|Add-DtcClusterTMMapping|Get-Dtc|Get-DtcAdvancedHostSetting|Get-DtcAdvancedSetting|Get-DtcClusterDefault|Get-DtcClusterTMMapping|Get-DtcDefault|Get-DtcLog|Get-DtcNetworkSetting|Get-DtcTransaction|Get-DtcTransactionsStatistics|Get-DtcTransactionsTraceSession|Get-DtcTransactionsTraceSetting|Install-Dtc|Remove-DtcClusterTMMapping|Reset-DtcLog|Set-DtcAdvancedHostSetting|Set-DtcAdvancedSetting|Set-DtcClusterDefault|Set-DtcClusterTMMapping|Set-DtcDefault|Set-DtcLog|Set-DtcNetworkSetting|Set-DtcTransaction|Set-DtcTransactionsTraceSession|Set-DtcTransactionsTraceSetting|Start-Dtc|Start-DtcTransactionsTraceSession|Stop-Dtc|Stop-DtcTransactionsTraceSession|Test-Dtc|Uninstall-Dtc|Write-DtcTransactionsTraceSession|Complete-DtcDiagnosticTransaction|Join-DtcDiagnosticResourceManager|New-DtcDiagnosticTransaction|Receive-DtcDiagnosticTransaction|Send-DtcDiagnosticTransaction|Start-DtcDiagnosticResourceManager|Stop-DtcDiagnosticResourceManager|Undo-DtcDiagnosticTransaction|Disable-NetAdapter|Disable-NetAdapterBinding|Disable-NetAdapterChecksumOffload|Disable-NetAdapterEncapsulatedPacketTaskOffload|Disable-NetAdapterIPsecOffload|Disable-NetAdapterLso|Disable-NetAdapterPacketDirect|Disable-NetAdapterPowerManagement|Disable-NetAdapterQos|Disable-NetAdapterRdma|Disable-NetAdapterRsc|Disable-NetAdapterRss|Disable-NetAdapterSriov|Disable-NetAdapterVmq|Enable-NetAdapter|Enable-NetAdapterBinding|Enable-NetAdapterChecksumOffload|Enable-NetAdapterEncapsulatedPacketTaskOffload|Enable-NetAdapterIPsecOffload|Enable-NetAdapterLso|Enable-NetAdapterPacketDirect|Enable-NetAdapterPowerManagement|Enable-NetAdapterQos|Enable-NetAdapterRdma|Enable-NetAdapterRsc|Enable-NetAdapterRss|Enable-NetAdapterSriov|Enable-NetAdapterVmq|Get-NetAdapter|Get-NetAdapterAdvancedProperty|Get-NetAdapterBinding|Get-NetAdapterChecksumOffload|Get-NetAdapterEncapsulatedPacketTaskOffload|Get-NetAdapterHardwareInfo|Get-NetAdapterIPsecOffload|Get-NetAdapterLso|Get-NetAdapterPacketDirect|Get-NetAdapterPowerManagement|Get-NetAdapterQos|Get-NetAdapterRdma|Get-NetAdapterRsc|Get-NetAdapterRss|Get-NetAdapterSriov|Get-NetAdapterSriovVf|Get-NetAdapterStatistics|Get-NetAdapterVmq|Get-NetAdapterVmqQueue|Get-NetAdapterVPort|New-NetAdapterAdvancedProperty|Remove-NetAdapterAdvancedProperty|Rename-NetAdapter|Reset-NetAdapterAdvancedProperty|Restart-NetAdapter|Set-NetAdapter|Set-NetAdapterAdvancedProperty|Set-NetAdapterBinding|Set-NetAdapterChecksumOffload|Set-NetAdapterEncapsulatedPacketTaskOffload|Set-NetAdapterIPsecOffload|Set-NetAdapterLso|Set-NetAdapterPacketDirect|Set-NetAdapterPowerManagement|Set-NetAdapterQos|Set-NetAdapterRdma|Set-NetAdapterRsc|Set-NetAdapterRss|Set-NetAdapterSriov|Set-NetAdapterVmq|Get-NetConnectionProfile|Set-NetConnectionProfile|Add-NetEventNetworkAdapter|Add-NetEventPacketCaptureProvider|Add-NetEventProvider|Add-NetEventVmNetworkAdapter|Add-NetEventVmSwitch|Add-NetEventWFPCaptureProvider|Get-NetEventNetworkAdapter|Get-NetEventPacketCaptureProvider|Get-NetEventProvider|Get-NetEventSession|Get-NetEventVmNetworkAdapter|Get-NetEventVmSwitch|Get-NetEventWFPCaptureProvider|New-NetEventSession|Remove-NetEventNetworkAdapter|Remove-NetEventPacketCaptureProvider|Remove-NetEventProvider|Remove-NetEventSession|Remove-NetEventVmNetworkAdapter|Remove-NetEventVmSwitch|Remove-NetEventWFPCaptureProvider|Set-NetEventPacketCaptureProvider|Set-NetEventProvider|Set-NetEventSession|Set-NetEventWFPCaptureProvider|Start-NetEventSession|Stop-NetEventSession|Add-NetLbfoTeamMember|Add-NetLbfoTeamNic|Get-NetLbfoTeam|Get-NetLbfoTeamMember|Get-NetLbfoTeamNic|New-NetLbfoTeam|Remove-NetLbfoTeam|Remove-NetLbfoTeamMember|Remove-NetLbfoTeamNic|Rename-NetLbfoTeam|Set-NetLbfoTeam|Set-NetLbfoTeamMember|Set-NetLbfoTeamNic|Add-NetNatExternalAddress|Add-NetNatStaticMapping|Get-NetNat|Get-NetNatExternalAddress|Get-NetNatGlobal|Get-NetNatSession|Get-NetNatStaticMapping|New-NetNat|Remove-NetNat|Remove-NetNatExternalAddress|Remove-NetNatStaticMapping|Set-NetNat|Set-NetNatGlobal|Get-NetQosPolicy|New-NetQosPolicy|Remove-NetQosPolicy|Set-NetQosPolicy|Copy-NetFirewallRule|Copy-NetIPsecMainModeCryptoSet|Copy-NetIPsecMainModeRule|Copy-NetIPsecPhase1AuthSet|Copy-NetIPsecPhase2AuthSet|Copy-NetIPsecQuickModeCryptoSet|Copy-NetIPsecRule|Disable-NetFirewallRule|Disable-NetIPsecMainModeRule|Disable-NetIPsecRule|Enable-NetFirewallRule|Enable-NetIPsecMainModeRule|Enable-NetIPsecRule|Find-NetIPsecRule|Get-NetFirewallAddressFilter|Get-NetFirewallApplicationFilter|Get-NetFirewallInterfaceFilter|Get-NetFirewallInterfaceTypeFilter|Get-NetFirewallPortFilter|Get-NetFirewallProfile|Get-NetFirewallRule|Get-NetFirewallSecurityFilter|Get-NetFirewallServiceFilter|Get-NetFirewallSetting|Get-NetIPsecDospSetting|Get-NetIPsecMainModeCryptoSet|Get-NetIPsecMainModeRule|Get-NetIPsecMainModeSA|Get-NetIPsecPhase1AuthSet|Get-NetIPsecPhase2AuthSet|Get-NetIPsecQuickModeCryptoSet|Get-NetIPsecQuickModeSA|Get-NetIPsecRule|New-NetFirewallRule|New-NetIPsecDospSetting|New-NetIPsecMainModeCryptoSet|New-NetIPsecMainModeRule|New-NetIPsecPhase1AuthSet|New-NetIPsecPhase2AuthSet|New-NetIPsecQuickModeCryptoSet|New-NetIPsecRule|Open-NetGPO|Remove-NetFirewallRule|Remove-NetIPsecDospSetting|Remove-NetIPsecMainModeCryptoSet|Remove-NetIPsecMainModeRule|Remove-NetIPsecMainModeSA|Remove-NetIPsecPhase1AuthSet|Remove-NetIPsecPhase2AuthSet|Remove-NetIPsecQuickModeCryptoSet|Remove-NetIPsecQuickModeSA|Remove-NetIPsecRule|Rename-NetFirewallRule|Rename-NetIPsecMainModeCryptoSet|Rename-NetIPsecMainModeRule|Rename-NetIPsecPhase1AuthSet|Rename-NetIPsecPhase2AuthSet|Rename-NetIPsecQuickModeCryptoSet|Rename-NetIPsecRule|Save-NetGPO|Set-NetFirewallAddressFilter|Set-NetFirewallApplicationFilter|Set-NetFirewallInterfaceFilter|Set-NetFirewallInterfaceTypeFilter|Set-NetFirewallPortFilter|Set-NetFirewallProfile|Set-NetFirewallRule|Set-NetFirewallSecurityFilter|Set-NetFirewallServiceFilter|Set-NetFirewallSetting|Set-NetIPsecDospSetting|Set-NetIPsecMainModeCryptoSet|Set-NetIPsecMainModeRule|Set-NetIPsecPhase1AuthSet|Set-NetIPsecPhase2AuthSet|Set-NetIPsecQuickModeCryptoSet|Set-NetIPsecRule|Show-NetFirewallRule|Show-NetIPsecRule|Sync-NetIPsecRule|Update-NetIPsecRule|Get-DAPolicyChange|New-NetIPsecAuthProposal|New-NetIPsecMainModeCryptoProposal|New-NetIPsecQuickModeCryptoProposal|Add-NetSwitchTeamMember|Get-NetSwitchTeam|Get-NetSwitchTeamMember|New-NetSwitchTeam|Remove-NetSwitchTeam|Remove-NetSwitchTeamMember|Rename-NetSwitchTeam|Find-NetRoute|Get-NetCompartment|Get-NetIPAddress|Get-NetIPConfiguration|Get-NetIPInterface|Get-NetIPv4Protocol|Get-NetIPv6Protocol|Get-NetNeighbor|Get-NetOffloadGlobalSetting|Get-NetPrefixPolicy|Get-NetRoute|Get-NetTCPConnection|Get-NetTCPSetting|Get-NetTransportFilter|Get-NetUDPEndpoint|Get-NetUDPSetting|New-NetIPAddress|New-NetNeighbor|New-NetRoute|New-NetTransportFilter|Remove-NetIPAddress|Remove-NetNeighbor|Remove-NetRoute|Remove-NetTransportFilter|Set-NetIPAddress|Set-NetIPInterface|Set-NetIPv4Protocol|Set-NetIPv6Protocol|Set-NetNeighbor|Set-NetOffloadGlobalSetting|Set-NetRoute|Set-NetTCPSetting|Set-NetUDPSetting|Test-NetConnection|Get-DAConnectionStatus|Get-NCSIPolicyConfiguration|Reset-NCSIPolicyConfiguration|Set-NCSIPolicyConfiguration|Disable-NetworkSwitchEthernetPort|Disable-NetworkSwitchFeature|Disable-NetworkSwitchVlan|Enable-NetworkSwitchEthernetPort|Enable-NetworkSwitchFeature|Enable-NetworkSwitchVlan|Get-NetworkSwitchEthernetPort|Get-NetworkSwitchFeature|Get-NetworkSwitchGlobalData|Get-NetworkSwitchVlan|New-NetworkSwitchVlan|Remove-NetworkSwitchEthernetPortIPAddress|Remove-NetworkSwitchVlan|Restore-NetworkSwitchConfiguration|Save-NetworkSwitchConfiguration|Set-NetworkSwitchEthernetPortIPAddress|Set-NetworkSwitchPortMode|Set-NetworkSwitchPortProperty|Set-NetworkSwitchVlanProperty|Add-NetIPHttpsCertBinding|Disable-NetDnsTransitionConfiguration|Disable-NetIPHttpsProfile|Disable-NetNatTransitionConfiguration|Enable-NetDnsTransitionConfiguration|Enable-NetIPHttpsProfile|Enable-NetNatTransitionConfiguration|Get-Net6to4Configuration|Get-NetDnsTransitionConfiguration|Get-NetDnsTransitionMonitoring|Get-NetIPHttpsConfiguration|Get-NetIPHttpsState|Get-NetIsatapConfiguration|Get-NetNatTransitionConfiguration|Get-NetNatTransitionMonitoring|Get-NetTeredoConfiguration|Get-NetTeredoState|New-NetIPHttpsConfiguration|New-NetNatTransitionConfiguration|Remove-NetIPHttpsCertBinding|Remove-NetIPHttpsConfiguration|Remove-NetNatTransitionConfiguration|Rename-NetIPHttpsConfiguration|Reset-Net6to4Configuration|Reset-NetDnsTransitionConfiguration|Reset-NetIPHttpsConfiguration|Reset-NetIsatapConfiguration|Reset-NetTeredoConfiguration|Set-Net6to4Configuration|Set-NetDnsTransitionConfiguration|Set-NetIPHttpsConfiguration|Set-NetIsatapConfiguration|Set-NetNatTransitionConfiguration|Set-NetTeredoConfiguration|Find-Package|Find-PackageProvider|Get-Package|Get-PackageProvider|Get-PackageSource|Import-PackageProvider|Install-Package|Install-PackageProvider|Register-PackageSource|Save-Package|Set-PackageSource|Uninstall-Package|Unregister-PackageSource|Clear-PcsvDeviceLog|Get-PcsvDevice|Get-PcsvDeviceLog|Restart-PcsvDevice|Set-PcsvDeviceBootConfiguration|Set-PcsvDeviceNetworkConfiguration|Set-PcsvDeviceUserPassword|Start-PcsvDevice|Stop-PcsvDevice|AfterAll|AfterEach|Assert-MockCalled|Assert-VerifiableMocks|BeforeAll|BeforeEach|Context|Describe|Get-MockDynamicParameters|Get-TestDriveItem|In|InModuleScope|Invoke-Mock|Invoke-Pester|It|Mock|New-Fixture|Set-DynamicParameterVariables|Setup|Should|Add-CertificateEnrollmentPolicyServer|Export-Certificate|Export-PfxCertificate|Get-Certificate|Get-CertificateAutoEnrollmentPolicy|Get-CertificateEnrollmentPolicyServer|Get-CertificateNotificationTask|Get-PfxData|Import-Certificate|Import-PfxCertificate|New-CertificateNotificationTask|New-SelfSignedCertificate|Remove-CertificateEnrollmentPolicyServer|Remove-CertificateNotificationTask|Set-CertificateAutoEnrollmentPolicy|Switch-Certificate|Test-Certificate|Disable-PnpDevice|Enable-PnpDevice|Get-PnpDevice|Get-PnpDeviceProperty|Find-DscResource|Find-Module|Find-Script|Get-InstalledModule|Get-InstalledScript|Get-PSRepository|Install-Module|Install-Script|New-ScriptFileInfo|Publish-Module|Publish-Script|Register-PSRepository|Save-Module|Save-Script|Set-PSRepository|Test-ScriptFileInfo|Uninstall-Module|Uninstall-Script|Unregister-PSRepository|Update-Module|Update-ModuleManifest|Update-Script|Update-ScriptFileInfo|Add-Printer|Add-PrinterDriver|Add-PrinterPort|Get-PrintConfiguration|Get-Printer|Get-PrinterDriver|Get-PrinterPort|Get-PrinterProperty|Get-PrintJob|Read-PrinterNfcTag|Remove-Printer|Remove-PrinterDriver|Remove-PrinterPort|Remove-PrintJob|Rename-Printer|Restart-PrintJob|Resume-PrintJob|Set-PrintConfiguration|Set-Printer|Set-PrinterProperty|Suspend-PrintJob|Write-PrinterNfcTag|Configuration|Disable-DscDebug|Enable-DscDebug|Get-DscConfiguration|Get-DscConfigurationStatus|Get-DscLocalConfigurationManager|Get-DscResource|New-DscChecksum|Remove-DscConfigurationDocument|Restore-DscConfiguration|Stop-DscConfiguration|Invoke-DscResource|Publish-DscConfiguration|Set-DscLocalConfigurationManager|Start-DscConfiguration|Test-DscConfiguration|Update-DscConfiguration|Disable-PSTrace|Disable-PSWSManCombinedTrace|Disable-WSManTrace|Enable-PSTrace|Enable-PSWSManCombinedTrace|Enable-WSManTrace|Get-LogProperties|Set-LogProperties|Start-Trace|Stop-Trace|PSConsoleHostReadline|Get-PSReadlineKeyHandler|Get-PSReadlineOption|Remove-PSReadlineKeyHandler|Set-PSReadlineKeyHandler|Set-PSReadlineOption|Add-JobTrigger|Disable-JobTrigger|Disable-ScheduledJob|Enable-JobTrigger|Enable-ScheduledJob|Get-JobTrigger|Get-ScheduledJob|Get-ScheduledJobOption|New-JobTrigger|New-ScheduledJobOption|Register-ScheduledJob|Remove-JobTrigger|Set-JobTrigger|Set-ScheduledJob|Set-ScheduledJobOption|Unregister-ScheduledJob|New-PSWorkflowSession|New-PSWorkflowExecutionOption|Invoke-AsWorkflow|Disable-ScheduledTask|Enable-ScheduledTask|Export-ScheduledTask|Get-ClusteredScheduledTask|Get-ScheduledTask|Get-ScheduledTaskInfo|New-ScheduledTask|New-ScheduledTaskAction|New-ScheduledTaskPrincipal|New-ScheduledTaskSettingsSet|New-ScheduledTaskTrigger|Register-ClusteredScheduledTask|Register-ScheduledTask|Set-ClusteredScheduledTask|Set-ScheduledTask|Start-ScheduledTask|Stop-ScheduledTask|Unregister-ClusteredScheduledTask|Unregister-ScheduledTask|Confirm-SecureBootUEFI|Format-SecureBootUEFI|Get-SecureBootPolicy|Get-SecureBootUEFI|Set-SecureBootUEFI|Block-SmbShareAccess|Close-SmbOpenFile|Close-SmbSession|Disable-SmbDelegation|Enable-SmbDelegation|Get-SmbBandwidthLimit|Get-SmbClientConfiguration|Get-SmbClientNetworkInterface|Get-SmbConnection|Get-SmbDelegation|Get-SmbMapping|Get-SmbMultichannelConnection|Get-SmbMultichannelConstraint|Get-SmbOpenFile|Get-SmbServerConfiguration|Get-SmbServerNetworkInterface|Get-SmbSession|Get-SmbShare|Get-SmbShareAccess|Grant-SmbShareAccess|New-SmbMapping|New-SmbMultichannelConstraint|New-SmbShare|Remove-SmbBandwidthLimit|Remove-SmbMapping|Remove-SmbMultichannelConstraint|Remove-SmbShare|Revoke-SmbShareAccess|Set-SmbBandwidthLimit|Set-SmbClientConfiguration|Set-SmbPathAcl|Set-SmbServerConfiguration|Set-SmbShare|Unblock-SmbShareAccess|Update-SmbMultichannelConnection|Move-SmbClient|Get-SmbWitnessClient|Move-SmbWitnessClient|Get-StartApps|Export-StartLayout|Import-StartLayout|Disable-PhysicalDiskIndication|Disable-StorageDiagnosticLog|Enable-PhysicalDiskIndication|Enable-StorageDiagnosticLog|Flush-Volume|Get-DiskSNV|Get-PhysicalDiskSNV|Get-StorageEnclosureSNV|Initialize-Volume|Write-FileSystemCache|Add-InitiatorIdToMaskingSet|Add-PartitionAccessPath|Add-PhysicalDisk|Add-TargetPortToMaskingSet|Add-VirtualDiskToMaskingSet|Block-FileShareAccess|Clear-Disk|Clear-FileStorageTier|Clear-StorageDiagnosticInfo|Connect-VirtualDisk|Debug-FileShare|Debug-StorageSubSystem|Debug-Volume|Disable-PhysicalDiskIdentification|Disable-StorageEnclosureIdentification|Disable-StorageHighAvailability|Disconnect-VirtualDisk|Dismount-DiskImage|Enable-PhysicalDiskIdentification|Enable-StorageEnclosureIdentification|Enable-StorageHighAvailability|Format-Volume|Get-DedupProperties|Get-Disk|Get-DiskImage|Get-DiskStorageNodeView|Get-FileIntegrity|Get-FileShare|Get-FileShareAccessControlEntry|Get-FileStorageTier|Get-InitiatorId|Get-InitiatorPort|Get-MaskingSet|Get-OffloadDataTransferSetting|Get-Partition|Get-PartitionSupportedSize|Get-PhysicalDisk|Get-PhysicalDiskStorageNodeView|Get-ResiliencySetting|Get-StorageAdvancedProperty|Get-StorageDiagnosticInfo|Get-StorageEnclosure|Get-StorageEnclosureStorageNodeView|Get-StorageEnclosureVendorData|Get-StorageFaultDomain|Get-StorageFileServer|Get-StorageFirmwareInformation|Get-StorageHealthAction|Get-StorageHealthReport|Get-StorageHealthSetting|Get-StorageJob|Get-StorageNode|Get-StoragePool|Get-StorageProvider|Get-StorageReliabilityCounter|Get-StorageSetting|Get-StorageSubSystem|Get-StorageTier|Get-StorageTierSupportedSize|Get-SupportedClusterSizes|Get-SupportedFileSystems|Get-TargetPort|Get-TargetPortal|Get-VirtualDisk|Get-VirtualDiskSupportedSize|Get-Volume|Get-VolumeCorruptionCount|Get-VolumeScrubPolicy|Grant-FileShareAccess|Hide-VirtualDisk|Initialize-Disk|Mount-DiskImage|New-FileShare|New-MaskingSet|New-Partition|New-StorageFileServer|New-StoragePool|New-StorageSubsystemVirtualDisk|New-StorageTier|New-VirtualDisk|New-VirtualDiskClone|New-VirtualDiskSnapshot|New-Volume|Optimize-StoragePool|Optimize-Volume|Register-StorageSubsystem|Remove-FileShare|Remove-InitiatorId|Remove-InitiatorIdFromMaskingSet|Remove-MaskingSet|Remove-Partition|Remove-PartitionAccessPath|Remove-PhysicalDisk|Remove-StorageFileServer|Remove-StorageHealthSetting|Remove-StoragePool|Remove-StorageTier|Remove-TargetPortFromMaskingSet|Remove-VirtualDisk|Remove-VirtualDiskFromMaskingSet|Rename-MaskingSet|Repair-FileIntegrity|Repair-VirtualDisk|Repair-Volume|Reset-PhysicalDisk|Reset-StorageReliabilityCounter|Resize-Partition|Resize-StorageTier|Resize-VirtualDisk|Revoke-FileShareAccess|Set-Disk|Set-FileIntegrity|Set-FileShare|Set-FileStorageTier|Set-InitiatorPort|Set-Partition|Set-PhysicalDisk|Set-ResiliencySetting|Set-StorageFileServer|Set-StorageHealthSetting|Set-StoragePool|Set-StorageProvider|Set-StorageSetting|Set-StorageSubSystem|Set-StorageTier|Set-VirtualDisk|Set-Volume|Set-VolumeScrubPolicy|Show-VirtualDisk|Start-StorageDiagnosticLog|Stop-StorageDiagnosticLog|Stop-StorageJob|Unblock-FileShareAccess|Unregister-StorageSubsystem|Update-Disk|Update-HostStorageCache|Update-StorageFirmware|Update-StoragePool|Update-StorageProviderCache|Write-VolumeCache|Disable-TlsCipherSuite|Disable-TlsSessionTicketKey|Enable-TlsCipherSuite|Enable-TlsSessionTicketKey|Export-TlsSessionTicketKey|Get-TlsCipherSuite|New-TlsSessionTicketKey|Get-TroubleshootingPack|Invoke-TroubleshootingPack|Clear-Tpm|ConvertTo-TpmOwnerAuth|Disable-TpmAutoProvisioning|Enable-TpmAutoProvisioning|Get-Tpm|Get-TpmEndorsementKeyInfo|Get-TpmSupportedFeature|Import-TpmOwnerAuth|Initialize-Tpm|Set-TpmOwnerAuth|Unblock-Tpm|Add-VpnConnection|Add-VpnConnectionRoute|Add-VpnConnectionTriggerApplication|Add-VpnConnectionTriggerDnsConfiguration|Add-VpnConnectionTriggerTrustedNetwork|Get-VpnConnection|Get-VpnConnectionTrigger|New-EapConfiguration|New-VpnServerAddress|Remove-VpnConnection|Remove-VpnConnectionRoute|Remove-VpnConnectionTriggerApplication|Remove-VpnConnectionTriggerDnsConfiguration|Remove-VpnConnectionTriggerTrustedNetwork|Set-VpnConnection|Set-VpnConnectionIPsecConfiguration|Set-VpnConnectionProxy|Set-VpnConnectionTriggerDnsConfiguration|Set-VpnConnectionTriggerTrustedNetwork|Add-OdbcDsn|Disable-OdbcPerfCounter|Disable-WdacBidTrace|Enable-OdbcPerfCounter|Enable-WdacBidTrace|Get-OdbcDriver|Get-OdbcDsn|Get-OdbcPerfCounter|Get-WdacBidTrace|Remove-OdbcDsn|Set-OdbcDriver|Set-OdbcDsn|Get-WindowsDeveloperLicense|Show-WindowsDeveloperLicenseRegistration|Unregister-WindowsDeveloperLicense|Disable-WindowsErrorReporting|Enable-WindowsErrorReporting|Get-WindowsErrorReporting|Get-WindowsSearchSetting|Set-WindowsSearchSetting|Get-WindowsUpdateLog",n=this.createKeywordMapper({"support.function":t,keyword:e},"identifier"),o="eq|ne|gt|lt|le|ge|like|notlike|match|notmatch|contains|notcontains|in|notin|band|bor|bxor|bnot|ceq|cne|cgt|clt|cle|cge|clike|cnotlike|cmatch|cnotmatch|ccontains|cnotcontains|cin|cnotin|ieq|ine|igt|ilt|ile|ige|ilike|inotlike|imatch|inotmatch|icontains|inotcontains|iin|inotin|and|or|xor|not|split|join|replace|f|csplit|creplace|isplit|ireplace|is|isnot|as|shl|shr";this.$rules={start:[{token:"comment",regex:"#.*$"},{token:"comment.start",regex:"<#",next:"comment"},{token:"string",regex:'["](?:(?:\\\\.)|(?:[^"\\\\]))*?["]'},{token:"string",regex:"['](?:(?:\\\\.)|(?:[^'\\\\]))*?[']"},{token:"constant.numeric",regex:"0[xX][0-9a-fA-F]+\\b"},{token:"constant.numeric",regex:"[+-]?\\d+(?:(?:\\.\\d*)?(?:[eE][+-]?\\d+)?)?\\b"},{token:"constant.language.boolean",regex:"[$](?:[Tt]rue|[Ff]alse)\\b"},{token:"constant.language",regex:"[$][Nn]ull\\b"},{token:"variable.instance",regex:"[$][a-zA-Z][a-zA-Z0-9_]*\\b"},{token:n,regex:"[a-zA-Z_$][a-zA-Z0-9_$\\-]*\\b"},{token:"keyword.operator",regex:"\\-(?:"+o+")"},{token:"keyword.operator",regex:"&|\\+|\\-|\\*|\\/|\\%|\\=|\\>|\\&|\\!|\\|"},{token:"lparen",regex:"[[({]"},{token:"rparen",regex:"[\\])}]"},{token:"text",regex:"\\s+"}],comment:[{token:"comment.end",regex:"#>",next:"start"},{token:"doc.comment.tag",regex:"^\\.\\w+"},{defaultToken:"comment"}]}};o.inherits(i,r),t.PowershellHighlightRules=i}),ace.define("ace/mode/matching_brace_outdent",["require","exports","module","ace/range"],function(e,t,n){"use strict";var o=e("../range").Range,r=function(){};(function(){this.checkOutdent=function(e,t){return/^\s+$/.test(e)?/^\s*\}/.test(t):!1},this.autoOutdent=function(e,t){var n=e.getLine(t),r=n.match(/^(\s*\})/);if(!r)return 0;var i=r[1].length,a=e.findMatchingBracket({row:t,column:i});if(!a||a.row==t)return 0;var s=this.$getIndent(e.getLine(a.row));e.replace(new o(t,0,t,i-1),s)},this.$getIndent=function(e){return e.match(/^\s*/)[0]}}).call(r.prototype),t.MatchingBraceOutdent=r}),ace.define("ace/mode/behaviour/cstyle",["require","exports","module","ace/lib/oop","ace/mode/behaviour","ace/token_iterator","ace/lib/lang"],function(e,t,n){"use strict";var o,r=e("../../lib/oop"),i=e("../behaviour").Behaviour,a=e("../../token_iterator").TokenIterator,s=e("../../lib/lang"),c=["text","paren.rparen","punctuation.operator"],l=["text","paren.rparen","punctuation.operator","comment"],d={},u=function(e){var t=-1;return e.multiSelect&&(t=e.selection.index,d.rangeCount!=e.multiSelect.rangeCount&&(d={rangeCount:e.multiSelect.rangeCount})),d[t]?o=d[t]:void(o=d[t]={autoInsertedBrackets:0,autoInsertedRow:-1,autoInsertedLineEnd:"",maybeInsertedBrackets:0,maybeInsertedRow:-1,maybeInsertedLineStart:"",maybeInsertedLineEnd:""})},S=function(e,t,n,o){var r=e.end.row-e.start.row;return{text:n+t+o,selection:[0,e.start.column+1,r,e.end.column+(r?0:1)]}},g=function(){this.add("braces","insertion",function(e,t,n,r,i){var a=n.getCursorPosition(),c=r.doc.getLine(a.row);if("{"==i){u(n);var l=n.getSelectionRange(),d=r.doc.getTextRange(l);if(""!==d&&"{"!==d&&n.getWrapBehavioursEnabled())return S(l,d,"{","}");if(g.isSaneInsertion(n,r))return/[\]\}\)]/.test(c[a.column])||n.inMultiSelectMode?(g.recordAutoInsert(n,r,"}"),{text:"{}",selection:[1,1]}):(g.recordMaybeInsert(n,r,"{"),{text:"{",selection:[1,1]})}else if("}"==i){u(n);var p=c.substring(a.column,a.column+1);if("}"==p){var m=r.$findOpeningBracket("}",{column:a.column+1,row:a.row});if(null!==m&&g.isAutoInsertedClosing(a,c,i))return g.popAutoInsertedClosing(),{text:"",selection:[1,1]}}}else{if("\n"==i||"\r\n"==i){u(n);var N="";g.isMaybeInsertedClosing(a,c)&&(N=s.stringRepeat("}",o.maybeInsertedBrackets),g.clearMaybeInsertedClosing());var p=c.substring(a.column,a.column+1);if("}"===p){var P=r.findMatchingBracket({row:a.row,column:a.column+1},"}");if(!P)return null;var C=this.$getIndent(r.getLine(P.row))}else{if(!N)return void g.clearMaybeInsertedClosing();var C=this.$getIndent(c)}var v=C+r.getTabString();return{text:"\n"+v+"\n"+C+N,selection:[1,v.length,1,v.length]}}g.clearMaybeInsertedClosing()}}),this.add("braces","deletion",function(e,t,n,r,i){var a=r.doc.getTextRange(i);if(!i.isMultiLine()&&"{"==a){u(n);var s=r.doc.getLine(i.start.row),c=s.substring(i.end.column,i.end.column+1);if("}"==c)return i.end.column++,i;o.maybeInsertedBrackets--}}),this.add("parens","insertion",function(e,t,n,o,r){if("("==r){u(n);var i=n.getSelectionRange(),a=o.doc.getTextRange(i);if(""!==a&&n.getWrapBehavioursEnabled())return S(i,a,"(",")");if(g.isSaneInsertion(n,o))return g.recordAutoInsert(n,o,")"),{text:"()",selection:[1,1]}}else if(")"==r){u(n);var s=n.getCursorPosition(),c=o.doc.getLine(s.row),l=c.substring(s.column,s.column+1);if(")"==l){var d=o.$findOpeningBracket(")",{column:s.column+1,row:s.row});if(null!==d&&g.isAutoInsertedClosing(s,c,r))return g.popAutoInsertedClosing(),{text:"",selection:[1,1]}}}}),this.add("parens","deletion",function(e,t,n,o,r){var i=o.doc.getTextRange(r);if(!r.isMultiLine()&&"("==i){u(n);var a=o.doc.getLine(r.start.row),s=a.substring(r.start.column+1,r.start.column+2);if(")"==s)return r.end.column++,r}}),this.add("brackets","insertion",function(e,t,n,o,r){if("["==r){u(n);var i=n.getSelectionRange(),a=o.doc.getTextRange(i);if(""!==a&&n.getWrapBehavioursEnabled())return S(i,a,"[","]");if(g.isSaneInsertion(n,o))return g.recordAutoInsert(n,o,"]"),{text:"[]",selection:[1,1]}}else if("]"==r){u(n);var s=n.getCursorPosition(),c=o.doc.getLine(s.row),l=c.substring(s.column,s.column+1);if("]"==l){var d=o.$findOpeningBracket("]",{
column:s.column+1,row:s.row});if(null!==d&&g.isAutoInsertedClosing(s,c,r))return g.popAutoInsertedClosing(),{text:"",selection:[1,1]}}}}),this.add("brackets","deletion",function(e,t,n,o,r){var i=o.doc.getTextRange(r);if(!r.isMultiLine()&&"["==i){u(n);var a=o.doc.getLine(r.start.row),s=a.substring(r.start.column+1,r.start.column+2);if("]"==s)return r.end.column++,r}}),this.add("string_dquotes","insertion",function(e,t,n,o,r){if('"'==r||"'"==r){u(n);var i=r,a=n.getSelectionRange(),s=o.doc.getTextRange(a);if(""!==s&&"'"!==s&&'"'!=s&&n.getWrapBehavioursEnabled())return S(a,s,i,i);if(!s){var c=n.getCursorPosition(),l=o.doc.getLine(c.row),d=l.substring(c.column-1,c.column),g=l.substring(c.column,c.column+1),p=o.getTokenAt(c.row,c.column),m=o.getTokenAt(c.row,c.column+1);if("\\"==d&&p&&/escape/.test(p.type))return null;var N,P=p&&/string|escape/.test(p.type),C=!m||/string|escape/.test(m.type);if(g==i)N=P!==C;else{if(P&&!C)return null;if(P&&C)return null;var v=o.$mode.tokenRe;v.lastIndex=0;var b=v.test(d);v.lastIndex=0;var h=v.test(d);if(b||h)return null;if(g&&!/[\s;,.})\]\\]/.test(g))return null;N=!0}return{text:N?i+i:"",selection:[1,1]}}}}),this.add("string_dquotes","deletion",function(e,t,n,o,r){var i=o.doc.getTextRange(r);if(!r.isMultiLine()&&('"'==i||"'"==i)){u(n);var a=o.doc.getLine(r.start.row),s=a.substring(r.start.column+1,r.start.column+2);if(s==i)return r.end.column++,r}})};g.isSaneInsertion=function(e,t){var n=e.getCursorPosition(),o=new a(t,n.row,n.column);if(!this.$matchTokenType(o.getCurrentToken()||"text",c)){var r=new a(t,n.row,n.column+1);if(!this.$matchTokenType(r.getCurrentToken()||"text",c))return!1}return o.stepForward(),o.getCurrentTokenRow()!==n.row||this.$matchTokenType(o.getCurrentToken()||"text",l)},g.$matchTokenType=function(e,t){return t.indexOf(e.type||e)>-1},g.recordAutoInsert=function(e,t,n){var r=e.getCursorPosition(),i=t.doc.getLine(r.row);this.isAutoInsertedClosing(r,i,o.autoInsertedLineEnd[0])||(o.autoInsertedBrackets=0),o.autoInsertedRow=r.row,o.autoInsertedLineEnd=n+i.substr(r.column),o.autoInsertedBrackets++},g.recordMaybeInsert=function(e,t,n){var r=e.getCursorPosition(),i=t.doc.getLine(r.row);this.isMaybeInsertedClosing(r,i)||(o.maybeInsertedBrackets=0),o.maybeInsertedRow=r.row,o.maybeInsertedLineStart=i.substr(0,r.column)+n,o.maybeInsertedLineEnd=i.substr(r.column),o.maybeInsertedBrackets++},g.isAutoInsertedClosing=function(e,t,n){return o.autoInsertedBrackets>0&&e.row===o.autoInsertedRow&&n===o.autoInsertedLineEnd[0]&&t.substr(e.column)===o.autoInsertedLineEnd},g.isMaybeInsertedClosing=function(e,t){return o.maybeInsertedBrackets>0&&e.row===o.maybeInsertedRow&&t.substr(e.column)===o.maybeInsertedLineEnd&&t.substr(0,e.column)==o.maybeInsertedLineStart},g.popAutoInsertedClosing=function(){o.autoInsertedLineEnd=o.autoInsertedLineEnd.substr(1),o.autoInsertedBrackets--},g.clearMaybeInsertedClosing=function(){o&&(o.maybeInsertedBrackets=0,o.maybeInsertedRow=-1)},r.inherits(g,i),t.CstyleBehaviour=g}),ace.define("ace/mode/folding/cstyle",["require","exports","module","ace/lib/oop","ace/range","ace/mode/folding/fold_mode"],function(e,t,n){"use strict";var o=e("../../lib/oop"),r=e("../../range").Range,i=e("./fold_mode").FoldMode,a=t.FoldMode=function(e){e&&(this.foldingStartMarker=new RegExp(this.foldingStartMarker.source.replace(/\|[^|]*?$/,"|"+e.start)),this.foldingStopMarker=new RegExp(this.foldingStopMarker.source.replace(/\|[^|]*?$/,"|"+e.end)))};o.inherits(a,i),function(){this.foldingStartMarker=/(\{|\[)[^\}\]]*$|^\s*(\/\*)/,this.foldingStopMarker=/^[^\[\{]*(\}|\])|^[\s\*]*(\*\/)/,this.singleLineBlockCommentRe=/^\s*(\/\*).*\*\/\s*$/,this.tripleStarBlockCommentRe=/^\s*(\/\*\*\*).*\*\/\s*$/,this.startRegionRe=/^\s*(\/\*|\/\/)#?region\b/,this._getFoldWidgetBase=this.getFoldWidget,this.getFoldWidget=function(e,t,n){var o=e.getLine(n);if(this.singleLineBlockCommentRe.test(o)&&!this.startRegionRe.test(o)&&!this.tripleStarBlockCommentRe.test(o))return"";var r=this._getFoldWidgetBase(e,t,n);return!r&&this.startRegionRe.test(o)?"start":r},this.getFoldWidgetRange=function(e,t,n,o){var r=e.getLine(n);if(this.startRegionRe.test(r))return this.getCommentRegionBlock(e,r,n);var i=r.match(this.foldingStartMarker);if(i){var a=i.index;if(i[1])return this.openingBracketBlock(e,i[1],n,a);var s=e.getCommentFoldRange(n,a+i[0].length,1);return s&&!s.isMultiLine()&&(o?s=this.getSectionRange(e,n):"all"!=t&&(s=null)),s}if("markbegin"!==t){var i=r.match(this.foldingStopMarker);if(i){var a=i.index+i[0].length;return i[1]?this.closingBracketBlock(e,i[1],n,a):e.getCommentFoldRange(n,a,-1)}}},this.getSectionRange=function(e,t){var n=e.getLine(t),o=n.search(/\S/),i=t,a=n.length;t+=1;for(var s=t,c=e.getLength();++t<c;){n=e.getLine(t);var l=n.search(/\S/);if(-1!==l){if(o>l)break;var d=this.getFoldWidgetRange(e,"all",t);if(d){if(d.start.row<=i)break;if(d.isMultiLine())t=d.end.row;else if(o==l)break}s=t}}return new r(i,a,s,e.getLine(s).length)},this.getCommentRegionBlock=function(e,t,n){for(var o=t.search(/\s*$/),i=e.getLength(),a=n,s=/^\s*(?:\/\*|\/\/|--)#?(end)?region\b/,c=1;++n<i;){t=e.getLine(n);var l=s.exec(t);if(l&&(l[1]?c--:c++,!c))break}var d=n;return d>a?new r(a,o,d,t.length):void 0}}.call(a.prototype)}),ace.define("ace/mode/powershell",["require","exports","module","ace/lib/oop","ace/mode/text","ace/mode/powershell_highlight_rules","ace/mode/matching_brace_outdent","ace/mode/behaviour/cstyle","ace/mode/folding/cstyle"],function(e,t,n){"use strict";var o=e("../lib/oop"),r=e("./text").Mode,i=e("./powershell_highlight_rules").PowershellHighlightRules,a=e("./matching_brace_outdent").MatchingBraceOutdent,s=e("./behaviour/cstyle").CstyleBehaviour,c=e("./folding/cstyle").FoldMode,l=function(){this.HighlightRules=i,this.$outdent=new a,this.$behaviour=new s,this.foldingRules=new c({start:"^\\s*(<#)",end:"^[#\\s]>\\s*$"})};o.inherits(l,r),function(){this.lineCommentStart="#",this.blockComment={start:"<#",end:"#>"},this.getNextLineIndent=function(e,t,n){var o=this.$getIndent(t),r=this.getTokenizer().getLineTokens(t,e),i=r.tokens;if(i.length&&"comment"==i[i.length-1].type)return o;if("start"==e){var a=t.match(/^.*[\{\(\[]\s*$/);a&&(o+=n)}return o},this.checkOutdent=function(e,t,n){return this.$outdent.checkOutdent(t,n)},this.autoOutdent=function(e,t,n){this.$outdent.autoOutdent(t,n)},this.createWorker=function(e){return null},this.$id="ace/mode/powershell"}.call(l.prototype),t.Mode=l});