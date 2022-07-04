# gRPC and Python - with reflection enabled

The official quickstart can be found [here](https://grpc.io/docs/languages/python/quickstart/).

## Running the project
### Create and activate the virtual environment
Run the following:
- `python -m venv .venv`
- `source .venv/Scripts/activate` (Bash)

### Install the packages
Run the following:
- `pip install -r requirements.txt`

### `proto` buffer code
This is including in the project as `greeter_pb2_` files. These are not manually created. These are generated with the following command:

- `python -m grpc_tools.protoc -I ./proto --python_out=. --grpc_python_out=. ./proto/greeter.proto`

## Deployment

**Important**: First build the Image in this project and push it to your container registry. Update the BICEP or ARM files to point to this Image name.

This can be deployed with the `deployments/` folder which contains an ARM and BICEP file for deploying either way.

Run the following commands:
- `cd` into `/deployment/bicep` or `/deployment/arm`
- `source variables.sh` (Bash)
- Copy and paste the commands in `command.sh` into the terminal to execute the deployment.

## Accessing the application
Use a client tool like [BloomRPC](https://github.com/bloomrpc/bloomrpc) or [gRPC UI](https://github.com/fullstorydev/grpcui) to test the service. See this [GitHub thread](https://github.com/microsoft/azure-container-apps/issues/38#issuecomment-977223930) on how to use a client to access the gRPC server response.