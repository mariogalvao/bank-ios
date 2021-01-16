//
//  ComingSoonViewModelTests.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import XCTest
@testable import Bank

class ComingSoonViewModelTests: XCTestCase {
    
    var viewModel: ComingSoonViewModel!
    var viewControllerDelegate: ComingSoonViewControllerProtocolMock!
    var title: String!

    override func setUpWithError() throws {
        super.setUp()
        // Code
        viewControllerDelegate = ComingSoonViewControllerProtocolMock()
        title = "Título"
        viewModel = ComingSoonViewModel(viewControllerDelegate: viewControllerDelegate, title: title)
    }

    override func tearDownWithError() throws {
        // Code
        
        super.tearDown()
    }

    func test_getTitle() throws {
        XCTAssertEqual(viewModel.getTitle(), "Título")
    }

}
