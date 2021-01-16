//
//  InvestCoordinatorTests.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import XCTest
@testable import Bank

class InvestCoordinatorTests: XCTestCase {
    
    var coordinator: InvestCoordinator!
    var navigationController: NavigationControllerMock!

    override func setUpWithError() throws {
        super.setUp()
        // Code
        navigationController = NavigationControllerMock()
        coordinator = InvestCoordinator(navigationController: navigationController)
    }

    override func tearDownWithError() throws {
        // Code
        super.tearDown()
    }

    func test_firstViewController() throws {
        let navigationController = coordinator.firstViewController() as NavigationController
        let viewController = navigationController.viewControllers[0] as? InvestHomeViewController
        XCTAssertNotNil(viewController)
        XCTAssertEqual(viewController?.tabBarItem.title, "Investimentos")
        XCTAssertNotNil(viewController?.tabBarItem.image)
    }
    
    // InvestCoordinatorProtocol
    
    func test_itemSelected() {
        coordinator.itemSelected(for: MenuMock())
        XCTAssertEqual(navigationController.count_pushViewController, 1)
        XCTAssertTrue(navigationController.viewControllers.last is ComingSoonViewController)
    }

}
