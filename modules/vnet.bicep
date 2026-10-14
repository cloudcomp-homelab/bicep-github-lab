param vnetname string
param location string
param vnetaddresspre string
param snetname string
param snetaddresspre string

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: vnetname
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetaddresspre
      ]
    }
    subnets: [
      {
        name: snetname
        properties: {
          addressPrefix: snetaddresspre
        }
      }
    ]
  }
}
