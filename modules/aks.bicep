param aksName string
param location string
param dnsPrefix string
param nodeCount int = 1
param nodeVmSize string = 'Standard_B2s'
param subnetId string = ''
param tags object = {}

resource aks 'Microsoft.ContainerService/managedClusters@2024-05-01' = {
  name: aksName
  location: location
  tags: tags
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    dnsPrefix: dnsPrefix
    agentPoolProfiles: [
      {
        name: 'systempool'
        count: nodeCount
        vmSize: nodeVmSize
        mode: 'System'
        osType: 'Linux'
        vnetSubnetID: !empty(subnetId) ? subnetId : null
      }
    ]
    networkProfile: {
      networkPlugin: !empty(subnetId) ? 'azure' : 'kubenet'
    }
  }
}
