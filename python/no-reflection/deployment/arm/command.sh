az deployment group create \
    --resource-group "$RESOURCE_GROUP" \
    --template-file ./deployment.json \
    --parameters \
        environment_name="$CONTAINERAPPS_ENVIRONMENT" \
        location="$LOCATION" \
        azureContainerRegistryUsername="$AZURE_CONTAINER_REGISTRY_USERNAME" \
        azureContainerRegistryServer="$AZURE_CONTAINER_REGISTRY_SERVER" \
        azureContainerRegistryPassword="$AZURE_CONTAINER_REGISTRY_PASSWORD"