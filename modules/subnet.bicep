@description('Naam van het bestaande VNet waarin deze subnet komt')
param vnetName string

@description('Naam van de subnet (bv. default, AzureBastionSubnet, GatewaySubnet)')
param subnetName string

param addressPrefix string

@description('Optionele NSG resource ID om aan deze subnet te koppelen')
param nsgId string = ''

resource vnet 'Microsoft.Network/virtualNetworks@2023-11-01' existing = {
  name: vnetName
}

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2023-11-01' = {
  parent: vnet
  name: subnetName
  properties: {
    addressPrefix: addressPrefix
    networkSecurityGroup: !empty(nsgId) ? {
      id: nsgId
    } : null
  }
}
