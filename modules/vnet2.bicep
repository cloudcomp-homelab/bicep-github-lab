@description('Tweede (spoke/demo) Virtual Network, bv. voor peering of on-prem simulatie')
param vnet2Name string
param location string
param addressPrefixes array = [
  '10.1.0.0/16'
]
param tags object = {}

resource vnet2 'Microsoft.Network/virtualNetworks@2023-11-01' = {
  name: vnet2Name
  location: location
  tags: tags
  properties: {
    addressSpace: {
      addressPrefixes: addressPrefixes
    }
  }
}
