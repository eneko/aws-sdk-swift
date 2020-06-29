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
Client object for interacting with AWS SSO service.

AWS Single Sign-On Portal is a web service that makes it easy for you to assign user access to AWS SSO resources such as the user portal. Users can get AWS account applications and roles assigned to them and get federated into the application. For general information about AWS SSO, see What is AWS Single Sign-On? in the AWS SSO User Guide. This API reference guide describes the AWS SSO Portal operations that you can call programatically and includes detailed information on data types and errors.  AWS provides SDKs that consist of libraries and sample code for various programming languages and platforms, such as Java, Ruby, .Net, iOS, or Android. The SDKs provide a convenient way to create programmatic access to AWS SSO and other AWS services. For more information about the AWS SDKs, including how to download and install them, see Tools for Amazon Web Services. 
*/
public struct SSO {

    //MARK: Member variables

    public let client: AWSClient
    public let serviceConfig: AWSServiceConfig

    //MARK: Initialization

    /// Initialize the SSO client
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
            service: "portal.sso",
            signingName: "awsssoportal",
            serviceProtocol: .restjson,
            apiVersion: "2019-06-10",
            endpoint: endpoint,
            serviceEndpoints: ["ap-southeast-1": "portal.sso.ap-southeast-1.amazonaws.com", "ap-southeast-2": "portal.sso.ap-southeast-2.amazonaws.com", "ca-central-1": "portal.sso.ca-central-1.amazonaws.com", "eu-central-1": "portal.sso.eu-central-1.amazonaws.com", "eu-west-1": "portal.sso.eu-west-1.amazonaws.com", "eu-west-2": "portal.sso.eu-west-2.amazonaws.com", "us-east-1": "portal.sso.us-east-1.amazonaws.com", "us-east-2": "portal.sso.us-east-2.amazonaws.com", "us-west-2": "portal.sso.us-west-2.amazonaws.com"],
            possibleErrorTypes: [SSOErrorType.self]
        )
    }
    
    //MARK: API Calls

    ///  Returns the STS short-term credentials for a given role name that is assigned to the user.
    public func getRoleCredentials(_ input: GetRoleCredentialsRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<GetRoleCredentialsResponse> {
        return client.execute(operation: "GetRoleCredentials", path: "/federation/credentials", httpMethod: "GET", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///  Lists all roles that are assigned to the user for a given AWS account.
    public func listAccountRoles(_ input: ListAccountRolesRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<ListAccountRolesResponse> {
        return client.execute(operation: "ListAccountRoles", path: "/assignment/roles", httpMethod: "GET", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///  Lists all AWS accounts assigned to the user. These AWS accounts are assigned by the administrator of the account. For more information, see Assign User Access in the AWS SSO User Guide. This operation returns a paginated response.
    public func listAccounts(_ input: ListAccountsRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<ListAccountsResponse> {
        return client.execute(operation: "ListAccounts", path: "/assignment/accounts", httpMethod: "GET", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }

    ///  Removes the client- and server-side session that is associated with the user.
    @discardableResult public func logout(_ input: LogoutRequest, on eventLoop: EventLoop? = nil) -> EventLoopFuture<Void> {
        return client.execute(operation: "Logout", path: "/logout", httpMethod: "POST", serviceConfig: serviceConfig, input: input, on: eventLoop)
    }
}
