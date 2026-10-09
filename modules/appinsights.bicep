param appInsightsName string
param location string
param workspaceId string = ''
param tags object = {}

resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: appInsightsName
  location: location
  tags: tags
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: !empty(workspaceId) ? workspaceId : null
  }
}
