# Contributing

All developers should feel welcome and encouraged to contribute to AWS SDK Swift.

As contributors and maintainers of this project, and in the interest of fostering an open and welcoming community, we pledge to respect all people who contribute through reporting issues, posting feature requests, updating documentation, submitting pull requests or patches, and other activities.

To contribute a feature or idea to AWS SDK Swift, submit an issue and fill in the template. If the request is approved, you or one of the members of the community can start working on it.

We use [Swift Format](https://github.com/nicklockwood/SwiftFormat) to ensure a standard formatting for all code in the AWS SDK Swift. If you create a PR we run a script verifying the code conforms to this format. To be sure your code is compliant run `./scripts/sanity.sh` before you create your PR. This script runs a number of checks including running Swift Format and verifying all source files have the correct file header. 

If you find a bug, and it is relevant please create an issue with output from the `AWSLoggingMiddleware`. Setup `AWSLoggingMiddleware` when creating your `AWSClient` as follows. It will then output the contents of every request and response to the console.
```swift
let client = AWSClient(middlewares: [AWSLoggingMiddleware()])
```

If you find a security vulnerability, please contact <swift-aws-maintainers@googlegroups.com> and reach out on the swift-aws [slack](http://swift-aws.slack.com/) or the [**#aws**](https://discordapp.com/channels/431917998102675485/472522745067077632) channel on the Vapor Discord as soon as possible. We take these matters seriously.

## Testing

We use [Localstack](https://github.com/localstack/localstack) to test AWSSDKSwift. To run Localstack you will need [Docker Desktop](https://docs.docker.com/docker-for-mac/install/) installed. After that you can run Localstack by running the script 
```bash
./scripts/localstack.sh start
```
It takes approx 30 seconds to get going. After that the AWS SDK Swift tests should run as expected.

Alternatively you can use AWS servers to test AWS SDK Swift. Set the environment variable `AWS_DISABLE_LOCALSTACK` to `true` and as long as you have AWS credentials setup in either your environment variables or the shared config file `~/.aws/credentials` it will run the tests using real AWS servers. Of course this could incur a cost if repeated many times.

## Creating, Updating, and Patching Service Modules

AWS SDK Swift is built using code generation. There are a few steps to generate the modules, and also a process to "patch" updates or fixes when we find them to be necessary to generate correct swift.

The AWS SDK Swift shape, api and error service files are generated from the json files in the [`models`](https://github.com/swift-aws/aws-sdk-swift/tree/master/models) folder. We get these from Amazon via the [`aws-sdk-go`](https://github.com/aws/aws-sdk-go) GitHub repository.

The application to do this conversion from model file to aws-sdk-swift services files can be found in the [`CodeGenerator`](https://github.com/swift-aws/aws-sdk-swift/tree/master/CodeGenerator) folder of the aws-sdk-swift repository. Go into this folder and type `open Package.swift` to load the project into Xcode.

### Patching

The model files are not always correct, so we have to patch them before generating the AWS SDK Swift files. This patch process is part of the `CodeGenerator` and is run prior to parsing the dictionaries that have been loaded from the model json. The code for this can be found in [`patch.swift`](https://github.com/swift-aws/aws-sdk-swift/blob/master/CodeGenerator/Sources/CodeGenerator/patch.swift).

At the top of this file you'll see a list of various shapes that have been patched. There are four types of patch (`ReplacePatch`, `AddPatch`, `AddDictionaryPatch` or `RemovePatch`). To work out what you need to patch, you need to look at the `api-2.json` file for the service you are editing and find the definition of the shape you want to change. The most common patches are for renaming, adding enum entries or removing a variable from the "required" section of a shape ie make it optional. 

Each patch has a `PatchKeyPath` which is an array of `WriteableKeyPaths` that lead to the element to be patched. Unfortunately you can't have a `WriteableKeyPath` that contains optional elements in the middle so this is the best solution I could find to get around this. Once you have edited `patch.swift` you should run the CodeGenerator and new service files will be generated.

To help make it easier to review the contents of a request/response (to identify what might need to get patched), you can add the `AWSLoggingMiddleware` to the client to provide debug output. See the first section on adding issues for more details.
