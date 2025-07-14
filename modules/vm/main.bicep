
resource vms 'Microsoft.Compute/virtualMachines@2022-11-01' = [for vm in vmConfigs: {
    name: vm.name
    location: location
    properties: {
        hardwareProfile: {
            vmSize: vm.memoryGB <= 4 ? 'Standard_DS2_v2' : 'Standard_DS3_v2'
        }
        storageProfile: {
            osDisk: {
                createOption: 'FromImage'
            }
            imageReference: vm.osType == 'Windows' ? {
                publisher: 'MicrosoftWindowsServer'
                offer: 'WindowsServer'
                sku: '2019-Datacenter'
                version: 'latest'
            } : {
                publisher: 'Canonical'
                offer: 'UbuntuServer'
                sku: '18.04-LTS'
                version: 'latest'
            }
        }
        osProfile: {
            computerName: vm.name
            adminUsername: 'azureuser'
            adminPassword: 'P@ssw0rd1234!'
        }
        networkProfile: {
            networkInterfaces: [
                {
                    id: resourceId('Microsoft.Network/networkInterfaces', '${vm.name}-nic')
                }
            ]
        }
    }
}]

