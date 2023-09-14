param location string 
param tags object
var sqlServerName = 'SqlServer${uniqueString(resourceGroup().id)}'
var sqlDatabaseName = 'db${uniqueString(resourceGroup().id)}'
var appServicePlanName = 'AppPlan${uniqueString(resourceGroup().id)}'
var webAppName = 'WebApp${uniqueString(resourceGroup().id)}'
var vmName = 'vm${uniqueString(resourceGroup().id)}'
var vnetName = 'vnet${uniqueString(resourceGroup().id)}'
var subnetName = 'subnet${uniqueString(resourceGroup().id)}'

module webApp 'modules/webapp.bicep' = {
  name: 'webAppDeploy'
  params: {
    location: location
    tags: tags
    appServicePlanName: appServicePlanName
    webAppName: webAppName
  }
}

module sqlServer 'modules/sqlserver.bicep' = {
  name: 'sqlServerDeploy'
  params: {
    location: location
    tags: tags
    sqlServerName: sqlServerName
    sqlDatabaseName: sqlDatabaseName
  }
}

module vm 'modules/vm.bicep' = {
  name: 'vmDeploy'
  params: {
    location: location
    vmName: vmName
    vnetName: vnetName
    subnetName: subnetName
    tags: tags
  }
  dependsOn: [ vnet ]
}

module vnet 'modules/vnet.bicep' = {
  name: 'vnetDeploy'
  params: {
    location: location
    vnetName: vnetName
    subnetName: subnetName
    tags: tags
  }
}
