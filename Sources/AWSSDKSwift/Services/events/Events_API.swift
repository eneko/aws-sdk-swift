// THIS FILE IS AUTOMATICALLY GENERATED. DO NOT EDIT.
/**
The MIT License (MIT)

Copyright (c) 2017 Yuki Takei(noppoMan)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

*/

import Foundation
import AWSSDKSwiftCore

/**
Amazon CloudWatch Events helps you to respond to state changes in your AWS resources. When your resources change state, they automatically send events into an event stream. You can create rules that match selected events in the stream and route them to targets to take action. You can also use rules to take action on a pre-determined schedule. For example, you can configure rules to:   Automatically invoke an AWS Lambda function to update DNS entries when an event notifies you that Amazon EC2 instance enters the running state.   Direct specific API records from CloudTrail to an Amazon Kinesis stream for detailed analysis of potential security or availability risks.   Periodically invoke a built-in target to create a snapshot of an Amazon EBS volume.   For more information about the features of Amazon CloudWatch Events, see the Amazon CloudWatch Events User Guide.
*/
public struct Events {

    let client: AWSClient

    public init(accessKeyId: String? = nil, secretAccessKey: String? = nil, region: AWSSDKSwiftCore.Region? = nil, endpoint: String? = nil) {
        self.client = AWSClient(
            accessKeyId: accessKeyId,
            secretAccessKey: secretAccessKey,
            region: region,
            amzTarget: "AWSEvents",
            service: "events",
            serviceProtocol: ServiceProtocol(type: .json, version: ServiceProtocol.Version(major: 1, minor: 1)),
            apiVersion: "2015-10-07",
            endpoint: endpoint,
            middlewares: [],
            possibleErrorTypes: [EventsError.self]
        )
    }

    ///  Lists your Amazon CloudWatch Events rules. You can either list all the rules or you can provide a prefix to match to the rule names.
    public func listRules(_ input: ListRulesRequest) throws -> ListRulesResponse {
        return try client.send(operation: "ListRules", path: "/", httpMethod: "POST", input: input)
    }

    ///  Disables the specified rule. A disabled rule won't match any events, and won't self-trigger if it has a schedule expression. When you disable a rule, incoming events might continue to match to the disabled rule. Please allow a short period of time for changes to take effect.
    public func disableRule(_ input: DisableRuleRequest) throws {
        _ = try client.send(operation: "DisableRule", path: "/", httpMethod: "POST", input: input)
    }

    ///  Running PutPermission permits the specified AWS account to put events to your account's default event bus. CloudWatch Events rules in your account are triggered by these events arriving to your default event bus.  For another account to send events to your account, that external account must have a CloudWatch Events rule with your account's default event bus as a target. To enable multiple AWS accounts to put events to your default event bus, run PutPermission once for each of these accounts.
    public func putPermission(_ input: PutPermissionRequest) throws {
        _ = try client.send(operation: "PutPermission", path: "/", httpMethod: "POST", input: input)
    }

    ///  Displays the external AWS accounts that are permitted to write events to your account using your account's event bus, and the associated policy. To enable your account to receive events from other accounts, use PutPermission.
    public func describeEventBus(_ input: DescribeEventBusRequest) throws -> DescribeEventBusResponse {
        return try client.send(operation: "DescribeEventBus", path: "/", httpMethod: "POST", input: input)
    }

    ///  Lists the targets assigned to the specified rule.
    public func listTargetsByRule(_ input: ListTargetsByRuleRequest) throws -> ListTargetsByRuleResponse {
        return try client.send(operation: "ListTargetsByRule", path: "/", httpMethod: "POST", input: input)
    }

    ///  Sends custom events to Amazon CloudWatch Events so that they can be matched to rules.
    public func putEvents(_ input: PutEventsRequest) throws -> PutEventsResponse {
        return try client.send(operation: "PutEvents", path: "/", httpMethod: "POST", input: input)
    }

    ///  Enables the specified rule. If the rule does not exist, the operation fails. When you enable a rule, incoming events might not immediately start matching to a newly enabled rule. Please allow a short period of time for changes to take effect.
    public func enableRule(_ input: EnableRuleRequest) throws {
        _ = try client.send(operation: "EnableRule", path: "/", httpMethod: "POST", input: input)
    }

    ///  Removes the specified targets from the specified rule. When the rule is triggered, those targets are no longer be invoked. When you remove a target, when the associated rule triggers, removed targets might continue to be invoked. Please allow a short period of time for changes to take effect. This action can partially fail if too many requests are made at the same time. If that happens, FailedEntryCount is non-zero in the response and each entry in FailedEntries provides the ID of the failed target and the error code.
    public func removeTargets(_ input: RemoveTargetsRequest) throws -> RemoveTargetsResponse {
        return try client.send(operation: "RemoveTargets", path: "/", httpMethod: "POST", input: input)
    }

    ///  Tests whether the specified event pattern matches the provided event. Most services in AWS treat : or / as the same character in Amazon Resource Names (ARNs). However, CloudWatch Events uses an exact match in event patterns and rules. Be sure to use the correct ARN characters when creating event patterns so that they match the ARN syntax in the event you want to match.
    public func testEventPattern(_ input: TestEventPatternRequest) throws -> TestEventPatternResponse {
        return try client.send(operation: "TestEventPattern", path: "/", httpMethod: "POST", input: input)
    }

    ///  Lists the rules for the specified target. You can see which of the rules in Amazon CloudWatch Events can invoke a specific target in your account.
    public func listRuleNamesByTarget(_ input: ListRuleNamesByTargetRequest) throws -> ListRuleNamesByTargetResponse {
        return try client.send(operation: "ListRuleNamesByTarget", path: "/", httpMethod: "POST", input: input)
    }

    ///  Adds the specified targets to the specified rule, or updates the targets if they are already associated with the rule. Targets are the resources that are invoked when a rule is triggered. You can configure the following as targets for CloudWatch Events:   EC2 instances   AWS Lambda functions   Streams in Amazon Kinesis Streams   Delivery streams in Amazon Kinesis Firehose   Amazon ECS tasks   AWS Step Functions state machines   Amazon SNS topics   Amazon SQS queues   Note that creating rules with built-in targets is supported only in the AWS Management Console. For some target types, PutTargets provides target-specific parameters. If the target is an Amazon Kinesis stream, you can optionally specify which shard the event goes to by using the KinesisParameters argument. To invoke a command on multiple EC2 instances with one rule, you can use the RunCommandParameters field. To be able to make API calls against the resources that you own, Amazon CloudWatch Events needs the appropriate permissions. For AWS Lambda and Amazon SNS resources, CloudWatch Events relies on resource-based policies. For EC2 instances, Amazon Kinesis streams, and AWS Step Functions state machines, CloudWatch Events relies on IAM roles that you specify in the RoleARN argument in PutTargets. For more information, see Authentication and Access Control in the Amazon CloudWatch Events User Guide. If another AWS account is in the same region and has granted you permission (using PutPermission), you can set that account's event bus as a target of the rules in your account. To send the matched events to the other account, specify that account's event bus as the Arn when you run PutTargets. For more information about enabling cross-account events, see PutPermission.  Input, InputPath and InputTransformer are mutually exclusive and optional parameters of a target. When a rule is triggered due to a matched event:   If none of the following arguments are specified for a target, then the entire event is passed to the target in JSON form (unless the target is Amazon EC2 Run Command or Amazon ECS task, in which case nothing from the event is passed to the target).   If Input is specified in the form of valid JSON, then the matched event is overridden with this constant.   If InputPath is specified in the form of JSONPath (for example, $.detail), then only the part of the event specified in the path is passed to the target (for example, only the detail part of the event is passed).   If InputTransformer is specified, then one or more specified JSONPaths are extracted from the event and used as values in a template that you specify as the input to the target.   When you specify Input, InputPath, or InputTransformer, you must use JSON dot notation, not bracket notation. When you add targets to a rule and the associated rule triggers soon after, new or updated targets might not be immediately invoked. Please allow a short period of time for changes to take effect. This action can partially fail if too many requests are made at the same time. If that happens, FailedEntryCount is non-zero in the response and each entry in FailedEntries provides the ID of the failed target and the error code.
    public func putTargets(_ input: PutTargetsRequest) throws -> PutTargetsResponse {
        return try client.send(operation: "PutTargets", path: "/", httpMethod: "POST", input: input)
    }

    ///  Deletes the specified rule. You must remove all targets from a rule using RemoveTargets before you can delete the rule. When you delete a rule, incoming events might continue to match to the deleted rule. Please allow a short period of time for changes to take effect.
    public func deleteRule(_ input: DeleteRuleRequest) throws {
        _ = try client.send(operation: "DeleteRule", path: "/", httpMethod: "POST", input: input)
    }

    ///  Creates or updates the specified rule. Rules are enabled by default, or based on value of the state. You can disable a rule using DisableRule. When you create or update a rule, incoming events might not immediately start matching to new or updated rules. Please allow a short period of time for changes to take effect. A rule must contain at least an EventPattern or ScheduleExpression. Rules with EventPatterns are triggered when a matching event is observed. Rules with ScheduleExpressions self-trigger based on the given schedule. A rule can have both an EventPattern and a ScheduleExpression, in which case the rule triggers on matching events as well as on a schedule. Most services in AWS treat : or / as the same character in Amazon Resource Names (ARNs). However, CloudWatch Events uses an exact match in event patterns and rules. Be sure to use the correct ARN characters when creating event patterns so that they match the ARN syntax in the event you want to match.
    public func putRule(_ input: PutRuleRequest) throws -> PutRuleResponse {
        return try client.send(operation: "PutRule", path: "/", httpMethod: "POST", input: input)
    }

    ///  Describes the specified rule.
    public func describeRule(_ input: DescribeRuleRequest) throws -> DescribeRuleResponse {
        return try client.send(operation: "DescribeRule", path: "/", httpMethod: "POST", input: input)
    }

    ///  Revokes the permission of another AWS account to be able to put events to your default event bus. Specify the account to revoke by the StatementId value that you associated with the account when you granted it permission with PutPermission. You can find the StatementId by using DescribeEventBus.
    public func removePermission(_ input: RemovePermissionRequest) throws {
        _ = try client.send(operation: "RemovePermission", path: "/", httpMethod: "POST", input: input)
    }


}