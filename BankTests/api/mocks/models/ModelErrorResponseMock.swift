//
//  ModelErrorResponseMock.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import UIKit
import OpenAPIClient

class ModelErrorResponseMock {
    
    var mock: ModelErrorResponse
    
    init() {
        mock = ModelErrorResponse(code: 999,
                                  title: "Erro",
                                  message: "Mensagem")
    }

}
