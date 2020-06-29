//===----------------------------------------------------------------------===//
//
// This source file is part of the AWSSDKSwift open source project
//
// Copyright (c) 2017-2020 the AWSSDKSwift project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of AWSSDKSwift project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

// THIS FILE IS AUTOMATICALLY GENERATED by https://github.com/swift-aws/aws-sdk-swift/blob/master/CodeGenerator/Sources/CodeGenerator/main.swift. DO NOT EDIT.

@_exported import AWSSDKSwiftCore
import NIO

/**
Client object for interacting with AWS Amplify service.

 Amplify is a fully managed continuous deployment and hosting service for modern web apps. 
*/
public struct Amplify {

    //MARK: Member variables

    public let client: AWSClient
    public let serviceConfig: AWSServiceConfig

    //MARK: Initialization

    /// Initialize the Amplify client
    /// - parameters:
    ///     - client: AWSClient used to process requests
    ///     - region: Region of server you want to communicate with. This will override the partition parameter.
    ///     - partition: AWS partition where service resides, standard (.aws), china (.awscn), government (.awsusgov).
    ///     - endpoint: Custom endpoint URL to use instead of standard AWS servers
    public init(
        client: AWSClient,
        region: AWSSDKSwiftCore.Region? = nil,
        partition: AWSSDKSwiftCore.Partition = .aws,
        endpoint: String? = nil
    ) {
        self.client = client
        self.serviceConfig = AWSServiceConfig(
            region: region,
            partition: region?.partition ?? partition,
            service: "amplify",
            serviceProtocol: .restjson,
            apiVersion: "2017-07-25",
            endpoint: endpoint,
            possibleErrorTypes: [AmplifyErrorType.self]
        )
    }
    
    //MARK: API Calls

    ///   Creates a new Amplify App. 
    public func createApp(_ input: CreateAppRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<CreateAppResult> {
        return client.execute(operation: "CreateApp", path: "/apps", httpMethod: "POST", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   Creates a new backend environment for an Amplify App. 
    public func createBackendEnvironment(_ input: CreateBackendEnvironmentRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<CreateBackendEnvironmentResult> {
        return client.execute(operation: "CreateBackendEnvironment", path: "/apps/{appId}/backendenvironments", httpMethod: "POST", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   Creates a new Branch for an Amplify App. 
    public func createBranch(_ input: CreateBranchRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<CreateBranchResult> {
        return client.execute(operation: "CreateBranch", path: "/apps/{appId}/branches", httpMethod: "POST", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   Create a deployment for manual deploy apps. (Apps are not connected to repository) 
    public func createDeployment(_ input: CreateDeploymentRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<CreateDeploymentResult> {
        return client.execute(operation: "CreateDeployment", path: "/apps/{appId}/branches/{branchName}/deployments", httpMethod: "POST", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   Create a new DomainAssociation on an App 
    public func createDomainAssociation(_ input: CreateDomainAssociationRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<CreateDomainAssociationResult> {
        return client.execute(operation: "CreateDomainAssociation", path: "/apps/{appId}/domains", httpMethod: "POST", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   Create a new webhook on an App. 
    public func createWebhook(_ input: CreateWebhookRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<CreateWebhookResult> {
        return client.execute(operation: "CreateWebhook", path: "/apps/{appId}/webhooks", httpMethod: "POST", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   Delete an existing Amplify App by appId. 
    public func deleteApp(_ input: DeleteAppRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<DeleteAppResult> {
        return client.execute(operation: "DeleteApp", path: "/apps/{appId}", httpMethod: "DELETE", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   Delete backend environment for an Amplify App. 
    public func deleteBackendEnvironment(_ input: DeleteBackendEnvironmentRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<DeleteBackendEnvironmentResult> {
        return client.execute(operation: "DeleteBackendEnvironment", path: "/apps/{appId}/backendenvironments/{environmentName}", httpMethod: "DELETE", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   Deletes a branch for an Amplify App. 
    public func deleteBranch(_ input: DeleteBranchRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<DeleteBranchResult> {
        return client.execute(operation: "DeleteBranch", path: "/apps/{appId}/branches/{branchName}", httpMethod: "DELETE", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   Deletes a DomainAssociation. 
    public func deleteDomainAssociation(_ input: DeleteDomainAssociationRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<DeleteDomainAssociationResult> {
        return client.execute(operation: "DeleteDomainAssociation", path: "/apps/{appId}/domains/{domainName}", httpMethod: "DELETE", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   Delete a job, for an Amplify branch, part of Amplify App. 
    public func deleteJob(_ input: DeleteJobRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<DeleteJobResult> {
        return client.execute(operation: "DeleteJob", path: "/apps/{appId}/branches/{branchName}/jobs/{jobId}", httpMethod: "DELETE", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   Deletes a webhook. 
    public func deleteWebhook(_ input: DeleteWebhookRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<DeleteWebhookResult> {
        return client.execute(operation: "DeleteWebhook", path: "/webhooks/{webhookId}", httpMethod: "DELETE", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   Retrieve website access logs for a specific time range via a pre-signed URL. 
    public func generateAccessLogs(_ input: GenerateAccessLogsRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<GenerateAccessLogsResult> {
        return client.execute(operation: "GenerateAccessLogs", path: "/apps/{appId}/accesslogs", httpMethod: "POST", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   Retrieves an existing Amplify App by appId. 
    public func getApp(_ input: GetAppRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<GetAppResult> {
        return client.execute(operation: "GetApp", path: "/apps/{appId}", httpMethod: "GET", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   Retrieves artifact info that corresponds to a artifactId. 
    public func getArtifactUrl(_ input: GetArtifactUrlRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<GetArtifactUrlResult> {
        return client.execute(operation: "GetArtifactUrl", path: "/artifacts/{artifactId}", httpMethod: "GET", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   Retrieves a backend environment for an Amplify App. 
    public func getBackendEnvironment(_ input: GetBackendEnvironmentRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<GetBackendEnvironmentResult> {
        return client.execute(operation: "GetBackendEnvironment", path: "/apps/{appId}/backendenvironments/{environmentName}", httpMethod: "GET", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   Retrieves a branch for an Amplify App. 
    public func getBranch(_ input: GetBranchRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<GetBranchResult> {
        return client.execute(operation: "GetBranch", path: "/apps/{appId}/branches/{branchName}", httpMethod: "GET", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   Retrieves domain info that corresponds to an appId and domainName. 
    public func getDomainAssociation(_ input: GetDomainAssociationRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<GetDomainAssociationResult> {
        return client.execute(operation: "GetDomainAssociation", path: "/apps/{appId}/domains/{domainName}", httpMethod: "GET", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   Get a job for a branch, part of an Amplify App. 
    public func getJob(_ input: GetJobRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<GetJobResult> {
        return client.execute(operation: "GetJob", path: "/apps/{appId}/branches/{branchName}/jobs/{jobId}", httpMethod: "GET", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   Retrieves webhook info that corresponds to a webhookId. 
    public func getWebhook(_ input: GetWebhookRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<GetWebhookResult> {
        return client.execute(operation: "GetWebhook", path: "/webhooks/{webhookId}", httpMethod: "GET", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   Lists existing Amplify Apps. 
    public func listApps(_ input: ListAppsRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<ListAppsResult> {
        return client.execute(operation: "ListApps", path: "/apps", httpMethod: "GET", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   List artifacts with an app, a branch, a job and an artifact type. 
    public func listArtifacts(_ input: ListArtifactsRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<ListArtifactsResult> {
        return client.execute(operation: "ListArtifacts", path: "/apps/{appId}/branches/{branchName}/jobs/{jobId}/artifacts", httpMethod: "GET", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   Lists backend environments for an Amplify App. 
    public func listBackendEnvironments(_ input: ListBackendEnvironmentsRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<ListBackendEnvironmentsResult> {
        return client.execute(operation: "ListBackendEnvironments", path: "/apps/{appId}/backendenvironments", httpMethod: "GET", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   Lists branches for an Amplify App. 
    public func listBranches(_ input: ListBranchesRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<ListBranchesResult> {
        return client.execute(operation: "ListBranches", path: "/apps/{appId}/branches", httpMethod: "GET", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   List domains with an app 
    public func listDomainAssociations(_ input: ListDomainAssociationsRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<ListDomainAssociationsResult> {
        return client.execute(operation: "ListDomainAssociations", path: "/apps/{appId}/domains", httpMethod: "GET", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   List Jobs for a branch, part of an Amplify App. 
    public func listJobs(_ input: ListJobsRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<ListJobsResult> {
        return client.execute(operation: "ListJobs", path: "/apps/{appId}/branches/{branchName}/jobs", httpMethod: "GET", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   List tags for resource. 
    public func listTagsForResource(_ input: ListTagsForResourceRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<ListTagsForResourceResponse> {
        return client.execute(operation: "ListTagsForResource", path: "/tags/{resourceArn}", httpMethod: "GET", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   List webhooks with an app. 
    public func listWebhooks(_ input: ListWebhooksRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<ListWebhooksResult> {
        return client.execute(operation: "ListWebhooks", path: "/apps/{appId}/webhooks", httpMethod: "GET", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   Start a deployment for manual deploy apps. (Apps are not connected to repository) 
    public func startDeployment(_ input: StartDeploymentRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<StartDeploymentResult> {
        return client.execute(operation: "StartDeployment", path: "/apps/{appId}/branches/{branchName}/deployments/start", httpMethod: "POST", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   Starts a new job for a branch, part of an Amplify App. 
    public func startJob(_ input: StartJobRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<StartJobResult> {
        return client.execute(operation: "StartJob", path: "/apps/{appId}/branches/{branchName}/jobs", httpMethod: "POST", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   Stop a job that is in progress, for an Amplify branch, part of Amplify App. 
    public func stopJob(_ input: StopJobRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<StopJobResult> {
        return client.execute(operation: "StopJob", path: "/apps/{appId}/branches/{branchName}/jobs/{jobId}/stop", httpMethod: "DELETE", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   Tag resource with tag key and value. 
    public func tagResource(_ input: TagResourceRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<TagResourceResponse> {
        return client.execute(operation: "TagResource", path: "/tags/{resourceArn}", httpMethod: "POST", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   Untag resource with resourceArn. 
    public func untagResource(_ input: UntagResourceRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<UntagResourceResponse> {
        return client.execute(operation: "UntagResource", path: "/tags/{resourceArn}", httpMethod: "DELETE", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   Updates an existing Amplify App. 
    public func updateApp(_ input: UpdateAppRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<UpdateAppResult> {
        return client.execute(operation: "UpdateApp", path: "/apps/{appId}", httpMethod: "POST", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   Updates a branch for an Amplify App. 
    public func updateBranch(_ input: UpdateBranchRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<UpdateBranchResult> {
        return client.execute(operation: "UpdateBranch", path: "/apps/{appId}/branches/{branchName}", httpMethod: "POST", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   Create a new DomainAssociation on an App 
    public func updateDomainAssociation(_ input: UpdateDomainAssociationRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<UpdateDomainAssociationResult> {
        return client.execute(operation: "UpdateDomainAssociation", path: "/apps/{appId}/domains/{domainName}", httpMethod: "POST", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///   Update a webhook. 
    public func updateWebhook(_ input: UpdateWebhookRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<UpdateWebhookResult> {
        return client.execute(operation: "UpdateWebhook", path: "/webhooks/{webhookId}", httpMethod: "POST", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }
}
