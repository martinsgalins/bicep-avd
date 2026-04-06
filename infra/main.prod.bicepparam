using './main.bicep'

param resourceGroupName = 'rg-bicep-demo-prod'
param location = 'northeurope'
param tags = {
  environment: 'prod'
  managedBy: 'github-actions'
  iac: 'bicep'
}
