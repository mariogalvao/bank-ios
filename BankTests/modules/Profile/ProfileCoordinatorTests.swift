//
//  ProfileCoordinatorTests.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import XCTest
@testable import Bank

class ProfileCoordinatorTests: XCTestCase {
    
    var coordinator: ProfileCoordinator!
    var navigationController: NavigationControllerMock!

    override func setUpWithError() throws {
        super.setUp()
        // Code
        navigationController = NavigationControllerMock()
        coordinator = ProfileCoordinator(navigationController: navigationController)
    }

    override func tearDownWithError() throws {
        // Code
        super.tearDown()
    }

    func test_firstViewController() throws {
        let navigationController = coordinator.firstViewController() as NavigationController
        let viewController = navigationController.viewControllers[0] as? ProfileHomeViewController
        XCTAssertNotNil(viewController)
        XCTAssertEqual(viewController?.tabBarItem.title, "Perfil")
        XCTAssertNotNil(viewController?.tabBarItem.image)
    }
    
    // ProfileCoordinatorProtocol
    
    func test_support() throws {
        coordinator.support()
        XCTAssertEqual(navigationController.count_pushViewController, 1)
        XCTAssertTrue(navigationController.viewControllers.last is ComingSoonViewController)
    }
    
    func test_logout() throws {
        coordinator.logout()
        XCTAssertEqual(navigationController.count_pushViewController, 1)
        XCTAssertTrue(navigationController.viewControllers.last is ComingSoonViewController)
    }

}
