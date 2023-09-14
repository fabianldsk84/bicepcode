param location string
param tags object
param sqlServerName string
param sqlDatabaseName string

var adminUser = 'Student'
var adminPassword = 'Pa55w.rd1234'

resource sqlServer 'Microsoft.Sql/servers@2021-11-01' = {
  name: sqlServerName
  location: location
  tags: tags
  properties: {
    administratorLogin: adminUser
    administratorLoginPassword: adminPassword
  }
}

resource sqlDatabase 'Microsoft.Sql/servers/databases@2021-11-01' = {
  parent: sqlServer
  name: sqlDatabaseName
  location: location
  sku: {
    name: 'Standard'
    tier: 'Standard'
  }
}

resource firewallRule 'Microsoft.Sql/servers/firewallRules@2021-11-01' = {
  name: 'AllowAzureResources'
  parent: sqlServer
  properties: {
     startIpAddress: '0.0.0.0'
     endIpAddress: '0.0.0.0'
  }
}
