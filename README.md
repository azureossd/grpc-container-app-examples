# grpc-stack-examples
Various examples for different stacks for [gRPC](https://grpc.io/) with and without [reflection](https://github.com/grpc/grpc/blob/master/doc/server-reflection.md) enabled that can be deployed to [Azure Container Apps](https://docs.microsoft.com/en-us/azure/container-apps/overview).

This repo contains deployable gRPC servers with and without reflection (with the exception of `node`). All files are included to build the image and deploy this locally from either BICEP or ARM.

## Project outlines
- `no-reflection` contains an application **without** reflection enabled.
- `reflection` contains an application **with** reflection enabled.
- `deployment` contains both an ARM and BICEP folder to deploy this code. 

## Deployment
- Build the `Dockerfile` and push this to your Azure Container Registry
- Add your credentials to the `variables.sh` file, followed by `source variables.sh` from the terminal to populate these environment variables.
- Copy the command in `deployment.sh` to your terminal, relative to the BICEP or ARM file that's being deplyed. Run this to deploy the infrastructure and application.


```
|-- dotnet
|   |-- no-reflection
|   |   | -- deployment
|   |   |   | -- bicep
|   |   |   | -- arm
|   |-- reflection
|   |   | -- deployment
|   |   |   | -- bicep
|   |   |   | -- arm
|-- java
|   |-- no-reflection
|   |   | -- deployment
|   |   |   | -- bicep
|   |   |   | -- arm
|   |-- reflection
|   |   | -- deployment
|   |   |   | -- bicep
|   |   |   | -- arm
|-- node
|   |-- no-reflection
|   |   | -- deployment
|   |   |   | -- bicep
|   |   |   | -- arm
|   |-- reflection
|   |   | -- deployment
|   |   |   | -- bicep
|   |   |   | -- arm
|-- python
|   |-- no-reflection
|   |   | -- deployment
|   |   |   | -- bicep
|   |   |   | -- arm
|   |-- reflection
|   |   | -- deployment
|   |   |   | -- bicep
|   |   |   | -- arm
```