param vpnGatewayName string
param location string
param gatewaySubnetId string

@allowed(['Basic','VpnGw1'])
param gatewaySku string = 'Basic'

param tags object = {}

resource publicIp 'Microsoft.Network/publicIPAddresses@2023-11-01' = {
  name: '${vpnGatewayName}-pip'
  location: location
  sku: {
    name: gatewaySku == 'Basic' ? 'Basic' : 'Standard'
  }
  properties: {
    publicIPAllocationMethod: gatewaySku == 'Basic' ? 'Dynamic' : 'Static'
  }
  tags: tags
}

resource vpnGateway 'Microsoft.Network/virtualNetworkGateways@2023-11-01' = {
  name: vpnGatewayName
  location: location
  tags: tags
  properties: {
    gatewayType: 'Vpn'
    vpnType: 'RouteBased'
    sku: {
      name: gatewaySku
      tier: gatewaySku
    }
    ipConfigurations: [
      {
        name: 'vnetGatewayConfig'
        properties: {
          subnet: {
            id: gatewaySubnetId
          }
          publicIPAddress: {
            id: publicIp.id
          }
        }
      }
    ]
  }
}
