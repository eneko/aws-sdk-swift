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

/// Error enum for Dax
public enum DaxError: AWSErrorType {
    case subnetGroupAlreadyExistsFault(message: String?)
    case subnetGroupQuotaExceededFault(message: String?)
    case subnetQuotaExceededFault(message: String?)
    case invalidSubnet(message: String?)
    case parameterGroupQuotaExceededFault(message: String?)
    case parameterGroupAlreadyExistsFault(message: String?)
    case invalidParameterGroupStateFault(message: String?)
    case invalidParameterValueException(message: String?)
    case invalidParameterCombinationException(message: String?)
    case subnetGroupInUseFault(message: String?)
    case subnetGroupNotFoundFault(message: String?)
    case clusterNotFoundFault(message: String?)
    case invalidClusterStateFault(message: String?)
    case parameterGroupNotFoundFault(message: String?)
    case subnetInUse(message: String?)
    case invalidARNFault(message: String?)
    case clusterAlreadyExistsFault(message: String?)
    case insufficientClusterCapacityFault(message: String?)
    case clusterQuotaForCustomerExceededFault(message: String?)
    case nodeQuotaForClusterExceededFault(message: String?)
    case nodeQuotaForCustomerExceededFault(message: String?)
    case invalidVPCNetworkStateFault(message: String?)
    case tagQuotaPerResourceExceeded(message: String?)
    case tagNotFoundFault(message: String?)
    case nodeNotFoundFault(message: String?)
}

extension DaxError {
    public init?(errorCode: String, message: String?){
        var errorCode = errorCode
        if let index = errorCode.index(of: "#") {
            errorCode = errorCode.substring(from: errorCode.index(index, offsetBy: 1))
        }
        switch errorCode {
        case "SubnetGroupAlreadyExistsFault":
            self = .subnetGroupAlreadyExistsFault(message: message)
        case "SubnetGroupQuotaExceededFault":
            self = .subnetGroupQuotaExceededFault(message: message)
        case "SubnetQuotaExceededFault":
            self = .subnetQuotaExceededFault(message: message)
        case "InvalidSubnet":
            self = .invalidSubnet(message: message)
        case "ParameterGroupQuotaExceededFault":
            self = .parameterGroupQuotaExceededFault(message: message)
        case "ParameterGroupAlreadyExistsFault":
            self = .parameterGroupAlreadyExistsFault(message: message)
        case "InvalidParameterGroupStateFault":
            self = .invalidParameterGroupStateFault(message: message)
        case "InvalidParameterValueException":
            self = .invalidParameterValueException(message: message)
        case "InvalidParameterCombinationException":
            self = .invalidParameterCombinationException(message: message)
        case "SubnetGroupInUseFault":
            self = .subnetGroupInUseFault(message: message)
        case "SubnetGroupNotFoundFault":
            self = .subnetGroupNotFoundFault(message: message)
        case "ClusterNotFoundFault":
            self = .clusterNotFoundFault(message: message)
        case "InvalidClusterStateFault":
            self = .invalidClusterStateFault(message: message)
        case "ParameterGroupNotFoundFault":
            self = .parameterGroupNotFoundFault(message: message)
        case "SubnetInUse":
            self = .subnetInUse(message: message)
        case "InvalidARNFault":
            self = .invalidARNFault(message: message)
        case "ClusterAlreadyExistsFault":
            self = .clusterAlreadyExistsFault(message: message)
        case "InsufficientClusterCapacityFault":
            self = .insufficientClusterCapacityFault(message: message)
        case "ClusterQuotaForCustomerExceededFault":
            self = .clusterQuotaForCustomerExceededFault(message: message)
        case "NodeQuotaForClusterExceededFault":
            self = .nodeQuotaForClusterExceededFault(message: message)
        case "NodeQuotaForCustomerExceededFault":
            self = .nodeQuotaForCustomerExceededFault(message: message)
        case "InvalidVPCNetworkStateFault":
            self = .invalidVPCNetworkStateFault(message: message)
        case "TagQuotaPerResourceExceeded":
            self = .tagQuotaPerResourceExceeded(message: message)
        case "TagNotFoundFault":
            self = .tagNotFoundFault(message: message)
        case "NodeNotFoundFault":
            self = .nodeNotFoundFault(message: message)
        default:
            return nil
        }
    }
}