//
//  TabBarControllerTests.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import XCTest
@testable import Bank

class TabBarControllerTests: XCTestCase {
    
    var tabBarController: TabBarController!
    
    override func setUpWithError() throws {
        super.setUp()
        // Code
        tabBarController = TabBarController()
    }
    
    override func tearDownWithError() throws {
        // Code
        super.tearDown()
    }
    
    func test_viewDidLoad() throws {
        tabBarController.viewDidLoad()
        XCTAssertEqual(tabBarController.viewControllers?.count, 4)
        tabBarController.viewControllers?.forEach({ (viewController) in
            XCTAssertTrue(viewController is NavigationController)
        })
    }

}
