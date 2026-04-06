targetScope = 'resourceGroup'

@description('Globally unique web app name')
param webAppName string

@description('App Service plan name')
param appServicePlanName string

@description('Azure region')
param location string = resourceGroup().location

@description('App Service plan SKU')
@allowed([
  'F1'
  'B1'
])
param skuName string = 'F1'

@description('Tags')
param tags object = {
  environment: 'dev'
  managedBy: 'github-actions'
  iac: 'bicep'
  workload: 'webapp'
}

var isFreeOrShared = contains([
  'F1'
], skuName)

resource plan 'Microsoft.Web/serverfarms@2023-12-01' = {
  name: appServicePlanName
  location: location
  kind: 'app'
  sku: {
    name: skuName
    tier: skuName == 'F1' ? 'Free' : 'Basic'
    size: skuName
    family: skuName == 'F1' ? 'F' : 'B'
    capacity: 1
  }
  properties: {
    reserved: true
  }
  tags: tags
}

resource app 'Microsoft.Web/sites@2023-12-01' = {
  name: webAppName
  location: location
  kind: 'app, linux'
  properties: {
    serverFarmId: plan.id
    httpsOnly: true
    siteConfig: {
      minTlsVersion: '1.2'
      alwaysOn: !isFreeOrShared
      ftpsState: 'Disabled'
      linuxFxVersion: 'NODE|18-lts'
    }
  }
  tags: tags
}

output webAppNameOut string = app.name
output defaultHostName string = app.properties.defaultHostName
output appServicePlanId string = plan.id
