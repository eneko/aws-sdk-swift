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
Welcome to the Amazon Simple Queue Service API Reference. Amazon Simple Queue Service (Amazon SQS) is a reliable, highly-scalable hosted queue for storing messages as they travel between applications or microservices. Amazon SQS moves data between distributed application components and helps you decouple these components.   Standard queues are available in all regions. FIFO queues are available in US West (Oregon) and US East (Ohio).  You can use AWS SDKs to access Amazon SQS using your favorite programming language. The SDKs perform tasks such as the following automatically:   Cryptographically sign your service requests   Retry requests   Handle error responses    Additional Information     Amazon SQS Product Page     Amazon SQS Developer Guide     Making API Requests     Using Amazon SQS Message Attributes     Using Amazon SQS Dead Letter Queues       Amazon Web Services General Reference     Regions and Endpoints     
*/
public struct Sqs {

    let client: AWSClient

    public init(accessKeyId: String? = nil, secretAccessKey: String? = nil, region: AWSSDKSwiftCore.Region? = nil, endpoint: String? = nil) {
        self.client = AWSClient(
            accessKeyId: accessKeyId,
            secretAccessKey: secretAccessKey,
            region: region,
            service: "sqs",
            serviceProtocol: ServiceProtocol(type: .query),
            apiVersion: "2012-11-05",
            endpoint: endpoint,
            middlewares: [],
            possibleErrorTypes: [SqsError.self]
        )
    }

    ///  Delivers a message to the specified queue.  A message can include only XML, JSON, and unformatted text. The following Unicode characters are allowed:  #x9 | #xA | #xD | #x20 to #xD7FF | #xE000 to #xFFFD | #x10000 to #x10FFFF  Any characters not included in this list will be rejected. For more information, see the W3C specification for characters. 
    public func sendMessage(_ input: SendMessageRequest) throws -> SendMessageResult {
        return try client.send(operation: "SendMessage", path: "/", httpMethod: "POST", input: input)
    }

    ///  Deletes the specified message from the specified queue. You specify the message by using the message's receipt handle and not the MessageId you receive when you send the message. Even if the message is locked by another reader due to the visibility timeout setting, it is still deleted from the queue. If you leave a message in the queue for longer than the queue's configured retention period, Amazon SQS automatically deletes the message.    The receipt handle is associated with a specific instance of receiving the message. If you receive a message more than once, the receipt handle you get each time you receive the message is different. If you don't provide the most recently received receipt handle for the message when you use the DeleteMessage action, the request succeeds, but the message might not be deleted. For standard queues, it is possible to receive a message even after you delete it. This might happen on rare occasions if one of the servers storing a copy of the message is unavailable when you send the request to delete the message. The copy remains on the server and might be returned to you on a subsequent receive request. You should ensure that your application is idempotent, so that receiving a message more than once does not cause issues. 
    public func deleteMessage(_ input: DeleteMessageRequest) throws {
        _ = try client.send(operation: "DeleteMessage", path: "/", httpMethod: "POST", input: input)
    }

    ///  Adds a permission to a queue for a specific principal. This allows sharing access to the queue. When you create a queue, you have full control access rights for the queue. Only you, the owner of the queue, can grant or deny permissions to the queue. For more information about these permissions, see Shared Queues in the Amazon SQS Developer Guide.   AddPermission writes an Amazon-SQS-generated policy. If you want to write your own policy, use  SetQueueAttributes  to upload your policy. For more information about writing your own policy, see Using The Access Policy Language in the Amazon SQS Developer Guide. Some actions take lists of parameters. These lists are specified using the param.n notation. Values of n are integers starting from 1. For example, a parameter list with two elements looks like this:  &amp;Attribute.1=this   &amp;Attribute.2=that  
    public func addPermission(_ input: AddPermissionRequest) throws {
        _ = try client.send(operation: "AddPermission", path: "/", httpMethod: "POST", input: input)
    }

    ///  Deletes up to ten messages from the specified queue. This is a batch version of  DeleteMessage. The result of the action on each message is reported individually in the response.  Because the batch request can result in a combination of successful and unsuccessful actions, you should check for batch errors even when the call returns an HTTP status code of 200.   Some actions take lists of parameters. These lists are specified using the param.n notation. Values of n are integers starting from 1. For example, a parameter list with two elements looks like this:  &amp;Attribute.1=this   &amp;Attribute.2=that  
    public func deleteMessageBatch(_ input: DeleteMessageBatchRequest) throws -> DeleteMessageBatchResult {
        return try client.send(operation: "DeleteMessageBatch", path: "/", httpMethod: "POST", input: input)
    }

    ///  Deletes the messages in a queue specified by the QueueURL parameter.  When you use the PurgeQueue action, you can't retrieve a message deleted from a queue.  When you purge a queue, the message deletion process takes up to 60 seconds. All messages sent to the queue before calling the PurgeQueue action are deleted. Messages sent to the queue while it is being purged might be deleted. While the queue is being purged, messages sent to the queue before PurgeQueue is called might be received, but are deleted within the next minute.
    public func purgeQueue(_ input: PurgeQueueRequest) throws {
        _ = try client.send(operation: "PurgeQueue", path: "/", httpMethod: "POST", input: input)
    }

    ///  Returns a list of your queues that have the RedrivePolicy queue attribute configured with a dead letter queue. For more information about using dead letter queues, see Using Amazon SQS Dead Letter Queues in the Amazon SQS Developer Guide.
    public func listDeadLetterSourceQueues(_ input: ListDeadLetterSourceQueuesRequest) throws -> ListDeadLetterSourceQueuesResult {
        return try client.send(operation: "ListDeadLetterSourceQueues", path: "/", httpMethod: "POST", input: input)
    }

    ///  Returns the URL of an existing queue. This action provides a simple way to retrieve the URL of an Amazon SQS queue. To access a queue that belongs to another AWS account, use the QueueOwnerAWSAccountId parameter to specify the account ID of the queue's owner. The queue's owner must grant you permission to access the queue. For more information about shared queue access, see  AddPermission  or see Shared Queues in the Amazon SQS Developer Guide. 
    public func getQueueUrl(_ input: GetQueueUrlRequest) throws -> GetQueueUrlResult {
        return try client.send(operation: "GetQueueUrl", path: "/", httpMethod: "POST", input: input)
    }

    ///  Retrieves one or more messages (up to 10), from the specified queue. Using the WaitTimeSeconds parameter enables long-poll support. For more information, see Amazon SQS Long Polling in the Amazon SQS Developer Guide.  Short poll is the default behavior where a weighted random set of machines is sampled on a ReceiveMessage call. Thus, only the messages on the sampled machines are returned. If the number of messages in the queue is small (fewer than 1,000), you most likely get fewer messages than you requested per ReceiveMessage call. If the number of messages in the queue is extremely small, you might not receive any messages in a particular ReceiveMessage response. If this happens, repeat the request.  For each message returned, the response includes the following:   The message body.   An MD5 digest of the message body. For information about MD5, see RFC1321.   The MessageId you received when you sent the message to the queue.   The receipt handle.   The message attributes.   An MD5 digest of the message attributes.   The receipt handle is the identifier you must provide when deleting the message. For more information, see Queue and Message Identifiers in the Amazon SQS Developer Guide. You can provide the VisibilityTimeout parameter in your request. The parameter is applied to the messages that Amazon SQS returns in the response. If you don't include the parameter, the overall visibility timeout for the queue is used for the returned messages. For more information, see Visibility Timeout in the Amazon SQS Developer Guide. A message that isn't deleted or a message whose visibility isn't extended before the visibility timeout expires counts as a failed receive. Depending on the configuration of the queue, the message might be sent to the dead letter queue.  In the future, new attributes might be added. If you write code that calls this action, we recommend that you structure your code so that it can handle new attributes gracefully. 
    public func receiveMessage(_ input: ReceiveMessageRequest) throws -> ReceiveMessageResult {
        return try client.send(operation: "ReceiveMessage", path: "/", httpMethod: "POST", input: input)
    }

    ///  Deletes the queue specified by the QueueUrl, even if the queue is empty. If the specified queue doesn't exist, Amazon SQS returns a successful response.  Be careful with the DeleteQueue action: When you delete a queue, any messages in the queue are no longer available.   When you delete a queue, the deletion process takes up to 60 seconds. Requests you send involving that queue during the 60 seconds might succeed. For example, a  SendMessage  request might succeed, but after 60 seconds the queue and the message you sent no longer exist. When you delete a queue, you must wait at least 60 seconds before creating a queue with the same name. 
    public func deleteQueue(_ input: DeleteQueueRequest) throws {
        _ = try client.send(operation: "DeleteQueue", path: "/", httpMethod: "POST", input: input)
    }

    ///  Changes the visibility timeout of multiple messages. This is a batch version of  ChangeMessageVisibility. The result of the action on each message is reported individually in the response. You can send up to 10  ChangeMessageVisibility  requests with each ChangeMessageVisibilityBatch action.  Because the batch request can result in a combination of successful and unsuccessful actions, you should check for batch errors even when the call returns an HTTP status code of 200.   Some actions take lists of parameters. These lists are specified using the param.n notation. Values of n are integers starting from 1. For example, a parameter list with two elements looks like this:  &amp;Attribute.1=this   &amp;Attribute.2=that  
    public func changeMessageVisibilityBatch(_ input: ChangeMessageVisibilityBatchRequest) throws -> ChangeMessageVisibilityBatchResult {
        return try client.send(operation: "ChangeMessageVisibilityBatch", path: "/", httpMethod: "POST", input: input)
    }

    ///  Changes the visibility timeout of a specified message in a queue to a new value. The maximum allowed timeout value is 12 hours. Thus, you can't extend the timeout of a message in an existing queue to more than a total visibility timeout of 12 hours. For more information, see Visibility Timeout in the Amazon SQS Developer Guide. For example, you have a message and with the default visibility timeout of 5 minutes. After 3 minutes, you call ChangeMessageVisiblity with a timeout of 10 minutes. At that time, the timeout for the message is extended by 10 minutes beyond the time of the ChangeMessageVisibility action. This results in a total visibility timeout of 13 minutes. You can continue to call the ChangeMessageVisibility to extend the visibility timeout to a maximum of 12 hours. If you try to extend the visibility timeout beyond 12 hours, your request is rejected. A message is considered to be in flight after it's received from a queue by a consumer, but not yet deleted from the queue. For standard queues, there can be a maximum of 120,000 inflight messages per queue. If you reach this limit, Amazon SQS returns the OverLimit error message. To avoid reaching the limit, you should delete messages from the queue after they're processed. You can also increase the number of queues you use to process your messages. For FIFO queues, there can be a maximum of 20,000 inflight messages per queue. If you reach this limit, Amazon SQS returns no error messages.  If you attempt to set the VisibilityTimeout to a value greater than the maximum time left, Amazon SQS returns an error. Amazon SQS doesn't automatically recalculate and increase the timeout to the maximum remaining time. Unlike with a queue, when you change the visibility timeout for a specific message the timeout value is applied immediately but isn't saved in memory for that message. If you don't delete a message after it is received, the visibility timeout for the message reverts to the original timeout value (not to the value you set using the ChangeMessageVisibility action) the next time the message is received. 
    public func changeMessageVisibility(_ input: ChangeMessageVisibilityRequest) throws {
        _ = try client.send(operation: "ChangeMessageVisibility", path: "/", httpMethod: "POST", input: input)
    }

    ///  Revokes any permissions in the queue policy that matches the specified Label parameter. Only the owner of the queue can remove permissions.
    public func removePermission(_ input: RemovePermissionRequest) throws {
        _ = try client.send(operation: "RemovePermission", path: "/", httpMethod: "POST", input: input)
    }

    ///  Creates a new standard or FIFO queue. You can pass one or more attributes in the request. Keep the following caveats in mind:   If you don't specify the FifoQueue attribute, Amazon SQS creates a standard queue.   You can't change the queue type after you create it and you can't convert an existing standard queue into a FIFO queue. You must either create a new FIFO queue for your application or delete your existing standard queue and recreate it as a FIFO queue. For more information, see  Moving From a Standard Queue to a FIFO Queue in the Amazon SQS Developer Guide.     If you don't provide a value for an attribute, the queue is created with the default value for the attribute.   If you delete a queue, you must wait at least 60 seconds before creating a queue with the same name.   To successfully create a new queue, you must provide a queue name that adheres to the limits related to queues and is unique within the scope of your queues. To get the queue URL, use the  GetQueueUrl  action.  GetQueueUrl  requires only the QueueName parameter. be aware of existing queue names:   If you provide the name of an existing queue along with the exact names and values of all the queue's attributes, CreateQueue returns the queue URL for the existing queue.   If the queue name, attribute names, or attribute values don't match an existing queue, CreateQueue returns an error.    Some actions take lists of parameters. These lists are specified using the param.n notation. Values of n are integers starting from 1. For example, a parameter list with two elements looks like this:  &amp;Attribute.1=this   &amp;Attribute.2=that  
    public func createQueue(_ input: CreateQueueRequest) throws -> CreateQueueResult {
        return try client.send(operation: "CreateQueue", path: "/", httpMethod: "POST", input: input)
    }

    ///  Sets the value of one or more queue attributes. When you change a queue's attributes, the change can take up to 60 seconds for most of the attributes to propagate throughout the Amazon SQS system. Changes made to the MessageRetentionPeriod attribute can take up to 15 minutes.  In the future, new attributes might be added. If you write code that calls this action, we recommend that you structure your code so that it can handle new attributes gracefully. 
    public func setQueueAttributes(_ input: SetQueueAttributesRequest) throws {
        _ = try client.send(operation: "SetQueueAttributes", path: "/", httpMethod: "POST", input: input)
    }

    ///  Delivers up to ten messages to the specified queue. This is a batch version of  SendMessage. For a FIFO queue, multiple messages within a single batch are enqueued in the order they are sent. The result of sending each message is reported individually in the response. Because the batch request can result in a combination of successful and unsuccessful actions, you should check for batch errors even when the call returns an HTTP status code of 200. The maximum allowed individual message size and the maximum total payload size (the sum of the individual lengths of all of the batched messages) are both 256 KB (262,144 bytes).  A message can include only XML, JSON, and unformatted text. The following Unicode characters are allowed:  #x9 | #xA | #xD | #x20 to #xD7FF | #xE000 to #xFFFD | #x10000 to #x10FFFF  Any characters not included in this list will be rejected. For more information, see the W3C specification for characters.  If you don't specify the DelaySeconds parameter for an entry, Amazon SQS uses the default value for the queue.  Some actions take lists of parameters. These lists are specified using the param.n notation. Values of n are integers starting from 1. For example, a parameter list with two elements looks like this:  &amp;Attribute.1=this   &amp;Attribute.2=that  
    public func sendMessageBatch(_ input: SendMessageBatchRequest) throws -> SendMessageBatchResult {
        return try client.send(operation: "SendMessageBatch", path: "/", httpMethod: "POST", input: input)
    }

    ///  Returns a list of your queues. The maximum number of queues that can be returned is 1,000. If you specify a value for the optional QueueNamePrefix parameter, only queues with a name that begins with the specified value are returned.
    public func listQueues(_ input: ListQueuesRequest) throws -> ListQueuesResult {
        return try client.send(operation: "ListQueues", path: "/", httpMethod: "POST", input: input)
    }

    ///  Gets attributes for the specified queue.  To determine whether a queue is FIFO, you can check whether QueueName ends with the .fifo suffix.   Some actions take lists of parameters. These lists are specified using the param.n notation. Values of n are integers starting from 1. For example, a parameter list with two elements looks like this:  &amp;Attribute.1=this   &amp;Attribute.2=that  
    public func getQueueAttributes(_ input: GetQueueAttributesRequest) throws -> GetQueueAttributesResult {
        return try client.send(operation: "GetQueueAttributes", path: "/", httpMethod: "POST", input: input)
    }


}