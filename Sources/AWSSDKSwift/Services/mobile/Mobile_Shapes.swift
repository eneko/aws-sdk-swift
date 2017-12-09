// THIS FILE IS AUTOMATICALLY GENERATED by https://github.com/noppoMan/aws-sdk-swift/blob/master/Sources/CodeGenerator/main.swift. DO NOT EDIT.

import Foundation
import AWSSDKSwiftCore

extension Mobile {

    public struct ExportProjectRequest: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "projectId", location: .uri(locationName: "projectId"), required: true, type: .string)
        ]
        ///  Unique project identifier. 
        public let projectId: String

        public init(projectId: String) {
            self.projectId = projectId
        }

        private enum CodingKeys: String, CodingKey {
            case projectId = "projectId"
        }
    }

    public struct ExportBundleResult: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "downloadUrl", required: false, type: .string)
        ]
        ///  URL which contains the custom-generated SDK and tool packages used to integrate the client mobile app or web app with the AWS resources created by the AWS Mobile Hub project. 
        public let downloadUrl: String?

        public init(downloadUrl: String? = nil) {
            self.downloadUrl = downloadUrl
        }

        private enum CodingKeys: String, CodingKey {
            case downloadUrl = "downloadUrl"
        }
    }

    public struct CreateProjectRequest: AWSShape {
        /// The key for the payload
        public static let payloadPath: String? = "contents"
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "snapshotId", location: .querystring(locationName: "snapshotId"), required: false, type: .string), 
            AWSShapeMember(label: "name", location: .querystring(locationName: "name"), required: false, type: .string), 
            AWSShapeMember(label: "region", location: .querystring(locationName: "region"), required: false, type: .string), 
            AWSShapeMember(label: "contents", required: false, type: .blob)
        ]
        ///  Unique identifier for an exported snapshot of project configuration. This snapshot identifier is included in the share URL when a project is exported. 
        public let snapshotId: String?
        ///  Name of the project. 
        public let name: String?
        ///  Default region where project resources should be created. 
        public let region: String?
        ///  ZIP or YAML file which contains configuration settings to be used when creating the project. This may be the contents of the file downloaded from the URL provided in an export project operation. 
        public let contents: Data?

        public init(snapshotId: String? = nil, name: String? = nil, region: String? = nil, contents: Data? = nil) {
            self.snapshotId = snapshotId
            self.name = name
            self.region = region
            self.contents = contents
        }

        private enum CodingKeys: String, CodingKey {
            case snapshotId = "snapshotId"
            case name = "name"
            case region = "region"
            case contents = "contents"
        }
    }

    public struct UpdateProjectResult: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "details", required: false, type: .structure)
        ]
        ///  Detailed information about the updated AWS Mobile Hub project. 
        public let details: ProjectDetails?

        public init(details: ProjectDetails? = nil) {
            self.details = details
        }

        private enum CodingKeys: String, CodingKey {
            case details = "details"
        }
    }

    public struct ExportBundleRequest: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "projectId", location: .querystring(locationName: "projectId"), required: false, type: .string), 
            AWSShapeMember(label: "platform", location: .querystring(locationName: "platform"), required: false, type: .enum), 
            AWSShapeMember(label: "bundleId", location: .uri(locationName: "bundleId"), required: true, type: .string)
        ]
        ///  Unique project identifier. 
        public let projectId: String?
        ///  Developer desktop or target application platform. 
        public let platform: Platform?
        ///  Unique bundle identifier. 
        public let bundleId: String

        public init(projectId: String? = nil, platform: Platform? = nil, bundleId: String) {
            self.projectId = projectId
            self.platform = platform
            self.bundleId = bundleId
        }

        private enum CodingKeys: String, CodingKey {
            case projectId = "projectId"
            case platform = "platform"
            case bundleId = "bundleId"
        }
    }

    public struct DeleteProjectRequest: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "projectId", location: .uri(locationName: "projectId"), required: true, type: .string)
        ]
        ///  Unique project identifier. 
        public let projectId: String

        public init(projectId: String) {
            self.projectId = projectId
        }

        private enum CodingKeys: String, CodingKey {
            case projectId = "projectId"
        }
    }

    public struct ListBundlesResult: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "bundleList", required: false, type: .list), 
            AWSShapeMember(label: "nextToken", required: false, type: .string)
        ]
        ///  A list of bundles. 
        public let bundleList: [BundleDetails]?
        ///  Pagination token. If non-null pagination token is returned in a result, then pass its value in another request to fetch more entries. 
        public let nextToken: String?

        public init(bundleList: [BundleDetails]? = nil, nextToken: String? = nil) {
            self.bundleList = bundleList
            self.nextToken = nextToken
        }

        private enum CodingKeys: String, CodingKey {
            case bundleList = "bundleList"
            case nextToken = "nextToken"
        }
    }

    public struct DescribeBundleRequest: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "bundleId", location: .uri(locationName: "bundleId"), required: true, type: .string)
        ]
        ///  Unique bundle identifier. 
        public let bundleId: String

        public init(bundleId: String) {
            self.bundleId = bundleId
        }

        private enum CodingKeys: String, CodingKey {
            case bundleId = "bundleId"
        }
    }

    public enum ProjectState: String, CustomStringConvertible, Codable {
        case normal = "NORMAL"
        case syncing = "SYNCING"
        case importing = "IMPORTING"
        public var description: String { return self.rawValue }
    }

    public struct DescribeBundleResult: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "details", required: false, type: .structure)
        ]
        ///  The details of the bundle. 
        public let details: BundleDetails?

        public init(details: BundleDetails? = nil) {
            self.details = details
        }

        private enum CodingKeys: String, CodingKey {
            case details = "details"
        }
    }

    public enum Platform: String, CustomStringConvertible, Codable {
        case osx = "OSX"
        case windows = "WINDOWS"
        case linux = "LINUX"
        case objc = "OBJC"
        case swift = "SWIFT"
        case android = "ANDROID"
        case javascript = "JAVASCRIPT"
        public var description: String { return self.rawValue }
    }

    public struct ProjectDetails: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "state", required: false, type: .enum), 
            AWSShapeMember(label: "name", required: false, type: .string), 
            AWSShapeMember(label: "projectId", required: false, type: .string), 
            AWSShapeMember(label: "consoleUrl", required: false, type: .string), 
            AWSShapeMember(label: "region", required: false, type: .string), 
            AWSShapeMember(label: "createdDate", required: false, type: .timestamp), 
            AWSShapeMember(label: "lastUpdatedDate", required: false, type: .timestamp), 
            AWSShapeMember(label: "resources", required: false, type: .list)
        ]
        public let state: ProjectState?
        public let name: String?
        public let projectId: String?
        ///  Website URL for this project in the AWS Mobile Hub console. 
        public let consoleUrl: String?
        public let region: String?
        ///  Date the project was created. 
        public let createdDate: TimeStamp?
        ///  Date of the last modification of the project. 
        public let lastUpdatedDate: TimeStamp?
        public let resources: [Resource]?

        public init(state: ProjectState? = nil, name: String? = nil, projectId: String? = nil, consoleUrl: String? = nil, region: String? = nil, createdDate: TimeStamp? = nil, lastUpdatedDate: TimeStamp? = nil, resources: [Resource]? = nil) {
            self.state = state
            self.name = name
            self.projectId = projectId
            self.consoleUrl = consoleUrl
            self.region = region
            self.createdDate = createdDate
            self.lastUpdatedDate = lastUpdatedDate
            self.resources = resources
        }

        private enum CodingKeys: String, CodingKey {
            case state = "state"
            case name = "name"
            case projectId = "projectId"
            case consoleUrl = "consoleUrl"
            case region = "region"
            case createdDate = "createdDate"
            case lastUpdatedDate = "lastUpdatedDate"
            case resources = "resources"
        }
    }

    public struct ListBundlesRequest: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "maxResults", location: .querystring(locationName: "maxResults"), required: false, type: .integer), 
            AWSShapeMember(label: "nextToken", location: .querystring(locationName: "nextToken"), required: false, type: .string)
        ]
        ///  Maximum number of records to list in a single response. 
        public let maxResults: Int32?
        ///  Pagination token. Set to null to start listing bundles from start. If non-null pagination token is returned in a result, then pass its value in here in another request to list more bundles. 
        public let nextToken: String?

        public init(maxResults: Int32? = nil, nextToken: String? = nil) {
            self.maxResults = maxResults
            self.nextToken = nextToken
        }

        private enum CodingKeys: String, CodingKey {
            case maxResults = "maxResults"
            case nextToken = "nextToken"
        }
    }

    public struct CreateProjectResult: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "details", required: false, type: .structure)
        ]
        ///  Detailed information about the created AWS Mobile Hub project. 
        public let details: ProjectDetails?

        public init(details: ProjectDetails? = nil) {
            self.details = details
        }

        private enum CodingKeys: String, CodingKey {
            case details = "details"
        }
    }

    public struct BundleDetails: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "iconUrl", required: false, type: .string), 
            AWSShapeMember(label: "description", required: false, type: .string), 
            AWSShapeMember(label: "title", required: false, type: .string), 
            AWSShapeMember(label: "availablePlatforms", required: false, type: .list), 
            AWSShapeMember(label: "bundleId", required: false, type: .string), 
            AWSShapeMember(label: "version", required: false, type: .string)
        ]
        public let iconUrl: String?
        public let description: String?
        public let title: String?
        public let availablePlatforms: [Platform]?
        public let bundleId: String?
        public let version: String?

        public init(iconUrl: String? = nil, description: String? = nil, title: String? = nil, availablePlatforms: [Platform]? = nil, bundleId: String? = nil, version: String? = nil) {
            self.iconUrl = iconUrl
            self.description = description
            self.title = title
            self.availablePlatforms = availablePlatforms
            self.bundleId = bundleId
            self.version = version
        }

        private enum CodingKeys: String, CodingKey {
            case iconUrl = "iconUrl"
            case description = "description"
            case title = "title"
            case availablePlatforms = "availablePlatforms"
            case bundleId = "bundleId"
            case version = "version"
        }
    }

    public struct DescribeProjectRequest: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "projectId", location: .querystring(locationName: "projectId"), required: true, type: .string), 
            AWSShapeMember(label: "syncFromResources", location: .querystring(locationName: "syncFromResources"), required: false, type: .boolean)
        ]
        ///  Unique project identifier. 
        public let projectId: String
        ///  If set to true, causes AWS Mobile Hub to synchronize information from other services, e.g., update state of AWS CloudFormation stacks in the AWS Mobile Hub project. 
        public let syncFromResources: Bool?

        public init(projectId: String, syncFromResources: Bool? = nil) {
            self.projectId = projectId
            self.syncFromResources = syncFromResources
        }

        private enum CodingKeys: String, CodingKey {
            case projectId = "projectId"
            case syncFromResources = "syncFromResources"
        }
    }

    public struct ExportProjectResult: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "snapshotId", required: false, type: .string), 
            AWSShapeMember(label: "shareUrl", required: false, type: .string), 
            AWSShapeMember(label: "downloadUrl", required: false, type: .string)
        ]
        ///  Unique identifier for the exported snapshot of the project configuration. This snapshot identifier is included in the share URL. 
        public let snapshotId: String?
        ///  URL which can be shared to allow other AWS users to create their own project in AWS Mobile Hub with the same configuration as the specified project. This URL pertains to a snapshot in time of the project configuration that is created when this API is called. If you want to share additional changes to your project configuration, then you will need to create and share a new snapshot by calling this method again. 
        public let shareUrl: String?
        ///  URL which can be used to download the exported project configuation file(s). 
        public let downloadUrl: String?

        public init(snapshotId: String? = nil, shareUrl: String? = nil, downloadUrl: String? = nil) {
            self.snapshotId = snapshotId
            self.shareUrl = shareUrl
            self.downloadUrl = downloadUrl
        }

        private enum CodingKeys: String, CodingKey {
            case snapshotId = "snapshotId"
            case shareUrl = "shareUrl"
            case downloadUrl = "downloadUrl"
        }
    }

    public struct ListProjectsResult: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "nextToken", required: false, type: .string), 
            AWSShapeMember(label: "projects", required: false, type: .list)
        ]
        public let nextToken: String?
        public let projects: [ProjectSummary]?

        public init(nextToken: String? = nil, projects: [ProjectSummary]? = nil) {
            self.nextToken = nextToken
            self.projects = projects
        }

        private enum CodingKeys: String, CodingKey {
            case nextToken = "nextToken"
            case projects = "projects"
        }
    }

    public struct Resource: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "name", required: false, type: .string), 
            AWSShapeMember(label: "attributes", required: false, type: .map), 
            AWSShapeMember(label: "feature", required: false, type: .string), 
            AWSShapeMember(label: "type", required: false, type: .string), 
            AWSShapeMember(label: "arn", required: false, type: .string)
        ]
        public let name: String?
        public let attributes: [String: String]?
        public let feature: String?
        public let `type`: String?
        public let arn: String?

        public init(name: String? = nil, attributes: [String: String]? = nil, feature: String? = nil, type: String? = nil, arn: String? = nil) {
            self.name = name
            self.attributes = attributes
            self.feature = feature
            self.`type` = `type`
            self.arn = arn
        }

        private enum CodingKeys: String, CodingKey {
            case name = "name"
            case attributes = "attributes"
            case feature = "feature"
            case `type` = "type"
            case arn = "arn"
        }
    }

    public struct ProjectSummary: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "projectId", required: false, type: .string), 
            AWSShapeMember(label: "name", required: false, type: .string)
        ]
        ///  Unique project identifier. 
        public let projectId: String?
        ///  Name of the project. 
        public let name: String?

        public init(projectId: String? = nil, name: String? = nil) {
            self.projectId = projectId
            self.name = name
        }

        private enum CodingKeys: String, CodingKey {
            case projectId = "projectId"
            case name = "name"
        }
    }

    public struct DeleteProjectResult: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "orphanedResources", required: false, type: .list), 
            AWSShapeMember(label: "deletedResources", required: false, type: .list)
        ]
        ///  Resources which were not deleted, due to a risk of losing potentially important data or files. 
        public let orphanedResources: [Resource]?
        ///  Resources which were deleted. 
        public let deletedResources: [Resource]?

        public init(orphanedResources: [Resource]? = nil, deletedResources: [Resource]? = nil) {
            self.orphanedResources = orphanedResources
            self.deletedResources = deletedResources
        }

        private enum CodingKeys: String, CodingKey {
            case orphanedResources = "orphanedResources"
            case deletedResources = "deletedResources"
        }
    }

    public struct UpdateProjectRequest: AWSShape {
        /// The key for the payload
        public static let payloadPath: String? = "contents"
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "projectId", location: .querystring(locationName: "projectId"), required: true, type: .string), 
            AWSShapeMember(label: "contents", required: false, type: .blob)
        ]
        ///  Unique project identifier. 
        public let projectId: String
        ///  ZIP or YAML file which contains project configuration to be updated. This should be the contents of the file downloaded from the URL provided in an export project operation. 
        public let contents: Data?

        public init(projectId: String, contents: Data? = nil) {
            self.projectId = projectId
            self.contents = contents
        }

        private enum CodingKeys: String, CodingKey {
            case projectId = "projectId"
            case contents = "contents"
        }
    }

    public struct ListProjectsRequest: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "maxResults", location: .querystring(locationName: "maxResults"), required: false, type: .integer), 
            AWSShapeMember(label: "nextToken", location: .querystring(locationName: "nextToken"), required: false, type: .string)
        ]
        ///  Maximum number of records to list in a single response. 
        public let maxResults: Int32?
        ///  Pagination token. Set to null to start listing projects from start. If non-null pagination token is returned in a result, then pass its value in here in another request to list more projects. 
        public let nextToken: String?

        public init(maxResults: Int32? = nil, nextToken: String? = nil) {
            self.maxResults = maxResults
            self.nextToken = nextToken
        }

        private enum CodingKeys: String, CodingKey {
            case maxResults = "maxResults"
            case nextToken = "nextToken"
        }
    }

    public struct DescribeProjectResult: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "details", required: false, type: .structure)
        ]
        public let details: ProjectDetails?

        public init(details: ProjectDetails? = nil) {
            self.details = details
        }

        private enum CodingKeys: String, CodingKey {
            case details = "details"
        }
    }

}