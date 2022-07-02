import {
  Server,
  ServerCredentials,
  loadPackageDefinition,
} from "@grpc/grpc-js";
import * as protoLoader from "@grpc/proto-loader";

const PROTO_PATH = "./hello.proto";
const port = process.env.PORT || 50051;
const host = process.env.HOST || "localhost";
const packageDefinition = protoLoader.loadSync(PROTO_PATH, {
  keepCase: true,
  longs: String,
  enums: String,
  defaults: true,
  oneofs: true,
});

const hello_proto = loadPackageDefinition(packageDefinition).greetingpackage;

// Implements the Greeting RPC method.
const greeting = (_, callback) => {
  callback(null, { message: "Hello, from grpc-stack-examples-node-no-reflection" });
}

// Starts an RPC server that receives requests for the Greeter service at the sample server port
const main = () => {
  const server = new Server();
  server.addService(hello_proto.Greeter.service, { greeting: greeting });
  server.bindAsync(
    `${host}:${port}`,
    ServerCredentials.createInsecure(),
    () => {
      console.log(`gRPC server istening on: ${host}:${port}`);
      server.start();
    }
  );
};

main();
