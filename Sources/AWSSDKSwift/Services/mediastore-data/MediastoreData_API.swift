// THIS FILE IS AUTOMATICALLY GENERATED by https://github.com/noppoMan/aws-sdk-swift/blob/master/Sources/CodeGenerator/main.swift. DO NOT EDIT.

import Foundation
import AWSSDKSwiftCore

/**
An AWS Elemental MediaStore asset is an object, similar to an object in the Amazon S3 service. Objects are the fundamental entities that are stored in AWS Elemental MediaStore.
*/
public struct MediastoreData {

    let client: AWSClient

    public init(accessKeyId: String? = nil, secretAccessKey: String? = nil, region: AWSSDKSwiftCore.Region? = nil, endpoint: String? = nil) {
        self.client = AWSClient(
            accessKeyId: accessKeyId,
            secretAccessKey: secretAccessKey,
            region: region,
            service: "data.mediastore",
            serviceProtocol: ServiceProtocol(type: .restjson),
            apiVersion: "2017-09-01",
            endpoint: endpoint,
            middlewares: [],
            possibleErrorTypes: [MediastoreDataError.self]
        )
    }

    ///  Gets the header for an object at the specified path.
    public func describeObject(_ input: DescribeObjectRequest) throws -> DescribeObjectResponse {
        return try client.send(operation: "DescribeObject", path: "/{Path+}", httpMethod: "HEAD", input: input)
    }

    ///  Deletes an object at the specified path.
    public func deleteObject(_ input: DeleteObjectRequest) throws -> DeleteObjectResponse {
        return try client.send(operation: "DeleteObject", path: "/{Path+}", httpMethod: "DELETE", input: input)
    }

    ///  Downloads the object at the specified path.
    public func getObject(_ input: GetObjectRequest) throws -> GetObjectResponse {
        return try client.send(operation: "GetObject", path: "/{Path+}", httpMethod: "GET", input: input)
    }

    ///  Provides a list of metadata entries about folders and objects in the specified folder.
    public func listItems(_ input: ListItemsRequest) throws -> ListItemsResponse {
        return try client.send(operation: "ListItems", path: "/", httpMethod: "GET", input: input)
    }

    ///  Uploads an object to the specified path. Object sizes are limited to 10 MB.
    public func putObject(_ input: PutObjectRequest) throws -> PutObjectResponse {
        return try client.send(operation: "PutObject", path: "/{Path+}", httpMethod: "PUT", input: input)
    }


}