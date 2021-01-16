//
//  BalanceTableViewCellTests.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import XCTest
@testable import Bank

class BalanceTableViewCellTests: XCTestCase {
    
    var cell: BalanceTableViewCell!

    override func setUpWithError() throws {
        super.setUp()
        // Code
        let tableView = UITableView()
        tableView.register(UINib(nibName: "BalanceTableViewCell", bundle: nil), forCellReuseIdentifier: "BalanceTableViewCell")
        cell = tableView.dequeueReusableCell(withIdentifier: "BalanceTableViewCell") as? BalanceTableViewCell
    }

    override func tearDownWithError() throws {
        // Code
        super.tearDown()
    }

    func test_setUp() throws {
        cell.setUp(balance: "R$ 1.000,00", visible: true)
        XCTAssertFalse(cell.balanceLabel.isHidden)
        XCTAssertEqual(cell.balanceLabel.text, "R$ 1.000,00")
    }
    
    func test_setUp_empty() throws {
        cell.setUp(balance: "", visible: false)
        XCTAssertTrue(cell.balanceLabel.isHidden)
        XCTAssertEqual(cell.balanceLabel.text, "---")
    }
    
    func test_setUp_visible_false() throws {
        cell.setUp(balance: "R$ 1.000,00", visible: false)
        XCTAssertFalse(cell.balanceLabel.isHidden)
        XCTAssertEqual(cell.balanceLabel.text, "---")
    }
    
    func test_setVisible() throws {
        cell.setVisible(cell.visibleButton)
        XCTAssertTrue(cell.balanceLabel.isHidden)
        XCTAssertEqual(cell.balanceLabel.text, "")
    }

}
