param environment_name string
param location string 
param azureContainerRegistryUsername string
param azureContainerRegistryServer string
@secure()
param azureContainerRegistryPassword string

var logAnalyticsWorkspaceName = 'logs-${environment_name}'
var appInsightsName = 'appins-${environment_name}'

resource logAnalyticsWorkspace'Microsoft.OperationalInsights/workspaces@2021-06-01' = {
  name: logAnalyticsWorkspaceName
  location: location
  properties: any({
    retentionInDays: 30
    features: {
      searchVersion: 1
    }
    sku: {
      name: 'PerGB2018'
    }
  })
}

resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: appInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

resource environment 'Microsoft.App/managedEnvironments@2022-03-01' = {
  name: environment_name
  location: location
  properties: {
    daprAIInstrumentationKey: reference(appInsights.id, '2020-02-02').InstrumentationKey
    appLogsConfiguration: {
      destination: 'log-analytics'
      logAnalyticsConfiguration: {
        customerId: reference(logAnalyticsWorkspace.id, '2021-06-01').customerId
        sharedKey: listKeys(logAnalyticsWorkspace.id, '2021-06-01').primarySharedKey
      }
    }
  }
}

resource javanoreflection 'Microsoft.App/containerApps@2022-03-01' = {
  name: 'java-no-reflection'
  location: location
  properties: {
    managedEnvironmentId: environment.id
    configuration: {
      ingress: {
        external: true
        targetPort: 50051
        // Set transport to http2 for gRPC
        transport: 'http2'
      }
      secrets: [
        {
          name: 'azurecontainerregistrypassword'
          value: azureContainerRegistryPassword
        }
      ]
      registries: [
        {
          server: azureContainerRegistryServer
          username: azureContainerRegistryUsername
          passwordSecretRef: 'azurecontainerregistrypassword'
        }
      ]
    }
    template: {
      containers: [
        {
          image: '${azureContainerRegistryServer}/grpcstackexamples-java-no-reflection:latest'
          name: 'yourimage'
          resources: {
            cpu: json('0.5')
            memory: '1.0Gi'
          }
        }
      ]
      scale: {
        minReplicas: 1
        maxReplicas: 1
      }
    }
  }
}

