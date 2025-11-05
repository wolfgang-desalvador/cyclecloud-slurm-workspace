targetScope = 'subscription'

param principalId string
param dcrName string
param dcrResourceGroupName string


module roleAssignment 'publisherRoleAssignment.bicep' = {
  name: 'dataCollectionRuleRoleAssignment'
  params: {
    principalId: principalId
    dcrName: dcrName
    roleAssignmentDescription: 'Allows sending metrics to Data Collection Rule'
  }
  scope: resourceGroup(dcrResourceGroupName)
}
