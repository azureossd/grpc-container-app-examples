from concurrent import futures
import logging
import os

import grpc
import greeter_pb2
import greeter_pb2_grpc

host = os.environ.get('HOST', 'localhost')
port = os.environ.get('PORT', 50051)

class Greeter(greeter_pb2_grpc.GreeterServicer):
    def Greeting(self, request, context):
        return greeter_pb2.HelloReply(message='Hello from grpc-stack-examples-python-no-reflection')


def serve():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    greeter_pb2_grpc.add_GreeterServicer_to_server(Greeter(), server)
    server.add_insecure_port(f'{host}:{port}')
    server.start()
    server.wait_for_termination()


if __name__ == '__main__':
    logging.basicConfig(level=logging.INFO)
    logger = logging.getLogger()
    logger.info(f'gRPC server starting at {host}:{port}')
    serve()