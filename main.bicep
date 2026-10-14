// ============================================================
// STATIC SCOPE SUBSCRIPTION
// ============================================================
targetScope = 'subscription'

// ============================================================
// PARAMETERS
// ============================================================
param location string
param rgName string

// ============================================================
// CREATE / UPDATE RESOURCE-GROUP
// ============================================================
resource rg 'Microsoft.Resources/resourceGroups@2025-04-01' = {
  name: rgName
  location: location
  tags: {
    CostCenter: 'Homelab'
    Owner: 'Mukremin'
    environment: 'sandbox'
  }
}

// ============================================================
// DECLARATIES STRINGS
// ============================================================
param vnetname string
param vnetaddresspre string
param snetname string
param snetaddresspre string

// ============================================================
// CREATE DEPLOYMENT
// ============================================================
module vnet 'modules/vnet.bicep' = {
  name: 'vnetdeploy'
  scope: rg
  params: {
    location:location
    vnetname:vnetname
    vnetaddresspre:vnetaddresspre
    snetname:snetname
    snetaddresspre:snetaddresspre
  }
}
