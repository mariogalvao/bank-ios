//
// ModelErrorResponse.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct ModelErrorResponse: Codable {

    public var code: Int
    public var title: String
    public var message: String

    public init(code: Int, title: String, message: String) {
        self.code = code
        self.title = title
        self.message = message
    }

}

