$output=Invoke-RestMethod -Headers @{"Metadata"="true"} -Method GET -Uri "https://management.azure.com/subscriptions/71a57cf0-ee52-4110-a146-0df78a9725bf/resourceGroups/POC-DEV/providers/Microsoft.Compute/virtualMachines/POCDEV001?api-version=2023-03-01"

## As infrastucture is not available to test the above command, using a sample joson to get the output of each property.
$output= '{
  "name": "POCDEV001",
  "id": "/subscriptions/71a57cf0-ee52-4110-a146-0df78a9725bf/resourceGroups/POC-DEV/providers/Microsoft.Compute/virtualMachines/POCDEV001",
  "type": "Microsoft.Compute/virtualMachines",
  "location": "eastus",
  "tags": {
    "POC": "POCDEV001"
  },
  "properties": {
    "vmId": "d6e75c55-80ad-4568-92f9-1a3295b0f444",
    "hardwareProfile": {
      "vmSize": "Standard_D2s_v3"
    },
    "storageProfile": {
      "imageReference": {
        "publisher": "MicrosoftWindowsServer",
        "offer": "WindowsServer",
        "sku": "2019-datacenter-gensecond",
        "version": "latest",
        "exactVersion": "17763.4499.230621"
      },
      "osDisk": {
        "osType": "Windows",
        "name": "POCDEV001_disk1_7fe96c09d4ff4046842480fec5f05ec9",
        "createOption": "FromImage",
        "caching": "ReadWrite",
        "managedDisk": {
          "storageAccountType": "StandardSSD_LRS",
          "id": "/subscriptions/71a57cf0-ee52-4110-a146-0df78a9725bf/resourceGroups/POC-DEV/providers/Microsoft.Compute/disks/POCDEV001_disk1_7fe96c09d4ff4046842480fec5f05ec9"
        },
        "deleteOption": "Delete",
        "diskSizeGB": 127
      },
      "dataDisks": [
        {
          "lun": 0,
          "name": "POCDEV001_DataDisk_0",
          "createOption": "Attach",
          "caching": "ReadOnly",
          "writeAcceleratorEnabled": false,
          "managedDisk": {
            "storageAccountType": "Premium_LRS",
            "id": "/subscriptions/71a57cf0-ee52-4110-a146-0df78a9725bf/resourceGroups/POC-DEV/providers/Microsoft.Compute/disks/POCDEV001_DataDisk_0"
          },
          "deleteOption": "Delete",
          "diskSizeGB": 4,
          "toBeDetached": false
        }
      ],
      "diskControllerType": "SCSI"
    },
    "osProfile": {
      "computerName": "POCDEV001",
      "adminUsername": "nihar",
      "windowsConfiguration": {
        "provisionVMAgent": true,
        "enableAutomaticUpdates": true,
        "patchSettings": {
          "patchMode": "AutomaticByOS",
          "assessmentMode": "ImageDefault",
          "enableHotpatching": false
        },
        "enableVMAgentPlatformUpdates": false
      },
      "secrets": [],
      "allowExtensionOperations": true,
      "requireGuestProvisionSignal": true
    },
    "securityProfile": {
      "uefiSettings": {
        "secureBootEnabled": true,
        "vTpmEnabled": true
      },
      "securityType": "TrustedLaunch"
    },
    "networkProfile": {
      "networkInterfaces": [
        {
          "id": "/subscriptions/71a57cf0-ee52-4110-a146-0df78a9725bf/resourceGroups/POC-DEV/providers/Microsoft.Network/networkInterfaces/pocdev001168",
          "properties": {
            "deleteOption": "Delete"
          }
        }
      ]
    },
    "diagnosticsProfile": {
      "bootDiagnostics": {
        "enabled": true
      }
    },
    "provisioningState": "Succeeded",
    "timeCreated": "2023-07-07T09:52:38.8042376+00:00"
  }
}'

function get-JsonOutput {
    param (
        $object,
        $key
    )
    $object | ConvertFrom-Json | Format-Table -Property $key
}

$printkey= 'name'
get-JsonOutput $output $printkey

