//
//  ProfileHomeViewModelTests.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import XCTest
@testable import Bank

class ProfileHomeViewModelTests: XCTestCase {
    
    var viewModel: ProfileHomeViewModel!
    var viewControllerDelegate: ProfileHomeViewControllerProtocolMock!
    var coordinatorDelegate: ProfileCoordinatorProtocolMock!
    var api: APIAccountMock!

    override func setUpWithError() throws {
        super.setUp()
        
        viewControllerDelegate = ProfileHomeViewControllerProtocolMock()
        coordinatorDelegate = ProfileCoordinatorProtocolMock()
        viewModel = ProfileHomeViewModel(viewControllerDelegate: viewControllerDelegate, coordinatorDelegate: coordinatorDelegate)
        api = APIAccountMock()
        viewModel.accountAPI = api
    }

    override func tearDownWithError() throws {
        // Code
        api.success = true
        super.tearDown()
    }

    func test_getMyInfo() throws {
        viewModel.getMyInfo()
        XCTAssertEqual(api.count_getMyInfo, 1)
        XCTAssertEqual(viewControllerDelegate.count_setMyInfo, 1)
    }
    
    func test_getMyInfo_error() throws {
        api.success = false
        viewModel.getMyInfo()
        XCTAssertEqual(api.count_getMyInfo, 1)
        XCTAssertEqual(viewControllerDelegate.count_setMyInfo, 0)
    }
    
    func test_needHelp() {
        viewModel.needHelp()
        XCTAssertEqual(coordinatorDelegate.count_support, 1)
    }
    
    func test_logout() {
        viewModel.logout()
        XCTAssertEqual(coordinatorDelegate.count_logout, 1)
    }

}
