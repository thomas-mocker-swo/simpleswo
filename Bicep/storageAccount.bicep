@minLength(3)
@maxLength(23)
param parStorageAccountName string

@allowed([
  'Standard_LRS'
  'Standard_GRS'
  'Standard_RAGRS'
  'Standard_ZRS'
  'Premium_LRS'
  'Premium_ZRS'
  'Standard_GZRS'
  'Standard_RAGZRS'
])
param parStorageSKU string = 'Standard_LRS'

param parLocation string = resourceGroup().location

resource resStorage 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: parStorageAccountName
  location: parLocation
  sku: {
    name: parStorageSKU
  }
  kind: 'StorageV2'
  properties: {
    supportsHttpsTrafficOnly: true
  }
}

output storageEndpoints object = resStorage.properties.primaryEndpoints
