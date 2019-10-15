// THIS FILE IS AUTOMATICALLY GENERATED by https://github.com/swift-aws/aws-sdk-swift/blob/master/CodeGenerator/Sources/CodeGenerator/main.swift. DO NOT EDIT.

import Foundation
import AWSSDKSwiftCore
import NIO

/**
AAWS Sever Migration Service This is the AWS Sever Migration Service API Reference. It provides descriptions, syntax, and usage examples for each of the actions and data types for the AWS Sever Migration Service (AWS SMS). The topic for each action shows the Query API request parameters and the XML response. You can also view the XML request elements in the WSDL. Alternatively, you can use one of the AWS SDKs to access an API that's tailored to the programming language or platform that you're using. For more information, see AWS SDKs. To learn more about the Server Migration Service, see the following resources:    AWS Sever Migration Service product page     AWS Sever Migration Service User Guide   
*/
public struct SMS {

    public let client: AWSClient

    public init(accessKeyId: String? = nil, secretAccessKey: String? = nil, sessionToken: String? = nil, region: AWSSDKSwiftCore.Region? = nil, endpoint: String? = nil, middlewares: [AWSServiceMiddleware] = []) {
        self.client = AWSClient(
            accessKeyId: accessKeyId,
            secretAccessKey: secretAccessKey,
            sessionToken: sessionToken,
            region: region,
            amzTarget: "AWSServerMigrationService_V2016_10_24",
            service: "sms",
            serviceProtocol: ServiceProtocol(type: .json, version: ServiceProtocol.Version(major: 1, minor: 1)),
            apiVersion: "2016-10-24",
            endpoint: endpoint,
            middlewares: middlewares,
            possibleErrorTypes: [SMSErrorType.self]
        )
    }

    ///  Creates an application. An application consists of one or more server groups. Each server group contain one or more servers.
    public func createApp(_ input: CreateAppRequest) -> Future<CreateAppResponse> {
        return client.send(operation: "CreateApp", path: "/", httpMethod: "POST", input: input)
    }

    ///  Creates a replication job. The replication job schedules periodic replication runs to replicate your server to AWS. Each replication run creates an Amazon Machine Image (AMI).
    public func createReplicationJob(_ input: CreateReplicationJobRequest) -> Future<CreateReplicationJobResponse> {
        return client.send(operation: "CreateReplicationJob", path: "/", httpMethod: "POST", input: input)
    }

    ///  Deletes an existing application. Optionally deletes the launched stack associated with the application and all AWS SMS replication jobs for servers in the application.
    public func deleteApp(_ input: DeleteAppRequest) -> Future<DeleteAppResponse> {
        return client.send(operation: "DeleteApp", path: "/", httpMethod: "POST", input: input)
    }

    ///  Deletes existing launch configuration for an application.
    public func deleteAppLaunchConfiguration(_ input: DeleteAppLaunchConfigurationRequest) -> Future<DeleteAppLaunchConfigurationResponse> {
        return client.send(operation: "DeleteAppLaunchConfiguration", path: "/", httpMethod: "POST", input: input)
    }

    ///  Deletes existing replication configuration for an application.
    public func deleteAppReplicationConfiguration(_ input: DeleteAppReplicationConfigurationRequest) -> Future<DeleteAppReplicationConfigurationResponse> {
        return client.send(operation: "DeleteAppReplicationConfiguration", path: "/", httpMethod: "POST", input: input)
    }

    ///  Deletes the specified replication job. After you delete a replication job, there are no further replication runs. AWS deletes the contents of the Amazon S3 bucket used to store AWS SMS artifacts. The AMIs created by the replication runs are not deleted.
    public func deleteReplicationJob(_ input: DeleteReplicationJobRequest) -> Future<DeleteReplicationJobResponse> {
        return client.send(operation: "DeleteReplicationJob", path: "/", httpMethod: "POST", input: input)
    }

    ///  Deletes all servers from your server catalog.
    public func deleteServerCatalog(_ input: DeleteServerCatalogRequest) -> Future<DeleteServerCatalogResponse> {
        return client.send(operation: "DeleteServerCatalog", path: "/", httpMethod: "POST", input: input)
    }

    ///  Disassociates the specified connector from AWS SMS. After you disassociate a connector, it is no longer available to support replication jobs.
    public func disassociateConnector(_ input: DisassociateConnectorRequest) -> Future<DisassociateConnectorResponse> {
        return client.send(operation: "DisassociateConnector", path: "/", httpMethod: "POST", input: input)
    }

    ///  Generates a target change set for a currently launched stack and writes it to an Amazon S3 object in the customer’s Amazon S3 bucket.
    public func generateChangeSet(_ input: GenerateChangeSetRequest) -> Future<GenerateChangeSetResponse> {
        return client.send(operation: "GenerateChangeSet", path: "/", httpMethod: "POST", input: input)
    }

    ///  Generates an Amazon CloudFormation template based on the current launch configuration and writes it to an Amazon S3 object in the customer’s Amazon S3 bucket.
    public func generateTemplate(_ input: GenerateTemplateRequest) -> Future<GenerateTemplateResponse> {
        return client.send(operation: "GenerateTemplate", path: "/", httpMethod: "POST", input: input)
    }

    ///  Retrieve information about an application.
    public func getApp(_ input: GetAppRequest) -> Future<GetAppResponse> {
        return client.send(operation: "GetApp", path: "/", httpMethod: "POST", input: input)
    }

    ///  Retrieves the application launch configuration associated with an application.
    public func getAppLaunchConfiguration(_ input: GetAppLaunchConfigurationRequest) -> Future<GetAppLaunchConfigurationResponse> {
        return client.send(operation: "GetAppLaunchConfiguration", path: "/", httpMethod: "POST", input: input)
    }

    ///  Retrieves an application replication configuration associatd with an application.
    public func getAppReplicationConfiguration(_ input: GetAppReplicationConfigurationRequest) -> Future<GetAppReplicationConfigurationResponse> {
        return client.send(operation: "GetAppReplicationConfiguration", path: "/", httpMethod: "POST", input: input)
    }

    ///  Describes the connectors registered with the AWS SMS.
    public func getConnectors(_ input: GetConnectorsRequest) -> Future<GetConnectorsResponse> {
        return client.send(operation: "GetConnectors", path: "/", httpMethod: "POST", input: input)
    }

    ///  Describes the specified replication job or all of your replication jobs.
    public func getReplicationJobs(_ input: GetReplicationJobsRequest) -> Future<GetReplicationJobsResponse> {
        return client.send(operation: "GetReplicationJobs", path: "/", httpMethod: "POST", input: input)
    }

    ///  Describes the replication runs for the specified replication job.
    public func getReplicationRuns(_ input: GetReplicationRunsRequest) -> Future<GetReplicationRunsResponse> {
        return client.send(operation: "GetReplicationRuns", path: "/", httpMethod: "POST", input: input)
    }

    ///  Describes the servers in your server catalog. Before you can describe your servers, you must import them using ImportServerCatalog.
    public func getServers(_ input: GetServersRequest) -> Future<GetServersResponse> {
        return client.send(operation: "GetServers", path: "/", httpMethod: "POST", input: input)
    }

    ///  Gathers a complete list of on-premises servers. Connectors must be installed and monitoring all servers that you want to import. This call returns immediately, but might take additional time to retrieve all the servers.
    public func importServerCatalog(_ input: ImportServerCatalogRequest) -> Future<ImportServerCatalogResponse> {
        return client.send(operation: "ImportServerCatalog", path: "/", httpMethod: "POST", input: input)
    }

    ///  Launches an application stack.
    public func launchApp(_ input: LaunchAppRequest) -> Future<LaunchAppResponse> {
        return client.send(operation: "LaunchApp", path: "/", httpMethod: "POST", input: input)
    }

    ///  Returns a list of summaries for all applications.
    public func listApps(_ input: ListAppsRequest) -> Future<ListAppsResponse> {
        return client.send(operation: "ListApps", path: "/", httpMethod: "POST", input: input)
    }

    ///  Creates a launch configuration for an application.
    public func putAppLaunchConfiguration(_ input: PutAppLaunchConfigurationRequest) -> Future<PutAppLaunchConfigurationResponse> {
        return client.send(operation: "PutAppLaunchConfiguration", path: "/", httpMethod: "POST", input: input)
    }

    ///  Creates or updates a replication configuration for an application.
    public func putAppReplicationConfiguration(_ input: PutAppReplicationConfigurationRequest) -> Future<PutAppReplicationConfigurationResponse> {
        return client.send(operation: "PutAppReplicationConfiguration", path: "/", httpMethod: "POST", input: input)
    }

    ///  Starts replicating an application.
    public func startAppReplication(_ input: StartAppReplicationRequest) -> Future<StartAppReplicationResponse> {
        return client.send(operation: "StartAppReplication", path: "/", httpMethod: "POST", input: input)
    }

    ///  Starts an on-demand replication run for the specified replication job. This replication run starts immediately. This replication run is in addition to the ones already scheduled. There is a limit on the number of on-demand replications runs you can request in a 24-hour period.
    public func startOnDemandReplicationRun(_ input: StartOnDemandReplicationRunRequest) -> Future<StartOnDemandReplicationRunResponse> {
        return client.send(operation: "StartOnDemandReplicationRun", path: "/", httpMethod: "POST", input: input)
    }

    ///  Stops replicating an application.
    public func stopAppReplication(_ input: StopAppReplicationRequest) -> Future<StopAppReplicationResponse> {
        return client.send(operation: "StopAppReplication", path: "/", httpMethod: "POST", input: input)
    }

    ///  Terminates the stack for an application.
    public func terminateApp(_ input: TerminateAppRequest) -> Future<TerminateAppResponse> {
        return client.send(operation: "TerminateApp", path: "/", httpMethod: "POST", input: input)
    }

    ///  Updates an application.
    public func updateApp(_ input: UpdateAppRequest) -> Future<UpdateAppResponse> {
        return client.send(operation: "UpdateApp", path: "/", httpMethod: "POST", input: input)
    }

    ///  Updates the specified settings for the specified replication job.
    public func updateReplicationJob(_ input: UpdateReplicationJobRequest) -> Future<UpdateReplicationJobResponse> {
        return client.send(operation: "UpdateReplicationJob", path: "/", httpMethod: "POST", input: input)
    }
}
