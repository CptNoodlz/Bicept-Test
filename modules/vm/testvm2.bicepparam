param location string = resourceGroup().location


using main.bicep

param vmconfigs array = [
    {

        name: // VM Name
        adminUsername: // Admin Username
        imageReference: {
            offer: // Image Offer
            publisher: // Image Publisher
            sku: // Image SKU
            version: 'latest'
        }
        nicConfigurations: [
            {
            ipConfigurations: [
                {
                name: // IP Config Name
                subnetResourceId: // Subnet Resource ID
                }
            ]
            nicSuffix: // NIC Suffix
            }
        ]
        osDisk: {
            caching: // OS Disk Caching
            diskSizeGB: // OS Disk Size GB
            managedDisk: {
            storageAccountType: // Storage Account Type
            }
        }
        osType: // OS Type
        vmSize: // VM Size
        zone: // Zone
        disablePasswordAuthentication: // Disable Password Authentication
        location: // Location
        publicKeys: [
            {
            keyData: // SSH Key Data
            path: // SSH Key Path
            }
        ]

    }
