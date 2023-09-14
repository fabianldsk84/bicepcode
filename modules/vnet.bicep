param location string 
param tags object
param vnetName string
param subnetName string
var vnetAddressPrefixes = ['10.200.0.0/16']
var subnetAddressPrefix = '10.200.1.0/24'

resource vnet 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: vnetAddressPrefixes
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: subnetAddressPrefix
        }
      }      
    ]
  }
  tags: tags
}
