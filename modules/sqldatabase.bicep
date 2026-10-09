param sqlDatabaseName string
param location string
param sqlServerName string

@allowed(['Basic','S0'])
param skuName string = 'Basic'

param tags object = {}

resource sqlServer 'Microsoft.Sql/servers@2023-08-01' existing = {
  name: sqlServerName
}

resource sqlDatabase 'Microsoft.Sql/servers/databases@2023-08-01' = {
  parent: sqlServer
  name: sqlDatabaseName
  location: location
  tags: tags
  sku: {
    name: skuName
  }
}
