// THIS FILE IS AUTOMATICALLY GENERATED by https://github.com/noppoMan/aws-sdk-swift/blob/master/Sources/CodeGenerator/main.swift. DO NOT EDIT.

import Foundation
import AWSSDKSwiftCore

extension MediastoreData {

    public struct PutObjectRequest: AWSShape {
        /// The key for the payload
        public static let payloadPath: String? = "Body"
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "ContentType", location: .header(locationName: "Content-Type"), required: false, type: .string), 
            AWSShapeMember(label: "StorageClass", location: .header(locationName: "x-amz-storage-class"), required: false, type: .enum), 
            AWSShapeMember(label: "CacheControl", location: .header(locationName: "Cache-Control"), required: false, type: .string), 
            AWSShapeMember(label: "Body", required: true, type: .blob), 
            AWSShapeMember(label: "Path", location: .uri(locationName: "Path"), required: true, type: .string)
        ]
        /// The content type of the object.
        public let contentType: String?
        /// Indicates the storage class of a Put request. Defaults to high-performance temporal storage class, and objects are persisted into durable storage shortly after being received.
        public let storageClass: StorageClass?
        /// An optional CacheControl header that allows the caller to control the object's cache behavior. Headers can be passed in as specified in the HTTP at https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9. Headers with a custom user-defined value are also accepted.
        public let cacheControl: String?
        /// The path to the file outside of the container. The file name can include or omit an extension.  Example 1: If the file is stored on a remote server that has been mounted to the workstation on which the REST API command is being run, the path could be the absolute path  \mount\assets\mlaw.avi or the relative path ..\..\mount\assets\movies\premium\mlaw.avi. Example 2: If the file is stored on a remote server that is not mounted, the path could be https:\\192.0.2.15\movies\premium\mlaw.avi.
        public let body: Data
        /// The path (including the file name) where the object is stored in the container. Format: &lt;folder name&gt;/&lt;folder name&gt;/&lt;file name&gt; For example, to upload the file mlaw.avi to the folder path premium\canada in the container movies, enter the path premium/canada/mlaw.avi. Do not include the container name in this path. If the path includes any folders that don't exist yet, the service creates them. For example, suppose you have an existing premium/usa subfolder. If you specify premium/canada, the service creates a canada subfolder in the premium folder. You then have two subfolders, usa and canada, in the premium folder.  There is no correlation between the path to the source and the path (folders) in the container in AWS Elemental MediaStore. For more information about folders and how they exist in a container, see the AWS Elemental MediaStore User Guide. The file name is the name that is assigned to the file that you upload. The file can have the same name inside and outside of AWS Elemental MediaStore, or it can have the same name. The file name can include or omit an extension. 
        public let path: String

        public init(contentType: String? = nil, storageClass: StorageClass? = nil, cacheControl: String? = nil, body: Data, path: String) {
            self.contentType = contentType
            self.storageClass = storageClass
            self.cacheControl = cacheControl
            self.body = body
            self.path = path
        }

        private enum CodingKeys: String, CodingKey {
            case contentType = "Content-Type"
            case storageClass = "x-amz-storage-class"
            case cacheControl = "Cache-Control"
            case body = "Body"
            case path = "Path"
        }
    }

    public struct Item: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "LastModified", required: false, type: .timestamp), 
            AWSShapeMember(label: "ContentLength", required: false, type: .long), 
            AWSShapeMember(label: "ETag", required: false, type: .string), 
            AWSShapeMember(label: "Name", required: false, type: .string), 
            AWSShapeMember(label: "Type", required: false, type: .enum), 
            AWSShapeMember(label: "ContentType", required: false, type: .string)
        ]
        /// The date and time that the item was last modified.
        public let lastModified: TimeStamp?
        /// The length of the item in bytes.
        public let contentLength: Int64?
        /// The ETag that represents a unique instance of the item.
        public let eTag: String?
        /// The name of the item.
        public let name: String?
        /// The item type (folder or object).
        public let `type`: ItemType?
        /// The content type of the item.
        public let contentType: String?

        public init(lastModified: TimeStamp? = nil, contentLength: Int64? = nil, eTag: String? = nil, name: String? = nil, type: ItemType? = nil, contentType: String? = nil) {
            self.lastModified = lastModified
            self.contentLength = contentLength
            self.eTag = eTag
            self.name = name
            self.`type` = `type`
            self.contentType = contentType
        }

        private enum CodingKeys: String, CodingKey {
            case lastModified = "LastModified"
            case contentLength = "ContentLength"
            case eTag = "ETag"
            case name = "Name"
            case `type` = "Type"
            case contentType = "ContentType"
        }
    }

    public struct GetObjectRequest: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "Range", location: .header(locationName: "Range"), required: false, type: .string), 
            AWSShapeMember(label: "Path", location: .uri(locationName: "Path"), required: true, type: .string)
        ]
        /// The range bytes of an object to retrieve. For more information about the Range header, go to http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.35.
        public let range: String?
        /// The path (including the file name) where the object is stored in the container. Format: &lt;folder name&gt;/&lt;folder name&gt;/&lt;file name&gt; For example, to upload the file mlaw.avi to the folder path premium\canada in the container movies, enter the path premium/canada/mlaw.avi. Do not include the container name in this path. If the path includes any folders that don't exist yet, the service creates them. For example, suppose you have an existing premium/usa subfolder. If you specify premium/canada, the service creates a canada subfolder in the premium folder. You then have two subfolders, usa and canada, in the premium folder.  There is no correlation between the path to the source and the path (folders) in the container in AWS Elemental MediaStore. For more information about folders and how they exist in a container, see the AWS Elemental MediaStore User Guide. The file name is the name that is assigned to the file that you upload. The file can have the same name inside and outside of AWS Elemental MediaStore, or it can have the same name. The file name can include or omit an extension. 
        public let path: String

        public init(range: String? = nil, path: String) {
            self.range = range
            self.path = path
        }

        private enum CodingKeys: String, CodingKey {
            case range = "Range"
            case path = "Path"
        }
    }

    public struct PutObjectResponse: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "ETag", required: false, type: .string), 
            AWSShapeMember(label: "StorageClass", required: false, type: .enum), 
            AWSShapeMember(label: "ContentSHA256", required: false, type: .string)
        ]
        /// Unique identifier of the object in the container.
        public let eTag: String?
        /// The storage class where the object was persisted. Should be “Temporal”.
        public let storageClass: StorageClass?
        /// The SHA256 digest of the object that is persisted.
        public let contentSHA256: String?

        public init(eTag: String? = nil, storageClass: StorageClass? = nil, contentSHA256: String? = nil) {
            self.eTag = eTag
            self.storageClass = storageClass
            self.contentSHA256 = contentSHA256
        }

        private enum CodingKeys: String, CodingKey {
            case eTag = "ETag"
            case storageClass = "StorageClass"
            case contentSHA256 = "ContentSHA256"
        }
    }

    public struct DescribeObjectResponse: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "LastModified", location: .header(locationName: "Last-Modified"), required: false, type: .timestamp), 
            AWSShapeMember(label: "CacheControl", location: .header(locationName: "Cache-Control"), required: false, type: .string), 
            AWSShapeMember(label: "ContentLength", location: .header(locationName: "Content-Length"), required: false, type: .long), 
            AWSShapeMember(label: "ETag", location: .header(locationName: "ETag"), required: false, type: .string), 
            AWSShapeMember(label: "ContentType", location: .header(locationName: "Content-Type"), required: false, type: .string)
        ]
        /// The date and time that the object was last modified.
        public let lastModified: TimeStamp?
        /// An optional CacheControl header that allows the caller to control the object's cache behavior. Headers can be passed in as specified in the HTTP at https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9. Headers with a custom user-defined value are also accepted.
        public let cacheControl: String?
        /// The length of the object in bytes.
        public let contentLength: Int64?
        /// The ETag that represents a unique instance of the object.
        public let eTag: String?
        /// The content type of the object.
        public let contentType: String?

        public init(lastModified: TimeStamp? = nil, cacheControl: String? = nil, contentLength: Int64? = nil, eTag: String? = nil, contentType: String? = nil) {
            self.lastModified = lastModified
            self.cacheControl = cacheControl
            self.contentLength = contentLength
            self.eTag = eTag
            self.contentType = contentType
        }

        private enum CodingKeys: String, CodingKey {
            case lastModified = "Last-Modified"
            case cacheControl = "Cache-Control"
            case contentLength = "Content-Length"
            case eTag = "ETag"
            case contentType = "Content-Type"
        }
    }

    public struct DescribeObjectRequest: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "Path", location: .uri(locationName: "Path"), required: true, type: .string)
        ]
        /// The path (including the file name) where the object is stored in the container. Format: &lt;folder name&gt;/&lt;folder name&gt;/&lt;file name&gt;
        public let path: String

        public init(path: String) {
            self.path = path
        }

        private enum CodingKeys: String, CodingKey {
            case path = "Path"
        }
    }

    public struct DeleteObjectRequest: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "Path", location: .uri(locationName: "Path"), required: true, type: .string)
        ]
        /// The path (including the file name) where the object is stored in the container. Format: &lt;folder name&gt;/&lt;folder name&gt;/&lt;file name&gt;
        public let path: String

        public init(path: String) {
            self.path = path
        }

        private enum CodingKeys: String, CodingKey {
            case path = "Path"
        }
    }

    public struct GetObjectResponse: AWSShape {
        /// The key for the payload
        public static let payloadPath: String? = "Body"
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "LastModified", location: .header(locationName: "Last-Modified"), required: false, type: .timestamp), 
            AWSShapeMember(label: "CacheControl", location: .header(locationName: "Cache-Control"), required: false, type: .string), 
            AWSShapeMember(label: "ContentLength", location: .header(locationName: "Content-Length"), required: false, type: .long), 
            AWSShapeMember(label: "ContentRange", location: .header(locationName: "Content-Range"), required: false, type: .string), 
            AWSShapeMember(label: "ContentType", location: .header(locationName: "Content-Type"), required: false, type: .string), 
            AWSShapeMember(label: "StatusCode", required: true, type: .integer), 
            AWSShapeMember(label: "ETag", location: .header(locationName: "ETag"), required: false, type: .string), 
            AWSShapeMember(label: "Body", required: false, type: .blob)
        ]
        /// The date and time that the object was last modified.
        public let lastModified: TimeStamp?
        /// An optional CacheControl header that allows the caller to control the object's cache behavior. Headers can be passed in as specified in the HTTP spec at https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9. Headers with a custom user-defined value are also accepted.
        public let cacheControl: String?
        /// The length of the object in bytes.
        public let contentLength: Int64?
        /// The range of bytes to retrieve.
        public let contentRange: String?
        /// The content type of the object.
        public let contentType: String?
        /// The HTML status code of the request. Status codes ranging from 200 to 299 indicate success. All other status codes indicate the type of error that occurred.
        public let statusCode: Int32
        /// The ETag that represents a unique instance of the object.
        public let eTag: String?
        /// The path to the file outside of the container. The file name can include or omit an extension.  Example 1: If the file is stored on a remote server that has been mounted to the workstation on which the REST API command is being run, the path could be the absolute path  \mount\assets\mlaw.avi or the relative path ..\..\mount\assets\movies\premium\mlaw.avi. Example 2: If the file is stored on a remote server that is not mounted, the path could be https:\\192.0.2.15\movies\premium\mlaw.avi.
        public let body: Data?

        public init(lastModified: TimeStamp? = nil, cacheControl: String? = nil, contentLength: Int64? = nil, contentRange: String? = nil, contentType: String? = nil, statusCode: Int32, eTag: String? = nil, body: Data? = nil) {
            self.lastModified = lastModified
            self.cacheControl = cacheControl
            self.contentLength = contentLength
            self.contentRange = contentRange
            self.contentType = contentType
            self.statusCode = statusCode
            self.eTag = eTag
            self.body = body
        }

        private enum CodingKeys: String, CodingKey {
            case lastModified = "Last-Modified"
            case cacheControl = "Cache-Control"
            case contentLength = "Content-Length"
            case contentRange = "Content-Range"
            case contentType = "Content-Type"
            case statusCode = "StatusCode"
            case eTag = "ETag"
            case body = "Body"
        }
    }

    public struct ListItemsRequest: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "Path", location: .querystring(locationName: "Path"), required: false, type: .string), 
            AWSShapeMember(label: "NextToken", location: .querystring(locationName: "NextToken"), required: false, type: .string), 
            AWSShapeMember(label: "MaxResults", location: .querystring(locationName: "MaxResults"), required: false, type: .integer)
        ]
        /// The path in the container from which to retrieve items. Format: &lt;folder name&gt;/&lt;folder name&gt;/&lt;file name&gt;
        public let path: String?
        /// The NextToken received in the ListItemsResponse for the same container and path. Tokens expire after 15 minutes.
        public let nextToken: String?
        /// The maximum results to return. The service might return fewer results.
        public let maxResults: Int32?

        public init(path: String? = nil, nextToken: String? = nil, maxResults: Int32? = nil) {
            self.path = path
            self.nextToken = nextToken
            self.maxResults = maxResults
        }

        private enum CodingKeys: String, CodingKey {
            case path = "Path"
            case nextToken = "NextToken"
            case maxResults = "MaxResults"
        }
    }

    public struct DeleteObjectResponse: AWSShape {

    }

    public struct ListItemsResponse: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "Items", required: false, type: .list), 
            AWSShapeMember(label: "NextToken", required: false, type: .string)
        ]
        /// Metadata entries for the folders and objects at the requested path.
        public let items: [Item]?
        /// The NextToken used to request the next page of results using ListItems.
        public let nextToken: String?

        public init(items: [Item]? = nil, nextToken: String? = nil) {
            self.items = items
            self.nextToken = nextToken
        }

        private enum CodingKeys: String, CodingKey {
            case items = "Items"
            case nextToken = "NextToken"
        }
    }

    public enum ItemType: String, CustomStringConvertible, Codable {
        case object = "OBJECT"
        case folder = "FOLDER"
        public var description: String { return self.rawValue }
    }

    public enum StorageClass: String, CustomStringConvertible, Codable {
        case temporal = "TEMPORAL"
        public var description: String { return self.rawValue }
    }

}