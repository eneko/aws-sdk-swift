// THIS FILE IS AUTOMATICALLY GENERATED by https://github.com/swift-aws/aws-sdk-swift/blob/master/CodeGenerator/Sources/CodeGenerator/main.swift. DO NOT EDIT.

import AWSSDKSwiftCore

/// Error enum for WorkDocs
public enum WorkDocsErrorType: AWSErrorType {
    case concurrentModificationException(message: String?)
    case conflictingOperationException(message: String?)
    case customMetadataLimitExceededException(message: String?)
    case deactivatingLastSystemUserException(message: String?)
    case documentLockedForCommentsException(message: String?)
    case draftUploadOutOfSyncException(message: String?)
    case entityAlreadyExistsException(message: String?)
    case entityNotExistsException(message: String?)
    case failedDependencyException(message: String?)
    case illegalUserStateException(message: String?)
    case invalidArgumentException(message: String?)
    case invalidCommentOperationException(message: String?)
    case invalidOperationException(message: String?)
    case invalidPasswordException(message: String?)
    case limitExceededException(message: String?)
    case prohibitedStateException(message: String?)
    case requestedEntityTooLargeException(message: String?)
    case resourceAlreadyCheckedOutException(message: String?)
    case serviceUnavailableException(message: String?)
    case storageLimitExceededException(message: String?)
    case storageLimitWillExceedException(message: String?)
    case tooManyLabelsException(message: String?)
    case tooManySubscriptionsException(message: String?)
    case unauthorizedOperationException(message: String?)
    case unauthorizedResourceAccessException(message: String?)
}

extension WorkDocsErrorType {
    public init?(errorCode: String, message: String?){
        var errorCode = errorCode
        if let index = errorCode.firstIndex(of: "#") {
            errorCode = String(errorCode[errorCode.index(index, offsetBy: 1)...])
        }
        switch errorCode {
        case "ConcurrentModificationException":
            self = .concurrentModificationException(message: message)
        case "ConflictingOperationException":
            self = .conflictingOperationException(message: message)
        case "CustomMetadataLimitExceededException":
            self = .customMetadataLimitExceededException(message: message)
        case "DeactivatingLastSystemUserException":
            self = .deactivatingLastSystemUserException(message: message)
        case "DocumentLockedForCommentsException":
            self = .documentLockedForCommentsException(message: message)
        case "DraftUploadOutOfSyncException":
            self = .draftUploadOutOfSyncException(message: message)
        case "EntityAlreadyExistsException":
            self = .entityAlreadyExistsException(message: message)
        case "EntityNotExistsException":
            self = .entityNotExistsException(message: message)
        case "FailedDependencyException":
            self = .failedDependencyException(message: message)
        case "IllegalUserStateException":
            self = .illegalUserStateException(message: message)
        case "InvalidArgumentException":
            self = .invalidArgumentException(message: message)
        case "InvalidCommentOperationException":
            self = .invalidCommentOperationException(message: message)
        case "InvalidOperationException":
            self = .invalidOperationException(message: message)
        case "InvalidPasswordException":
            self = .invalidPasswordException(message: message)
        case "LimitExceededException":
            self = .limitExceededException(message: message)
        case "ProhibitedStateException":
            self = .prohibitedStateException(message: message)
        case "RequestedEntityTooLargeException":
            self = .requestedEntityTooLargeException(message: message)
        case "ResourceAlreadyCheckedOutException":
            self = .resourceAlreadyCheckedOutException(message: message)
        case "ServiceUnavailableException":
            self = .serviceUnavailableException(message: message)
        case "StorageLimitExceededException":
            self = .storageLimitExceededException(message: message)
        case "StorageLimitWillExceedException":
            self = .storageLimitWillExceedException(message: message)
        case "TooManyLabelsException":
            self = .tooManyLabelsException(message: message)
        case "TooManySubscriptionsException":
            self = .tooManySubscriptionsException(message: message)
        case "UnauthorizedOperationException":
            self = .unauthorizedOperationException(message: message)
        case "UnauthorizedResourceAccessException":
            self = .unauthorizedResourceAccessException(message: message)
        default:
            return nil
        }
    }
}

extension WorkDocsErrorType : CustomStringConvertible {
    public var description : String {
        switch self {
        case .concurrentModificationException(let message):
            return "ConcurrentModificationException: \(message ?? "")"
        case .conflictingOperationException(let message):
            return "ConflictingOperationException: \(message ?? "")"
        case .customMetadataLimitExceededException(let message):
            return "CustomMetadataLimitExceededException: \(message ?? "")"
        case .deactivatingLastSystemUserException(let message):
            return "DeactivatingLastSystemUserException: \(message ?? "")"
        case .documentLockedForCommentsException(let message):
            return "DocumentLockedForCommentsException: \(message ?? "")"
        case .draftUploadOutOfSyncException(let message):
            return "DraftUploadOutOfSyncException: \(message ?? "")"
        case .entityAlreadyExistsException(let message):
            return "EntityAlreadyExistsException: \(message ?? "")"
        case .entityNotExistsException(let message):
            return "EntityNotExistsException: \(message ?? "")"
        case .failedDependencyException(let message):
            return "FailedDependencyException: \(message ?? "")"
        case .illegalUserStateException(let message):
            return "IllegalUserStateException: \(message ?? "")"
        case .invalidArgumentException(let message):
            return "InvalidArgumentException: \(message ?? "")"
        case .invalidCommentOperationException(let message):
            return "InvalidCommentOperationException: \(message ?? "")"
        case .invalidOperationException(let message):
            return "InvalidOperationException: \(message ?? "")"
        case .invalidPasswordException(let message):
            return "InvalidPasswordException: \(message ?? "")"
        case .limitExceededException(let message):
            return "LimitExceededException: \(message ?? "")"
        case .prohibitedStateException(let message):
            return "ProhibitedStateException: \(message ?? "")"
        case .requestedEntityTooLargeException(let message):
            return "RequestedEntityTooLargeException: \(message ?? "")"
        case .resourceAlreadyCheckedOutException(let message):
            return "ResourceAlreadyCheckedOutException: \(message ?? "")"
        case .serviceUnavailableException(let message):
            return "ServiceUnavailableException: \(message ?? "")"
        case .storageLimitExceededException(let message):
            return "StorageLimitExceededException: \(message ?? "")"
        case .storageLimitWillExceedException(let message):
            return "StorageLimitWillExceedException: \(message ?? "")"
        case .tooManyLabelsException(let message):
            return "TooManyLabelsException: \(message ?? "")"
        case .tooManySubscriptionsException(let message):
            return "TooManySubscriptionsException: \(message ?? "")"
        case .unauthorizedOperationException(let message):
            return "UnauthorizedOperationException: \(message ?? "")"
        case .unauthorizedResourceAccessException(let message):
            return "UnauthorizedResourceAccessException: \(message ?? "")"
        }
    }
}
