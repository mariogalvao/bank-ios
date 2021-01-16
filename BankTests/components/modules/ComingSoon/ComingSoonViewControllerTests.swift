//
//  ComingSoonViewControllerTests.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import XCTest
@testable import Bank

class ComingSoonViewControllerTests: XCTestCase {
    
    var viewController: ComingSoonViewController!
    var viewModelDelegate: ComingSoonViewModelProtocolMock!

    override func setUpWithError() throws {
        super.setUp()
        // Code
        viewController = ComingSoonViewController()
        viewModelDelegate = ComingSoonViewModelProtocolMock()
        viewController.viewModelDelegate = viewModelDelegate
        viewController.view.awakeFromNib()
    }

    override func tearDownWithError() throws {
        // Code
        super.tearDown()
    }

    func test_viewDidLoad() throws {
        XCTAssertEqual(viewModelDelegate.count_getTitle, 1)
        XCTAssertEqual(viewController.title, "Título")
    }

}
