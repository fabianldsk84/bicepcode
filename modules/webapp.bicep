param location string
param tags object
param appServicePlanName string
param webAppName string

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: appServicePlanName
  location: location
  properties: {
    reserved: true
  }
  sku: {
    name: 'B1'
    tier: 'Basic'
  }
  kind: 'linux'
  tags: tags
}

resource appService 'Microsoft.Web/sites@2020-06-01' = {
  name: webAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'PHP|8.0'
      minTlsVersion: '1.0'
    }
  }
  tags: tags
}
