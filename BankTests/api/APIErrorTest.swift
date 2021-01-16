//
//  APIErrorTest.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import XCTest
import OpenAPIClient
@testable import Bank

class APIErrorTest: XCTestCase {
    
    var error: APIError!

    override func setUpWithError() throws {
        super.setUp()
        // Code
        error = APIError(.errorResponse(ModelErrorResponseMock().mock))
    }

    override func tearDownWithError() throws {
        // Code
        super.tearDown()
    }

    func test_init() throws {
        XCTAssertEqual(error.code, 999)
        XCTAssertEqual(error.title, "Erro")
        XCTAssertEqual(error.message, "Mensagem")
    }

}
