//
//  CodeGenerator.swift
//  AWSSDKSwift
//
//  Created by Yuki Takei on 2017/04/04.
//
//

// TODO should use template engine to generate code

import Foundation
import SwiftyJSON
import Core

extension Core.Operation {
    func generateSwiftFunctionCode() -> String {
        var code = ""
        
        if let shape = self.inputShape {
            code += "public func \(name.toSwiftVariableCase())(_ input: \(shape.swiftTypeName))"
        } else {
            code += "public func \(name.toSwiftVariableCase())()"
        }
        
        code += " throws"
        
        if let shape = self.outputShape {
            code += " -> \(shape.swiftTypeName)"
        }
        
        code += " {\n"
        
        if outputShape != nil {
            code += "\(indt(1))return try client.send("
        } else {
            code += "\(indt(1))_ = try client.send("
        }
        
        code += "operation: \"\(name)\", "
        code += "path: \"\(path)\", "
        code += "httpMethod: \"\(httpMethod)\""
        if inputShape != nil {
            code += ", "
            code += "input: input"
        }

        code += ")\n"
        code += "}"
        
        return code
    }
}

extension Member {
    var variableName: String {
        return name.toSwiftVariableCase()
    }
    
    var defaultValue: String {
        if !required {
            return "nil"
        }
        
        switch shape.type {
        case .integer(_), .float(_), .double(_), .long(_):
            return "0"
        case .boolean:
            return "false"
        case .blob(_):
            return "Data()"
        case .timestamp:
            return "Date()"
        case .list(_):
            return "[]"
        case .map(_):
            return "[:]"
        case .structure(_):
            return "\(shape.name)()"
        default:
            return "\"\""
        }
    }
    
    func toSwiftMutableMemberSyntax() -> String {
        let optionalSuffix = required ? "" : "?"
        return "var \(name.toSwiftVariableCase()): \(swiftTypeName)\(optionalSuffix) = \(defaultValue)"
    }
    
    func toSwiftImmutableMemberSyntax() -> String {
        let optionalSuffix = required ? "" : "?"
        return "let \(name.toSwiftVariableCase()): \(swiftTypeName)\(optionalSuffix)"
    }
    
    func toSwiftArgumentSyntax() -> String {
        let optionalSuffix = required ? "" : "?"
        let defaultArgument = required ? "" : " = nil"
        return "\(name.toSwiftLabelCase()): \(swiftTypeName)\(optionalSuffix)\(defaultArgument)"
    }
    
    func guardStatement() -> String {
        switch shape.type {
        case .structure(_), .map(_):
            return "guard let \(variableName) = dictionary[\"\(name)\"] as? [String: Any] else { throw InitializableError.missingRequiredParam(\"\(name)\") }"
            
        case .list(let shape):
            switch shape.type {
            case .structure(_), .map(_):
                return "guard let \(variableName) = dictionary[\"\(name)\"] as? [[String: Any]] else { throw InitializableError.missingRequiredParam(\"\(name)\") }"
            default:
                return "guard let \(variableName) = dictionary[\"\(name)\"] as? [\(shape.swiftTypeName)] else { throw InitializableError.missingRequiredParam(\"\(name)\") }"
            }
        default:
            return "guard let \(variableName) = dictionary[\"\(name)\"] as? \(shape.swiftTypeName) else { throw InitializableError.missingRequiredParam(\"\(name)\") }"
        }
    }
}

extension AWSService {
    func generateErrorCode() -> String {
        if errorShapeNames.isEmpty { return "" }
        var code = ""
        code += autoGeneratedHeader
        code += "import Core"
        code += "\n\n"
        code += "/// Error enum for \(serviceName)\n"
        code += ""
        code += "public enum \(serviceErrorName): AWSErrorType {\n"
        for name in errorShapeNames {
            code += "\(indt(1))case \(name.toSwiftVariableCase())(message: String?)\n"
        }
        code += "}"
        code += "\n\n"
        code += "extension \(serviceErrorName) {\n"
        code += "\(indt(1))public init?(errorCode: String, message: String?){\n"
        code += "\(indt(2))var errorCode = errorCode\n"
        code += "\(indt(2))if let index = errorCode.index(of: \"#\") {\n"
            code += "\(indt(3))errorCode = errorCode.substring(from: errorCode.index(index, offsetBy: 1))\n"
        code += "\(indt(2))}\n"
        
        code += "\(indt(2))switch errorCode {\n"
        for name in errorShapeNames {
            code += "\(indt(2))case \"\(name)\":\n"
            code += "\(indt(3))self = .\(name.toSwiftVariableCase())(message: message)\n"
        }
        code += "\(indt(2))default:\n"
        code += "\(indt(3))return nil\n"
        code += "\(indt(2))}\n"
        code += "\(indt(1))}\n"
        code += "}"
        
        return code
    }
    
    func generateServiceCode() -> String {
        var code = ""
        code += autoGeneratedHeader
        code += "import Foundation\n"
        code += "import Core\n\n"
        code += "/**\n"
        code += serviceDescription+"\n"
        code += "*/\n"
        code += "public "
        code += "struct \(serviceName) {\n\n"
        code += "\(indt(1))let client: AWSClient\n\n"
        
        var middlewares = "[]"
        switch endpointPrefix {
        case "s3":
            middlewares = "[S3RequestMiddleware()]"
        default:
            break
        }
        
        code += "\(indt(1))public init(accessKeyId: String? = nil, secretAccessKey: String? = nil, region: Core.Region? = nil, endpoint: String? = nil, middlewares: [AWSRequestMiddleware] = []) {\n"
        code += "\(indt(2))self.client = AWSClient(\n"
        code += "\(indt(3))accessKeyId: accessKeyId,\n"
        code += "\(indt(3))secretAccessKey: secretAccessKey,\n"
        code += "\(indt(3))region: region,\n"
        if let target = apiJSON["metadata"]["targetPrefix"].string {
            code += "\(indt(3))amzTarget: \"\(target)\",\n"
        }
        code += "\(indt(3))service: \"\(endpointPrefix)\",\n"
        code += "\(indt(3))serviceProtocol: .\(serviceProtocol),\n"
        code += "\(indt(3))apiVersion: \"\(version)\",\n"
        code += "\(indt(3))endpoint: endpoint,\n"
        code += "\(indt(3))middlewares: \(middlewares)"
        if !errorShapeNames.isEmpty {
            code += ",\n"
            code += "\(indt(3))possibleErrorTypes: [\(serviceErrorName).self]"
        }
        code += "\n"
        code += indt(2)+")\n"
        code += "\(indt(1))}\n"
        code += "\n"
        for operation in operations {
            let functionCode = operation.generateSwiftFunctionCode()
                .components(separatedBy: "\n")
                .map({ indt(1)+$0 })
                .joined(separator: "\n")
            
            let comment = docJSON["operations"][operation.name].stringValue.tagStriped()
            
            code += "\(indt(1))///  \(comment)\n"
            code += functionCode
            code += "\n\n"
        }
        code += "\n"
        code += "}"
        
        return code
    }
    
    // TODO refactor me with recursive pattern matching
    func generateInitialzerFromDictionary(_ structure: StructureShape) -> String {
        var code = ""
        code += "\(indt(2))public init(dictionary: [String: Any]) throws {\n"
        
        for member in structure.members {
            switch member.shape.type {
            case .structure(_):
                let substituting = "self.\(member.variableName) = try \(serviceName).\(member.swiftTypeName)(dictionary: \(member.variableName))"
                
                if member.required {
                    code += "\(indt(3))\(member.guardStatement())"
                    code += "\n"
                    code += indt(3)+substituting
                } else {
                    code += "\(indt(3))if let \(member.variableName) = dictionary[\"\(member.name)\"] as? [String: Any] { \(substituting) } else { self.\(member.variableName) = nil }"
                }
                code += "\n"
            case .map(_, let valueShape):
                let dictName = "\(member.variableName)Dict"
                var decodingCode: ((_ defaultIndentLevel: Int) -> String)?
                var firstElementType = "[String: Any]"
                
                switch valueShape.type {
                case .structure(_): // [String: AWSShape]
                    decodingCode = { defaultIndentLevel in
                        var code = ""
                        code += "\(indt(defaultIndentLevel))var \(dictName): \(member.shape.swiftTypeName) = [:]\n"
                        code += "\(indt(defaultIndentLevel))for (key, value) in \(member.variableName) {\n"
                        code += "\(indt(defaultIndentLevel+1))guard let \(valueShape.name.toSwiftVariableCase())Dict = value as? [String: Any] else { throw InitializableError.convertingError }\n"
                        code += "\(indt(defaultIndentLevel+1))\(dictName)[key] = try \(valueShape.swiftTypeName)(dictionary: \(valueShape.name.toSwiftVariableCase())Dict)\n"
                        code += "\(indt(defaultIndentLevel))}\n"
                        code += "\(indt(defaultIndentLevel))self.\(member.variableName) = \(dictName)\n"
                        return code
                    }
                    
                case .list(let repeatedShape):
                    switch repeatedShape.type {
                    case .structure(_): // [String: [Shape]]
                        decodingCode = { defaultIndentLevel in
                            var code = ""
                            code += "\(indt(defaultIndentLevel))var \(dictName): \(member.shape.swiftTypeName) = [:]\n"
                            code += "\(indt(defaultIndentLevel))for (key, value) in \(member.variableName) {\n"
                            code += "\(indt(defaultIndentLevel+1))guard let \(repeatedShape.name.toSwiftVariableCase()) = value as? [[String: Any]] else { throw InitializableError.convertingError }\n"
                            let listName = "\(repeatedShape.name.toSwiftVariableCase())List"
                            code += "\(indt(defaultIndentLevel+1))let \(listName): \(valueShape.swiftTypeName) = try \(repeatedShape.name.toSwiftVariableCase()).map { try \(repeatedShape.swiftTypeName)(dictionary: $0) }\n"
                            code += "\(indt(defaultIndentLevel+1))\(dictName)[key] = \(listName)\n"
                            code += "\(indt(defaultIndentLevel))}\n"
                            code += "\(indt(defaultIndentLevel))self.\(member.variableName) = \(dictName)\n"
                            return code
                        }
                        
                    case .map(_, let childValueShape):  // [String: [[String: AWSShape]]]
                        switch childValueShape.type {
                        case .structure(_):
                            decodingCode = { defaultIndentLevel in
                                var code = ""
                                code += "\(indt(defaultIndentLevel))var \(dictName): \(member.shape.swiftTypeName) = [:]\n"
                                code += "\(indt(defaultIndentLevel))for (key, value) in \(member.variableName) {\n"
                                code += "\(indt(defaultIndentLevel+1))guard let \(valueShape.name.toSwiftVariableCase()) = value as? [[String: [String: Any]]] else { throw InitializableError.convertingError }\n"
                                code += "\(indt(defaultIndentLevel+1))var \(valueShape.name.toSwiftVariableCase())List: \(valueShape.swiftTypeName) = []\n"
                                code += "\(indt(defaultIndentLevel+1))for item in \(valueShape.name.toSwiftVariableCase()) {\n"
                                    code += "\(indt(defaultIndentLevel+2))var \(childValueShape.name.toSwiftVariableCase())Dict: [String: \(childValueShape.swiftTypeName)] = [:]\n"
                                    code += "\(indt(defaultIndentLevel+2))for (key, value) in item {\n"
                                        code += "\(indt(defaultIndentLevel+3))\(childValueShape.name.toSwiftVariableCase())Dict[key] = try \(childValueShape.swiftTypeName)(dictionary: value)\n"
                                    code += "\(indt(defaultIndentLevel+2))}\n"
                                    code += "\(indt(defaultIndentLevel+2))\(valueShape.name.toSwiftVariableCase())List.append(\(childValueShape.name.toSwiftVariableCase())Dict)\n"
                                code += "\(indt(defaultIndentLevel+1))}\n"
                                code += "\(indt(defaultIndentLevel+1))\(dictName)[key] = \(valueShape.name.toSwiftVariableCase())List\n"
                                code += "\(indt(defaultIndentLevel))}\n"
                                code += "\(indt(defaultIndentLevel))self.\(member.variableName) = \(dictName)\n"
                                return code
                            }

                        default:
                            fatalError("Unimplemented \(#file):\(#line)")
                        }
                        
                    case .list(_):
                        // TODO implement here
                        code += "\(indt(3))self.\(member.variableName) = [:]\n"
                        break
                        
                    default:
                        decodingCode = { defaultIndentLevel in
                            var code = ""
                            code += "\(indt(defaultIndentLevel))var \(dictName): \(member.shape.swiftTypeName) = [:]\n"
                            code += "\(indt(defaultIndentLevel))for (key, value) in \(member.name.toSwiftVariableCase()) {\n"
                                code += "\(indt(defaultIndentLevel+1))guard let \(valueShape.name.toSwiftVariableCase()) = value as? \(valueShape.swiftTypeName) else { throw InitializableError.convertingError }\n"
                                code += "\(indt(defaultIndentLevel+1))\(dictName)[key] = \(valueShape.name.toSwiftVariableCase())\n"
                            code += "\(indt(defaultIndentLevel))}\n"
                            code += "\(indt(defaultIndentLevel))self.\(member.variableName) = \(dictName)\n"
                            return code
                        }
                    }
                    
                case .map(_, let childValueShape):
                    switch childValueShape.type {
                    case .structure(_):  // [String: [String: AWSShape]]
                        decodingCode = { defaultIndentLevel in
                            var code = ""
                            code += "\(indt(defaultIndentLevel))var \(dictName): \(member.shape.swiftTypeName) = [:]\n"
                            code += "\(indt(defaultIndentLevel))for (key, value) in \(member.variableName) {\n"
                                code += "\(indt(defaultIndentLevel+1))guard let value = value as? [String: [String: Any]] else { throw InitializableError.convertingError }\n"
                                code += "\(indt(defaultIndentLevel+1))var \(valueShape.name.toSwiftVariableCase())Dict: \(valueShape.swiftTypeName) = [:]\n"
                                code += "\(indt(defaultIndentLevel+1))for (key, value) in value {\n"
                                    code += "\(indt(defaultIndentLevel+2))\(valueShape.name.toSwiftVariableCase())Dict[key] = try \(childValueShape.swiftTypeName)(dictionary: value)\n"
                                code += "\(indt(defaultIndentLevel+1))}\n"
                                code += "\(indt(defaultIndentLevel+1))\(dictName)[key] = \(valueShape.name.toSwiftVariableCase())Dict\n"
                            code += "\(indt(defaultIndentLevel))}\n"
                            code += "\(indt(defaultIndentLevel))self.\(member.variableName) = \(dictName)\n"
                            return code
                        }
                        
                    default:
                        fatalError("Unimplemented \(#file):\(#line)")
                    }
                default:
                    firstElementType = member.swiftTypeName
                    decodingCode = { defaultIndentLevel in
                        var code = ""
                        code += "\(indt(defaultIndentLevel))self.\(member.variableName) = \(member.variableName)\n"
                        return code
                    }
                }
                
                if let decodingCode = decodingCode {
                    if member.required {
                        code += "\(indt(3))guard let \(member.variableName) = dictionary[\"\(member.name)\"] as? \(firstElementType) else { throw InitializableError.missingRequiredParam(\"\(member.name)\") }\n"
                        code += decodingCode(3)
                    } else {
                        code += "\(indt(3))if let \(member.variableName) = dictionary[\"\(member.name)\"] as? \(firstElementType) {\n"
                        code += decodingCode(4)
                        code += "\(indt(3))} else { \n"
                        code += "\(indt(4))self.\(member.variableName) = nil\n"
                        code += "\(indt(3))}\n"
                    }
                }
                
            case .list(let shape):
                switch shape.type {
                case .structure:
                    if member.required {
                        code += "\(indt(3))guard let \(member.variableName) = dictionary[\"\(member.name)\"] as? [[String: Any]] else { throw InitializableError.missingRequiredParam(\"\(member.name)\") }\n"
                        code += "\(indt(3))self.\(member.variableName) = try \(member.variableName).map({ try \(shape.swiftTypeName)(dictionary: $0) })\n"
                    } else {
                        code += "\(indt(3))if let \(member.variableName) = dictionary[\"\(member.name)\"] as? [[String: Any]] {\n"
                        code += "\(indt(4))self.\(member.variableName) = try \(member.variableName).map({ try \(shape.swiftTypeName)(dictionary: $0) })\n"
                        code += "\(indt(3))} else { \n"
                        code += "\(indt(4))self.\(member.variableName) = nil\n"
                        code += "\(indt(3))}\n"
                    }
                    
                case .map(_, let valueShape):
                    switch valueShape.type {
                    case .structure: // [[String: AWSShape]]
                        func decodingCode(_ defaultIndentLevel: Int) -> String {
                            var code = ""
                            code += "\(indt(defaultIndentLevel))var \(member.variableName)List: \(member.swiftTypeName) = []\n"
                            code += "\(indt(defaultIndentLevel))var \(valueShape.name.toSwiftVariableCase())Dict: [String: \(valueShape.swiftTypeName)] = [:]\n"
                            code += "\(indt(defaultIndentLevel))for item in \(member.variableName) {\n"
                            code += "\(indt(defaultIndentLevel+1))for (key, value) in item {\n"
                            code += "\(indt(defaultIndentLevel+2))\(valueShape.name.toSwiftVariableCase())Dict[key] = try \(valueShape.swiftTypeName)(dictionary: value)\n"
                            code += "\(indt(defaultIndentLevel+1))}\n"
                            code += "\(indt(defaultIndentLevel+1))\(member.variableName)List.append(\(valueShape.name.toSwiftVariableCase())Dict)\n"
                            code += "\(indt(defaultIndentLevel))}\n"
                            code += "\(indt(defaultIndentLevel))self.\(member.variableName) = \(member.variableName)List\n"
                            return code
                        }
                        
                        if member.required {
                            code += "\(indt(3))guard let \(member.variableName) = dictionary[\"\(member.name)\"] as? [[String: [String: Any]]] else { throw InitializableError.missingRequiredParam(\"\(member.name)\") }\n"
                            code += decodingCode(3)
                        } else {
                            code += "\(indt(3))if let \(member.variableName) = dictionary[\"\(member.name)\"] as? [[String: [String: Any]]] {\n"
                                code += decodingCode(4)
                            code += "\(indt(3))} else { \n"
                                code += "\(indt(4))self.\(member.variableName) = nil\n"
                            code += "\(indt(3))}\n"
                        }
                    case .map, .list:
                        fatalError("Unimplemented \(#file):\(#line)")
                        
                    default:
                        if member.required {
                            code += "\(indt(3))guard let \(member.variableName) = dictionary[\"\(member.name)\"] as? \(member.swiftTypeName) else { throw InitializableError.missingRequiredParam(\"\(member.name)\") }\n"
                            code += "\(indt(3))self.\(member.variableName) = \(member.variableName)\n"
                        } else {
                            code += "\(indt(3))self.\(member.variableName) = dictionary[\"\(member.name)\"] as? \(member.swiftTypeName)\n"
                        }
                    }
                case .list(let childShape):
                    switch childShape.type {
                    case .structure, .map, .list:
                        fatalError("Unimplemented \(#file):\(#line)")
                        
                    default:
                        if member.required {
                            code += "\(indt(3))guard let \(member.variableName) = dictionary[\"\(member.name)\"] as? \(member.swiftTypeName) else { throw InitializableError.missingRequiredParam(\"\(member.name)\") }\n"
                            code += "\(indt(3))self.\(member.variableName) = \(member.variableName)\n"
                        } else {
                            code += "\(indt(3))self.\(member.variableName) = dictionary[\"\(member.name)\"] as? \(member.swiftTypeName)\n"
                        }
                    }
                default:
                    if member.required {
                        code += "\(indt(3))guard let \(member.variableName) = dictionary[\"\(member.name)\"] as? \(member.swiftTypeName) else { throw InitializableError.missingRequiredParam(\"\(member.name)\") }\n"
                        code += "\(indt(3))self.\(member.variableName) = \(member.variableName)\n"
                    } else {
                        code += "\(indt(3))self.\(member.variableName) = dictionary[\"\(member.name)\"] as? \(member.swiftTypeName)\n"
                    }
                }
                
            default:
                if member.required {
                    code += "\(indt(3))\(member.guardStatement())\n"
                    code += "\(indt(3))self.\(member.variableName) = \(member.variableName)\n"
                } else {
                    code += "\(indt(3))self.\(member.variableName) = dictionary[\"\(member.name)\"] as? \(member.swiftTypeName)\n"
                }
            }
        }
        
        code += "\(indt(2))}"
        
        return code
    }
    
    func generateShapesCode() -> String {
        var code = ""
        code += autoGeneratedHeader
        code += "import Foundation\n"
        code += "import Core\n\n"
        code += "extension \(serviceName) {\n\n"
        
        for shape in shapes {
            if errorShapeNames.contains(shape.name) { continue }
            switch shape.type {
            case .structure(let type):
                code += "\(indt(1))public struct \(shape.name): AWSShape {\n"
                code += "\(indt(2))/// The key for the payload\n"
                if let payload = type.payload {
                    code += "\(indt(2))public static let payload: String? = \"\(payload)\"\n"
                } else {
                    code += "\(indt(2))public static let payload: String? = nil\n"
                }
                
                let requestParam = type.members.toRequestParam()
                if !requestParam.headerParams.isEmpty {
                    code += "\(indt(2))public static var headerParams: [String: String] {\n"
                    code += "\(indt(3))return \(requestParam.headerParams)\n"
                    code += "\(indt(2))}\n"
                }
                
                if !requestParam.queryParams.isEmpty {
                    code += "\(indt(2))public static var queryParams: [String: String] {\n"
                    code += "\(indt(3))return \(requestParam.queryParams)\n"
                    code += "\(indt(2))}\n"
                }
                
                if !requestParam.pathParams.isEmpty {
                    code += "\(indt(2))public static var pathParams: [String: String] {\n"
                    code += "\(indt(3))return \(requestParam.pathParams)\n"
                    code += "\(indt(2))}\n"
                }
                
                for member in type.members {
                    if let comment = shapeDoc[shape.name]?[member.name], !comment.isEmpty {
                        code += "\(indt(2))/// \(comment)\n"
                    }
                    code += "\(indt(2))public \(member.toSwiftImmutableMemberSyntax())\n"
                }
                code += "\n"
                if type.members.count > 0 {
                    code += "\(indt(2))public init(\(type.members.toSwiftArgumentSyntax())) {\n"
                    for member in type.members {
                        code += "\(indt(3))self.\(member.name.toSwiftVariableCase()) = \(member.name.toSwiftVariableCase())\n"
                    }
                    code += "\(indt(2))}\n\n"
                }
                
                code += generateInitialzerFromDictionary(type)
                
                code += "\n"
                
                code += "\(indt(1))}"
                
                code += "\n\n"
                
            default:
                continue
            }
        }
        
        code += "}"
        
        return code
    }
}


extension Collection where Iterator.Element == Member {
    public func toSwiftArgumentSyntax() -> String {
        return self.map({ $0.toSwiftArgumentSyntax() }).joined(separator: ", ")
    }
}


extension ShapeType {
    public func toSwiftType() -> String {
        switch self {
        case .string(_):
            return "String"
            
        case .integer(_):
            return "Int32"
            
        case .structure(_):
            return "Any" // TODO shouldn't be matched here
            
        case .boolean:
            return "Bool"
            
        case .list(let shape):
            return "[\(shape.swiftTypeName)]"
            
        case .map(key: let keyShape, value: let valueShape):
            return "[\(keyShape.swiftTypeName): \(valueShape.swiftTypeName)]"
            
        case .long(_):
            return "Int64"
            
        case .double(_):
            return "Double"
            
        case .float(_):
            return "Float"
            
        case .blob:
            return "Data"
            
        case .timestamp:
            return "Date"
            
        case .unhandledType:
            return "Any"
        }
    }
}

extension Shape {
    public var swiftTypeName: String {
        if isStruct {
            return name.toSwiftClassCase()
        }
        
        return type.toSwiftType()
    }
}

extension Member {
    public var swiftTypeName: String {
        return shape.swiftTypeName
    }
}
