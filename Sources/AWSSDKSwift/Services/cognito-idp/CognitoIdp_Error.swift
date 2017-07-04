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

import AWSSDKSwiftCore

/// Error enum for CognitoIdp
public enum CognitoIdpError: AWSErrorType {
    case resourceNotFoundException(message: String?)
    case invalidParameterException(message: String?)
    case unexpectedLambdaException(message: String?)
    case userLambdaValidationException(message: String?)
    case invalidLambdaResponseException(message: String?)
    case aliasExistsException(message: String?)
    case tooManyRequestsException(message: String?)
    case notAuthorizedException(message: String?)
    case userNotFoundException(message: String?)
    case internalErrorException(message: String?)
    case codeMismatchException(message: String?)
    case expiredCodeException(message: String?)
    case invalidPasswordException(message: String?)
    case invalidUserPoolConfigurationException(message: String?)
    case mFAMethodNotFoundException(message: String?)
    case passwordResetRequiredException(message: String?)
    case userNotConfirmedException(message: String?)
    case invalidSmsRoleAccessPolicyException(message: String?)
    case invalidSmsRoleTrustRelationshipException(message: String?)
    case userImportInProgressException(message: String?)
    case usernameExistsException(message: String?)
    case codeDeliveryFailureException(message: String?)
    case preconditionNotMetException(message: String?)
    case unsupportedUserStateException(message: String?)
    case duplicateProviderException(message: String?)
    case limitExceededException(message: String?)
    case scopeDoesNotExistException(message: String?)
    case invalidOAuthFlowException(message: String?)
    case invalidEmailRoleAccessPolicyException(message: String?)
    case groupExistsException(message: String?)
    case unsupportedIdentityProviderException(message: String?)
    case userPoolTaggingException(message: String?)
    case tooManyFailedAttemptsException(message: String?)
    case concurrentModificationException(message: String?)
}

extension CognitoIdpError {
    public init?(errorCode: String, message: String?){
        var errorCode = errorCode
        if let index = errorCode.index(of: "#") {
            errorCode = errorCode.substring(from: errorCode.index(index, offsetBy: 1))
        }
        switch errorCode {
        case "ResourceNotFoundException":
            self = .resourceNotFoundException(message: message)
        case "InvalidParameterException":
            self = .invalidParameterException(message: message)
        case "UnexpectedLambdaException":
            self = .unexpectedLambdaException(message: message)
        case "UserLambdaValidationException":
            self = .userLambdaValidationException(message: message)
        case "InvalidLambdaResponseException":
            self = .invalidLambdaResponseException(message: message)
        case "AliasExistsException":
            self = .aliasExistsException(message: message)
        case "TooManyRequestsException":
            self = .tooManyRequestsException(message: message)
        case "NotAuthorizedException":
            self = .notAuthorizedException(message: message)
        case "UserNotFoundException":
            self = .userNotFoundException(message: message)
        case "InternalErrorException":
            self = .internalErrorException(message: message)
        case "CodeMismatchException":
            self = .codeMismatchException(message: message)
        case "ExpiredCodeException":
            self = .expiredCodeException(message: message)
        case "InvalidPasswordException":
            self = .invalidPasswordException(message: message)
        case "InvalidUserPoolConfigurationException":
            self = .invalidUserPoolConfigurationException(message: message)
        case "MFAMethodNotFoundException":
            self = .mFAMethodNotFoundException(message: message)
        case "PasswordResetRequiredException":
            self = .passwordResetRequiredException(message: message)
        case "UserNotConfirmedException":
            self = .userNotConfirmedException(message: message)
        case "InvalidSmsRoleAccessPolicyException":
            self = .invalidSmsRoleAccessPolicyException(message: message)
        case "InvalidSmsRoleTrustRelationshipException":
            self = .invalidSmsRoleTrustRelationshipException(message: message)
        case "UserImportInProgressException":
            self = .userImportInProgressException(message: message)
        case "UsernameExistsException":
            self = .usernameExistsException(message: message)
        case "CodeDeliveryFailureException":
            self = .codeDeliveryFailureException(message: message)
        case "PreconditionNotMetException":
            self = .preconditionNotMetException(message: message)
        case "UnsupportedUserStateException":
            self = .unsupportedUserStateException(message: message)
        case "DuplicateProviderException":
            self = .duplicateProviderException(message: message)
        case "LimitExceededException":
            self = .limitExceededException(message: message)
        case "ScopeDoesNotExistException":
            self = .scopeDoesNotExistException(message: message)
        case "InvalidOAuthFlowException":
            self = .invalidOAuthFlowException(message: message)
        case "InvalidEmailRoleAccessPolicyException":
            self = .invalidEmailRoleAccessPolicyException(message: message)
        case "GroupExistsException":
            self = .groupExistsException(message: message)
        case "UnsupportedIdentityProviderException":
            self = .unsupportedIdentityProviderException(message: message)
        case "UserPoolTaggingException":
            self = .userPoolTaggingException(message: message)
        case "TooManyFailedAttemptsException":
            self = .tooManyFailedAttemptsException(message: message)
        case "ConcurrentModificationException":
            self = .concurrentModificationException(message: message)
        default:
            return nil
        }
    }
}