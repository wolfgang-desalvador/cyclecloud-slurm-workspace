targetScope = 'resourceGroup'

param roleAssignmentDescription string = ''
param principalId string 
param dcrName string

var roleDefinitionIds = {
  MonitoringMetricsPublisher: '3913510d-42f4-4e42-8a64-420c390055eb'
}

resource dataCollectionRule 'Microsoft.Insights/dataCollectionRules@2022-06-01' existing = {
  name: dcrName
}

resource roleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
    name: guid(roleDefinitionIds.MonitoringMetricsPublisher, resourceGroup().id)
    properties: {
        description: roleAssignmentDescription
        principalId: principalId
        roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', roleDefinitionIds.MonitoringMetricsPublisher)
        principalType: 'ServicePrincipal'
    }
    scope: dataCollectionRule
}
