//
//  AccountHomeViewModelTests.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import XCTest
@testable import Bank

class AccountHomeViewModelTests: XCTestCase {
    
    var viewModel: AccountHomeViewModel!
    var viewControllerDelegate: AccountHomeViewControllerProtocolMock!
    var coordinatorDelegate: AccountCoordinatorProtocolMock!
    var api: APIAccountMock!

    override func setUpWithError() throws {
        super.setUp()
        // Code
        viewControllerDelegate = AccountHomeViewControllerProtocolMock()
        coordinatorDelegate = AccountCoordinatorProtocolMock()
        viewModel = AccountHomeViewModel(viewControllerDelegate: viewControllerDelegate, coordinatorDelegate: coordinatorDelegate)
        api = APIAccountMock()
        viewModel.accountAPI = api
    }

    override func tearDownWithError() throws {
        // Code
        api.success = true
        super.tearDown()
    }

    func test_getBalance() throws {
        viewModel.getBalance()
        XCTAssertEqual(api.count_getBalance, 1)
        XCTAssertEqual(viewControllerDelegate.count_setBalance, 1)
        XCTAssertEqual(viewControllerDelegate.count_updateMenus, 1)
    }
    
    func test_getBalance_error() throws {
        api.success = false
        viewModel.getBalance()
        XCTAssertEqual(api.count_getBalance, 1)
        XCTAssertEqual(viewControllerDelegate.count_setBalance, 0)
        XCTAssertEqual(viewControllerDelegate.count_updateMenus, 0)
    }
    
    func test_getMenuSectionList() throws {
        viewModel.getMenuSectionList()
        XCTAssertEqual(viewControllerDelegate.count_updateMenus, 1)
    }
    
    func test_filterMenus() throws {
        viewModel.filterMenus(by: "Pag")
        XCTAssertEqual(viewControllerDelegate.count_updateMenus, 2)
    }
    
    func test_selectItem() {
        viewModel.selectItem(for: MenuMock())
        XCTAssertEqual(coordinatorDelegate.count_itemSelected, 1)
    }

}
