//
//  APITests.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import XCTest
@testable import Bank

class APITests: XCTestCase {
    
    var api: API!

    override func setUpWithError() throws {
        super.setUp()
        // Code
        api = API()
    }

    override func tearDownWithError() throws {
        // Code
        super.tearDown()
    }

    func test_handleResponse_success() throws {
        let response: String? = "Sucesso"
        api.handleResponse(response: response, error: nil) { (result) in
            switch result {
            case .success(let text):
                XCTAssertEqual(text, "Sucesso")
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
    }
    
    func test_handleResponse_error() throws {
        let response: String? = nil
        api.handleResponse(response: response, error: APIErrorMock()) { (result) in
            switch result {
            case .success(_):
                XCTFail("Return should be error")
            case .failure(let error):
                XCTAssertEqual(error.code, 999)
                XCTAssertEqual(error.title, "Erro")
                XCTAssertEqual(error.message, "Erro desconhecido.")
            }
        }
    }
    
    func test_handleError() throws {
        let error = api.handleError(APIErrorMock())
        XCTAssertEqual(error.code, 999)
        XCTAssertEqual(error.title, "Erro")
        XCTAssertEqual(error.message, "Erro desconhecido.")
    }

}
