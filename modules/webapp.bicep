param webAppName string
param location string
param appServicePlanId string
param appInsightsConnectionString string = ''
param linuxFxVersion string = 'DOTNETCORE|8.0'
param tags object = {}

resource webApp 'Microsoft.Web/sites@2023-12-01' = {
  name: webAppName
  location: location
  tags: tags
  properties: {
    serverFarmId: appServicePlanId
    siteConfig: {
      linuxFxVersion: linuxFxVersion
      appSettings: !empty(appInsightsConnectionString) ? [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: appInsightsConnectionString
        }
      ] : []
    }
  }
}
