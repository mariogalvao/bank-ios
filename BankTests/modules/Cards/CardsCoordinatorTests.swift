//
//  CardsCoordinatorTests.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import XCTest
@testable import Bank

class CardsCoordinatorTests: XCTestCase {
    
    var coordinator: CardsCoordinator!
    var navigationController: NavigationControllerMock!

    override func setUpWithError() throws {
        super.setUp()
        // Code
        navigationController = NavigationControllerMock()
        coordinator = CardsCoordinator(navigationController: navigationController)
    }

    override func tearDownWithError() throws {
        // Code
        super.tearDown()
    }

    func test_firstViewController() throws {
        let navigationController = coordinator.firstViewController() as NavigationController
        let viewController = navigationController.viewControllers[0] as? CardsHomeViewController
        XCTAssertNotNil(viewController)
        XCTAssertEqual(viewController?.tabBarItem.title, "Cartões")
        XCTAssertNotNil(viewController?.tabBarItem.image)
    }
    
    // CardsCoordinatorProtocol
    
    func test_itemSelected() {
        coordinator.itemSelected(for: MenuMock())
        XCTAssertEqual(navigationController.count_pushViewController, 1)
        XCTAssertTrue(navigationController.viewControllers.last is ComingSoonViewController)
    }

}
