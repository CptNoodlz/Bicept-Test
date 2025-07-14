module virtualMachine 'br/public:avm/res/compute/virtual-machine:<version>' = [for vm in vmconfigs:{
  
  name: 'virtualMachineDeployment'
  params: {
    // Required parameters
    adminUsername: 'VMAdmin'
    availabilityZone: 2
    imageReference: {
      offer: 'WindowsServer'
      publisher: 'MicrosoftWindowsServer'
      sku: '2019-datacenter'
      version: 'latest'
    }
    name: 'cvmwinwaf'
    nicConfigurations: [
      {
        deleteOption: 'Delete'
        diagnosticSettings: [
          {
            eventHubAuthorizationRuleResourceId: '<eventHubAuthorizationRuleResourceId>'
            eventHubName: '<eventHubName>'
            metricCategories: [
              {
                category: 'AllMetrics'
              }
            ]
            name: 'customSetting'
            storageAccountResourceId: '<storageAccountResourceId>'
            workspaceResourceId: '<workspaceResourceId>'
          }
        ]
        ipConfigurations: [
          {
            applicationSecurityGroups: [
              {
                id: '<id>'
              }
            ]
            diagnosticSettings: [
              {
                eventHubAuthorizationRuleResourceId: '<eventHubAuthorizationRuleResourceId>'
                eventHubName: '<eventHubName>'
                metricCategories: [
                  {
                    category: 'AllMetrics'
                  }
                ]
                name: 'customSetting'
                storageAccountResourceId: '<storageAccountResourceId>'
                workspaceResourceId: '<workspaceResourceId>'
              }
            ]
            loadBalancerBackendAddressPools: [
              {
                id: '<id>'
              }
            ]
            name: 'ipconfig01'
            pipConfiguration: {
              publicIpNameSuffix: '-pip-01'
              roleAssignments: [
                {
                  principalId: '<principalId>'
                  principalType: 'ServicePrincipal'
                  roleDefinitionIdOrName: 'Reader'
                }
              ]
              zones: [
                1
                2
                3
              ]
            }
            subnetResourceId: '<subnetResourceId>'
          }
        ]
        nicSuffix: '-nic-01'
        roleAssignments: [
          {
            principalId: '<principalId>'
            principalType: 'ServicePrincipal'
            roleDefinitionIdOrName: 'Reader'
          }
        ]
      }
    ]
    osDisk: {
      caching: 'ReadWrite'
      createOption: 'FromImage'
      deleteOption: 'Delete'
      diskSizeGB: 128
      managedDisk: {
        storageAccountType: 'Premium_LRS'
      }
    }
    osType: 'Windows'
    vmSize: 'Standard_D2s_v3'
    // Non-required parameters
    adminPassword: '<adminPassword>'
    backupPolicyName: '<backupPolicyName>'
    backupVaultName: '<backupVaultName>'
    backupVaultResourceGroup: '<backupVaultResourceGroup>'
    bypassPlatformSafetyChecksOnUserSchedule: true
    computerName: 'winvm1'
    dataDisks: [
      {
        caching: 'ReadOnly'
        createOption: 'Empty'
        deleteOption: 'Delete'
        diskSizeGB: 128
        managedDisk: {
          storageAccountType: 'Premium_LRS'
        }
      }
      {
        caching: 'ReadOnly'
        createOption: 'Empty'
        deleteOption: 'Delete'
        diskSizeGB: 128
        managedDisk: {
          storageAccountType: 'Premium_LRS'
        }
      }
    ]
    enableAutomaticUpdates: true
    encryptionAtHost: false
    extensionAadJoinConfig: {
      enabled: true
      tags: {
        Environment: 'Non-Prod'
        'hidden-title': 'This is visible in the resource name'
        Role: 'DeploymentValidation'
      }
    }
    extensionAntiMalwareConfig: {
      enabled: true
      settings: {
        AntimalwareEnabled: 'true'
        Exclusions: {
          Extensions: '.ext1;.ext2'
          Paths: 'c:\\excluded-path-1;c:\\excluded-path-2'
          Processes: 'excludedproc1.exe;excludedproc2.exe'
        }
        RealtimeProtectionEnabled: 'true'
        ScheduledScanSettings: {
          day: '7'
          isEnabled: 'true'
          scanType: 'Quick'
          time: '120'
        }
      }
      tags: {
        Environment: 'Non-Prod'
        'hidden-title': 'This is visible in the resource name'
        Role: 'DeploymentValidation'
      }
    }
    extensionAzureDiskEncryptionConfig: {
      enabled: true
      settings: {
        EncryptionOperation: 'EnableEncryption'
        KekVaultResourceId: '<KekVaultResourceId>'
        KeyEncryptionAlgorithm: 'RSA-OAEP'
        KeyEncryptionKeyURL: '<KeyEncryptionKeyURL>'
        KeyVaultResourceId: '<KeyVaultResourceId>'
        KeyVaultURL: '<KeyVaultURL>'
        ResizeOSDisk: 'false'
        tags: {
          Environment: 'Non-Prod'
          'hidden-title': 'This is visible in the resource name'
          Role: 'DeploymentValidation'
        }
        VolumeType: 'All'
      }
    }
    extensionCustomScriptConfig: {
      enabled: true
      fileData: [
        {
          storageAccountId: '<storageAccountId>'
          uri: '<uri>'
        }
      ]
      tags: {
        Environment: 'Non-Prod'
        'hidden-title': 'This is visible in the resource name'
        Role: 'DeploymentValidation'
      }
    }
    extensionCustomScriptProtectedSetting: {
      commandToExecute: '<commandToExecute>'
    }
    extensionDependencyAgentConfig: {
      enableAMA: true
      enabled: true
      tags: {
        Environment: 'Non-Prod'
        'hidden-title': 'This is visible in the resource name'
        Role: 'DeploymentValidation'
      }
    }
    extensionDSCConfig: {
      enabled: true
      tags: {
        Environment: 'Non-Prod'
        'hidden-title': 'This is visible in the resource name'
        Role: 'DeploymentValidation'
      }
    }
    extensionMonitoringAgentConfig: {
      dataCollectionRuleAssociations: [
        {
          dataCollectionRuleResourceId: '<dataCollectionRuleResourceId>'
          name: 'SendMetricsToLAW'
        }
      ]
      enabled: true
      tags: {
        Environment: 'Non-Prod'
        'hidden-title': 'This is visible in the resource name'
        Role: 'DeploymentValidation'
      }
    }
    extensionNetworkWatcherAgentConfig: {
      enabled: true
      tags: {
        Environment: 'Non-Prod'
        'hidden-title': 'This is visible in the resource name'
        Role: 'DeploymentValidation'
      }
    }
    location: '<location>'
    maintenanceConfigurationResourceId: '<maintenanceConfigurationResourceId>'
    managedIdentities: {
      systemAssigned: true
      userAssignedResourceIds: [
        '<managedIdentityResourceId>'
      ]
    }
    patchMode: 'AutomaticByPlatform'
    proximityPlacementGroupResourceId: '<proximityPlacementGroupResourceId>'
    roleAssignments: [
      {
        principalId: '<principalId>'
        principalType: 'ServicePrincipal'
        roleDefinitionIdOrName: 'Owner'
      }
      {
        principalId: '<principalId>'
        principalType: 'ServicePrincipal'
        roleDefinitionIdOrName: 'b24988ac-6180-42a0-ab88-20f7382dd24c'
      }
      {
        principalId: '<principalId>'
        principalType: 'ServicePrincipal'
        roleDefinitionIdOrName: '<roleDefinitionIdOrName>'
      }
    ]
    tags: {
      Environment: 'Non-Prod'
      'hidden-title': 'This is visible in the resource name'
      Role: 'DeploymentValidation'
    }
  }
}
]
