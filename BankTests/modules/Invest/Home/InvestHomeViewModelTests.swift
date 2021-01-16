//
//  InvestHomeViewModelTests.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import XCTest
@testable import Bank

class InvestHomeViewModelTests: XCTestCase {
    
    var viewModel: InvestHomeViewModel!
    var viewControllerDelegate: InvestHomeViewControllerProtocolMock!
    var coordinatorDelegate: InvestCoordinatorProtocolMock!
    var api: APIInvestmentsMock!

    override func setUpWithError() throws {
        super.setUp()
        
        viewControllerDelegate = InvestHomeViewControllerProtocolMock()
        coordinatorDelegate = InvestCoordinatorProtocolMock()
        viewModel = InvestHomeViewModel(viewControllerDelegate: viewControllerDelegate, coordinatorDelegate: coordinatorDelegate)
        api = APIInvestmentsMock()
        viewModel.investAPI = api
    }

    override func tearDownWithError() throws {
        // Code
        api.success = true
        super.tearDown()
    }

    func test_getMyInvest() throws {
        viewModel.getMyInvest()
        XCTAssertEqual(api.count_getMyInvestments, 1)
        XCTAssertEqual(viewControllerDelegate.count_updateMenus, 1)
    }
    
    func test_getMyInvest_error() throws {
        api.success = false
        viewModel.getMyInvest()
        XCTAssertEqual(api.count_getMyInvestments, 1)
        XCTAssertEqual(viewControllerDelegate.count_updateMenus, 0)
    }
    
    func test_getInvest() throws {
        viewModel.getInvest()
        XCTAssertEqual(api.count_getInvestments, 1)
        XCTAssertEqual(viewControllerDelegate.count_updateMenus, 1)
    }
    
    func test_getInvest_error() throws {
        api.success = false
        viewModel.getInvest()
        XCTAssertEqual(api.count_getInvestments, 1)
        XCTAssertEqual(viewControllerDelegate.count_updateMenus, 0)
    }
    
    func test_selectItem() throws {
        viewModel.selectItem(for: MenuMock())
        XCTAssertEqual(coordinatorDelegate.count_itemSelected, 1)
    }

}
