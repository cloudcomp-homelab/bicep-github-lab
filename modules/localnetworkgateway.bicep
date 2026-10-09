param localGatewayName string
param location string
param gatewayIpAddress string
param localAddressPrefixes array
param tags object = {}

resource localGateway 'Microsoft.Network/localNetworkGateways@2023-11-01' = {
  name: localGatewayName
  location: location
  tags: tags
  properties: {
    gatewayIpAddress: gatewayIpAddress
    localNetworkAddressSpace: {
      addressPrefixes: localAddressPrefixes
    }
  }
}
