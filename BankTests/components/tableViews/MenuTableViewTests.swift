//
//  MenuTableViewTests.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import XCTest
@testable import Bank

class MenuTableViewTests: XCTestCase {
    
    var tableView: MenuTableView!
    var menuDelegate: MenuTableViewProtocolMock!

    override func setUpWithError() throws {
        super.setUp()
        // Code
        menuDelegate = MenuTableViewProtocolMock()
        tableView = MenuTableView()
        tableView.menuDelegate = menuDelegate
        let menu = [MenuSectionMock(), MenuSectionMock()]
        tableView.setMenuSectionList(menu)
    }

    override func tearDownWithError() throws {
        // Code
        super.tearDown()
    }

    func test_setMenuSectionList() throws {
        XCTAssertEqual(tableView.menuSectionList.count, 2)
    }
    
    // UITableViewDelegate
    
    func test_heightForRowAt() throws {
        XCTAssertEqual(tableView.tableView(tableView, heightForRowAt: IndexPath()), UITableView.automaticDimension)
    }
    
    func test_didSelectRowAt() throws {
        tableView.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(menuDelegate.count_didSelect, 1)
    }
    
    // UITableViewDataSource
    
    func test_numberOfSections() throws {
        XCTAssertEqual(tableView.numberOfSections(in: tableView), 2)
    }
    
    func test_numberOfRowsInSection() throws {
        XCTAssertEqual(tableView.tableView(tableView, numberOfRowsInSection: 0), 3)
    }
    
    func test_titleForHeaderInSection() throws {
        XCTAssertEqual(tableView.tableView(tableView, titleForHeaderInSection: 0), "Título")
    }
    
    func test_cellForRowAt() throws {
        let cell = tableView.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? ItemTableViewCell
        XCTAssertEqual(cell?.titleLabel.text, "Pagamento")
        XCTAssertEqual(cell?.detailsLabel.text, "Pague seu boleto.")
    }

}
