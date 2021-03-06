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

// THIS FILE IS AUTOMATICALLY GENERATED by https://github.com/swift-aws/aws-sdk-swift/blob/main/CodeGenerator/Sources/CodeGenerator/main.swift. DO NOT EDIT.

@_exported import AWSSDKSwiftCore

/*
Client object for interacting with AWS WorkMailMessageFlow service.

The WorkMail Message Flow API provides access to email messages as they are being sent and received by a WorkMail organization.
*/
public struct WorkMailMessageFlow: AWSService {

    // MARK: Member variables

    public let client: AWSClient
    public let config: AWSServiceConfig

    // MARK: Initialization

    /// Initialize the WorkMailMessageFlow client
    /// - parameters:
    ///     - client: AWSClient used to process requests
    ///     - region: Region of server you want to communicate with. This will override the partition parameter.
    ///     - partition: AWS partition where service resides, standard (.aws), china (.awscn), government (.awsusgov).
    ///     - endpoint: Custom endpoint URL to use instead of standard AWS servers
    ///     - timeout: Timeout value for HTTP requests
    public init(
        client: AWSClient,
        region: AWSSDKSwiftCore.Region? = nil,
        partition: AWSPartition = .aws,
        endpoint: String? = nil,
        timeout: TimeAmount? = nil
    ) {
        self.client = client
        self.config = AWSServiceConfig(
            region: region,
            partition: region?.partition ?? partition,
            service: "workmailmessageflow",
            serviceProtocol: .restjson,
            apiVersion: "2019-05-01",
            endpoint: endpoint,
            possibleErrorTypes: [WorkMailMessageFlowErrorType.self],
            timeout: timeout
        )
    }
    
    // MARK: API Calls

    ///  Retrieves the raw content of an in-transit email message, in MIME format. 
    public func getRawMessageContent(_ input: GetRawMessageContentRequest, on eventLoop: EventLoop? = nil, logger: Logger = AWSClient.loggingDisabled) -> EventLoopFuture<GetRawMessageContentResponse> {
        return self.client.execute(operation: "GetRawMessageContent", path: "/messages/{messageId}", httpMethod: .GET, serviceConfig: config, input: input, on: eventLoop, logger: logger)
    }
}
