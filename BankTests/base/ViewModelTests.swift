//
//  ViewModelTests.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import XCTest
@testable import Bank

class ViewModelTests: XCTestCase {
    
    var viewModel: ViewModel!

    override func setUpWithError() throws {
        super.setUp()
        // Code
        viewModel = ViewModel(accountAPI: APIAccountMock(),
                              cardsAPI: APICardsMock(),
                              investAPI: APIInvestmentsMock())
    }

    override func tearDownWithError() throws {
        // Code
        super.tearDown()
    }

    func test_init() throws {
        XCTAssertNotNil(viewModel.accountAPI)
        XCTAssertNotNil(viewModel.cardsAPI)
        XCTAssertNotNil(viewModel.investAPI)
    }

}
