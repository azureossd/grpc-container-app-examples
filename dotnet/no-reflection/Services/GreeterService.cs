using Grpc.Core;
using no_reflection;

namespace no_reflection.Services;

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
        // If name exists on the request body we add that into a greeting response
        // Name on the request body is lowercase - ex. 'name'
        if (request.Name != "")
        {
            name = "Hello " + request.Name;
        }
        // Else return a default message
        else
        {
            name = "Hello from grpc-stack-examples-dotnet-no-reflection";
        }
        return Task.FromResult(new HelloReply
        {
            Message = name
        });
    }
}
