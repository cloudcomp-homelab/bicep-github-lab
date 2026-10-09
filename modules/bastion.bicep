@description('Developer SKU is gratis en heeft geen subnet/public IP nodig. Basic/Standard hebben een AzureBastionSubnet + public IP nodig.')
param bastionName string
param location string

@allowed(['Developer','Basic','Standard'])
param skuName string = 'Developer'

param vnetId string = ''
param bastionSubnetId string = ''
param tags object = {}

resource publicIp 'Microsoft.Network/publicIPAddresses@2023-11-01' = if (skuName != 'Developer') {
  name: '${bastionName}-pip'
  location: location
  sku: {
    name: 'Standard'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
  }
  tags: tags
}

resource bastion 'Microsoft.Network/bastionHosts@2023-11-01' = {
  name: bastionName
  location: location
  tags: tags
  sku: {
    name: skuName
  }
  properties: skuName == 'Developer' ? {
    virtualNetwork: {
      id: vnetId
    }
  } : {
    ipConfigurations: [
      {
        name: 'bastionIpConfig'
        properties: {
          subnet: {
            id: bastionSubnetId
          }
          publicIPAddress: {
            id: publicIp.id
          }
        }
      }
    ]
  }
}
