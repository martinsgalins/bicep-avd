using './main.bicep'

param resourceGroupName = 'rg-bicep-demo-dev'
param location = 'northeurope'
param tags = {
  environment: 'dev'
  managedBy: 'github-actions'
  iac: 'bicep'
}
