param location string
param vnetName string
param vnetAddressPrefix string
param subnetName1 string
param subnetAddressPrefix1 string
param subnetName2 string
param subnetAddressPrefix2 string

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
    subnets: [
      {
        name: subnetName1
        properties: {
          addressPrefix: subnetAddressPrefix1
        }
      }
      {
        name: subnetName2
        properties: {
          addressPrefix: subnetAddressPrefix2
        }
      }
    ]
  }
}

