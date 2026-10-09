param apimName string
param location string
param publisherEmail string
param publisherName string

@allowed(['Consumption','Developer'])
param skuName string = 'Consumption'

param tags object = {}

resource apim 'Microsoft.ApiManagement/service@2022-08-01' = {
  name: apimName
  location: location
  tags: tags
  sku: {
    name: skuName
    capacity: skuName == 'Consumption' ? 0 : 1
  }
  properties: {
    publisherEmail: publisherEmail
    publisherName: publisherName
  }
}
