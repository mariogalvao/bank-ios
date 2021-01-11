//
//  APIError.swift
//  Bank
//
//  Created by Mário Galvao on 10/01/21.
//

import UIKit
import OpenAPIClient

enum APIErrorType: Error {
    case errorResponse(_ errorResponse: ModelErrorResponse)
    case unknown
}

class APIError: Error {
    
    var type: APIErrorType
    var code: Int
    var title: String
    var message: String
    
    init(_ type: APIErrorType) {
        self.type = type
        switch type {
        case .errorResponse(let errorResponse):
            self.code = errorResponse.code
            self.title = errorResponse.title
            self.message = errorResponse.message
        case .unknown:
            self.code = 999
            self.title = "Erro"
            self.message = "Erro desconhecido."
        }
    }
    
}
