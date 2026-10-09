param appServicePlanName string
param location string

@allowed(['F1','B1'])
param skuName string = 'F1'

@allowed(['Windows','Linux'])
param osType string = 'Linux'

param tags object = {}

resource appServicePlan 'Microsoft.Web/serverfarms@2023-12-01' = {
  name: appServicePlanName
  location: location
  tags: tags
  sku: {
    name: skuName
  }
  kind: osType == 'Linux' ? 'linux' : 'app'
  properties: {
    reserved: osType == 'Linux'
  }
}
