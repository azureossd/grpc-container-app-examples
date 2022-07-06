using Grpc.Core;
using reflection;

namespace reflection.Services;

public class GreeterService : Greeter.GreeterBase
{
    private readonly ILogger<GreeterService> _logger;
    public GreeterService(ILogger<GreeterService> logger)
    {
        _logger = logger;
    }

    public override Task<HelloReply> SayHello(HelloRequest request, ServerCallContext context)
    {
        var name = "";

        if (request.Name != "") 
        {
            name = "Hello " + request.Name;
        }
        else 
        {
            name = "Hello from grpc-stack-examples-dotnet-reflection";
        }

        return Task.FromResult(new HelloReply
        {
            Message = name
        });
    }
}
