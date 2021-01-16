//
//  AccountCoordinatorTests.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import XCTest
@testable import Bank

class AccountCoordinatorTests: XCTestCase {
    
    var coordinator: AccountCoordinator!
    var navigationController: NavigationControllerMock!

    override func setUpWithError() throws {
        super.setUp()
        // Code
        navigationController = NavigationControllerMock()
        coordinator = AccountCoordinator(navigationController: navigationController)
    }

    override func tearDownWithError() throws {
        // Code
        super.tearDown()
    }

    func test_firstViewController() throws {
        let navigationController = coordinator.firstViewController() as NavigationController
        let viewController = navigationController.viewControllers[0] as? AccountHomeViewController
        XCTAssertNotNil(viewController)
        XCTAssertEqual(viewController?.tabBarItem.title, "Conta")
        XCTAssertNotNil(viewController?.tabBarItem.image)
    }
    
    // AccountCoordinatorProtocol
    
    func test_itemSelected() {
        coordinator.itemSelected(for: MenuMock())
        XCTAssertEqual(navigationController.count_pushViewController, 1)
        XCTAssertTrue(navigationController.viewControllers.last is ComingSoonViewController)
    }

}
