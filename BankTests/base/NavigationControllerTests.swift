//
//  NavigationControllerTests.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import XCTest
@testable import Bank

class NavigationControllerTests: XCTestCase {
    
    var navigationController: NavigationController!

    override func setUpWithError() throws {
        super.setUp()
        // Code
        navigationController = NavigationController()
    }

    override func tearDownWithError() throws {
        // Code
        super.tearDown()
    }

    func test_viewDidLoad() throws {
        navigationController.viewDidLoad()
        XCTAssertTrue(navigationController.navigationBar.prefersLargeTitles)
    }

}
