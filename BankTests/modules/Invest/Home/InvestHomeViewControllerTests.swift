//
//  InvestHomeViewControllerTests.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import XCTest
@testable import Bank

class InvestHomeViewControllerTests: XCTestCase {
    
    var viewController: InvestHomeViewController!
    var viewModelDelegate: InvestHomeViewModelProtocolMock!

    override func setUpWithError() throws {
        super.setUp()
        
        viewController = InvestHomeViewController()
        viewModelDelegate = InvestHomeViewModelProtocolMock()
        viewController.viewModelDelegate = viewModelDelegate
        viewController.view.awakeFromNib()
    }

    override func tearDownWithError() throws {
        // Code
        
        super.tearDown()
    }

    func test_viewDidLoad() throws {
        viewController.viewDidLoad()
        XCTAssertEqual(viewController.title, "Investimentos")
    }
    
    func test_viewWillAppear() throws {
        viewController.viewWillAppear(true)
        XCTAssertEqual(viewModelDelegate.count_getMyInvest, 1)
    }
    
    func test_segmentedControlValueChanged_0() {
        viewController.segmentedControl.selectedSegmentIndex = 0
        viewController.segmentedControlValueChanged(viewController.segmentedControl)
        XCTAssertEqual(viewModelDelegate.count_getMyInvest, 1)
    }
    
    func test_segmentedControlValueChanged_1() {
        viewController.segmentedControl.selectedSegmentIndex = 1
        viewController.segmentedControlValueChanged(viewController.segmentedControl)
        XCTAssertEqual(viewModelDelegate.count_getInvest, 1)
    }
    
    // MenuTableViewProtocol
    
    func test_getCustomCellForRowAt() throws {
        viewController.setBalance("RS 1.000,00")
        let cell = viewController.getCustomCellForRowAt(viewController.tableView, indexPath: IndexPath(row: 0, section: 0)) as? BalanceTableViewCell
        XCTAssertEqual(cell?.balanceLabel.text, "RS 1.000,00")
    }
    
    func test_didSelect() throws {
        viewController.didSelect(menu: MenuMock())
        XCTAssertEqual(viewModelDelegate.count_selectItem, 1)
    }
    
    // ViewControllerProtocol
    
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
