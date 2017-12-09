// THIS FILE IS AUTOMATICALLY GENERATED by https://github.com/noppoMan/aws-sdk-swift/blob/master/Sources/CodeGenerator/main.swift. DO NOT EDIT.

import AWSSDKSwiftCore

/// Error enum for Translate
public enum TranslateError: AWSErrorType {
    case invalidRequestException(message: String?)
    case textSizeLimitExceededException(message: String?)
    case tooManyRequestsException(message: String?)
    case unsupportedLanguagePairException(message: String?)
    case internalServerException(message: String?)
    case serviceUnavailableException(message: String?)
}

extension TranslateError {
    public init?(errorCode: String, message: String?){
        var errorCode = errorCode
        if let index = errorCode.index(of: "#") {
            errorCode = String(errorCode[errorCode.index(index, offsetBy: 1)...])
        }
        switch errorCode {
        case "InvalidRequestException":
            self = .invalidRequestException(message: message)
        case "TextSizeLimitExceededException":
            self = .textSizeLimitExceededException(message: message)
        case "TooManyRequestsException":
            self = .tooManyRequestsException(message: message)
        case "UnsupportedLanguagePairException":
            self = .unsupportedLanguagePairException(message: message)
        case "InternalServerException":
            self = .internalServerException(message: message)
        case "ServiceUnavailableException":
            self = .serviceUnavailableException(message: message)
        default:
            return nil
        }
    }
}