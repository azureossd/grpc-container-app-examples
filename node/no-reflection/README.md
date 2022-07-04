# gRPC and Node - without reflection enabled

The official quickstart can be found [here](https://grpc.io/docs/languages/node/quickstart/).

## Running the project
### Install the packages
Run the following:
- `yarn install` (or delete `yarn.lock` and run `npm install`)

### `proto` buffer code
This example uses dynamic loading instead of compiling the protocol buffer prior to running code.

## Deployment

**Important**: First build the Image in this project and push it to your container registry. Update the BICEP or ARM files to point to this Image name.

This can be deployed with the `deployments/` folder which contains an ARM and BICEP file for deploying either way.

Run the following commands:
- `cd` into `/deployment/bicep` or `/deployment/arm`
- `source variables.sh` (Bash)
- Copy and paste the commands in `command.sh` into the terminal to execute the deployment.

## Accessing the application
Use a client tool like [BloomRPC](https://github.com/bloomrpc/bloomrpc) or [gRPC UI](https://github.com/fullstorydev/grpcui) to test the service. See this [GitHub thread](https://github.com/microsoft/azure-container-apps/issues/38#issuecomment-977223930) on how to use a client to access the gRPC server response.