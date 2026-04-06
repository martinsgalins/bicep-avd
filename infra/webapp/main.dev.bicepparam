using './main.bicep'

param webAppName = 'martins-bicep-web-demo-001'
param appServicePlanName = 'asp-bicep-web-demo-dev'
param location = 'northeurope'
param skuName = 'F1'
param tags = {
  environment: 'dev'
  managedBy: 'github-actions'
  iac: 'bicep'
  workload: 'webapp'
}
