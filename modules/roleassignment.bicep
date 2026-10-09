@description('Object ID van de principal (bv. managed identity) die de rol krijgt')
param principalId string

@description('Role Definition GUID van de ingebouwde rol, bv AcrPull = 7f951dda-4ed3-4680-a7ca-43fe172d538d')
param roleDefinitionId string

param principalType string = 'ServicePrincipal'

resource roleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(resourceGroup().id, principalId, roleDefinitionId)
  properties: {
    principalId: principalId
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', roleDefinitionId)
    principalType: principalType
  }
}
