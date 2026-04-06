targetScope = 'subscription'

@description('Name of the resource group to create')
param resourceGroupName string

@description('Azure region for the resource group')
param location string = 'northeurope'

@description('Optional tags')
param tags object = {
  environment: 'dev'
  managedBy: 'github-actions'
  iac: 'bicep'
}

resource rg 'Microsoft.Resources/resourceGroups@2025-03-01' = {
  name: resourceGroupName
  location: location
  tags: tags
}

output resourceGroupId string = rg.id
output resourceGroupNameOut string = rg.name
