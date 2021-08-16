//
//  AnyValue.swift
//  GitHub
//
//  Created by Ana Kresic on 09/08/2021.
//

import Foundation

public enum AnyValue: Codable {
    
    //    public func encode(to encoder: Encoder) throws {}
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .double(let value):
            try container.encode(value)
        case .string(let value):
            try container.encode(value)
        case .int(let value):
            try container.encode(value)
        case .bool(let value):
            try container.encode(value)
        case .object(let value):
            try container.encode(value)
        case .array(let value):
            try container.encode(value)
        }
    }
    
    case string(String)
    case int(Int)
    case double(Double)
    case bool(Bool)
    case object([String: AnyValue])
    case array([AnyValue])
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode(Int.self) {
            self = .int(value)
        } else if let value = try? container.decode(Double.self) {
            self = .double(value)
        } else if let value = try? container.decode(Bool.self) {
            self = .bool(value)
        } else if let value = try? container.decode([String: AnyValue].self) {
            self = .object(value)
        } else if let value = try? container.decode([AnyValue].self) {
            self = .array(value)
        } else {
            throw DecodingError.typeMismatch(AnyValue.self, DecodingError.Context(codingPath: container.codingPath, debugDescription: "Not a JSON"))
        }
    }
}

extension AnyValue {
    var Value:String {
        switch self {
        case .int(let intvalue):
            return String(intvalue)
        case .string(let stringValue):
            return stringValue
        case .double(let doubleValue):
            return String(doubleValue)
        case .bool(let boolValue):
            return String(boolValue)
        case .object(let objectValue):
            return String(objectValue.description)
        case .array(let arrayValue):
            guard !arrayValue.isEmpty else { return String() }
            return arrayValue[0].Value
        }
    }
}

extension Decodable {
    init(from any: [String: Any]) throws {
        let data = try JSONSerialization.data(withJSONObject: any)
        self = try JSONDecoder().decode(Self.self, from: data)
    }
}

