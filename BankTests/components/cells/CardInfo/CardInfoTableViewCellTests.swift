//
//  CardInfoTableViewCellTests.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import XCTest
@testable import Bank

class CardInfoTableViewCellTests: XCTestCase {
    
    var cell: CardInfoTableViewCell!

    override func setUpWithError() throws {
        super.setUp()
        // Code
        let tableView = UITableView()
        tableView.register(UINib(nibName: "CardInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "CardInfoTableViewCell")
        cell = tableView.dequeueReusableCell(withIdentifier: "CardInfoTableViewCell") as? CardInfoTableViewCell
    }

    override func tearDownWithError() throws {
        // Code
        super.tearDown()
    }

    func test_setLimits() throws {
        cell.setLimits(spentValue: 2000, availableValue: 2000)
        XCTAssertEqual(cell.progressView.progress, 0.5)
    }

}
