//
//  AccountHomeViewControllerTests.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import XCTest
@testable import Bank

class AccountHomeViewControllerTests: XCTestCase {
    
    var viewController: AccountHomeViewController!
    var viewModelDelegate: AccountHomeViewModelProtocolMock!

    override func setUpWithError() throws {
        super.setUp()
        // Code
        viewController = AccountHomeViewController()
        viewModelDelegate = AccountHomeViewModelProtocolMock()
        viewController.viewModelDelegate = viewModelDelegate
        viewController.view.awakeFromNib()
    }

    override func tearDownWithError() throws {
        // Code
        super.tearDown()
    }

    func test_viewDidLoad() throws {
        viewController.viewDidLoad()
        XCTAssertEqual(viewController.title, "Conta")
        XCTAssertNotNil(viewController.navigationItem.searchController)
    }
    
    func test_viewWillAppear() throws {
        viewController.viewWillAppear(true)
        XCTAssertEqual(viewModelDelegate.count_getBalance, 1)
        XCTAssertEqual(viewModelDelegate.count_getMenuSectionList, 1)
    }
    
    // MenuTableViewProtocol
    
    func test_updateSearchResults() throws {
        viewController.updateSearchResults(for: viewController.searchController)
        XCTAssertEqual(viewModelDelegate.count_filterMenus, 1)
    }
    
    // AccountHomeViewControllerProtocol
    
    func test_setBalance() {
        viewController.setBalance("R$ 1.000,00")
        XCTAssertEqual(viewController.balance, "R$ 1.000,00")
    }
    
    func test_updateMenus() {
        let menu = [MenuSectionMock()]
        viewController.updateMenus(menu)
        XCTAssertEqual(viewController.tableView.menuSectionList.count, 1)
    }

}
