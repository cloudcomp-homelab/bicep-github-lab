param redisName string
param location string

@allowed(['Basic','Standard'])
param skuName string = 'Basic'

param skuFamily string = 'C'
param skuCapacity int = 0
param tags object = {}

resource redis 'Microsoft.Cache/redis@2023-08-01' = {
  name: redisName
  location: location
  tags: tags
  properties: {
    sku: {
      name: skuName
      family: skuFamily
      capacity: skuCapacity
    }
    minimumTlsVersion: '1.2'
  }
}
