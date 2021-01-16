//
//  ItemTableViewCellTests.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import XCTest
@testable import Bank

class ItemTableViewCellTests: XCTestCase {
    
    var cell: ItemTableViewCell!

    override func setUpWithError() throws {
        super.setUp()
        // Code
        let tableView = UITableView()
        tableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemTableViewCell")
        cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell") as? ItemTableViewCell
    }

    override func tearDownWithError() throws {
        // Code
        super.tearDown()
    }

    func test_setUp() throws {
        cell.setUp(icon: UIImage(systemName: "banknote"), title: "Título", details: "Detalhes")
        XCTAssertNotNil(cell.icon?.image)
        XCTAssertFalse(cell.icon.isHidden)
        XCTAssertEqual(cell.titleLabel.text, "Título")
        XCTAssertEqual(cell.detailsLabel.text, "Detalhes")
    }
    
    func test_setUp_noImage() throws {
        cell.setUp(icon: nil, title: "Título", details: "Detalhes")
        XCTAssertNil(cell.icon?.image)
        XCTAssertTrue(cell.icon.isHidden)
        XCTAssertEqual(cell.titleLabel.text, "Título")
        XCTAssertEqual(cell.detailsLabel.text, "Detalhes")
    }

}
