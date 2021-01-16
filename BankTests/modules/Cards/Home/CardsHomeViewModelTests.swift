//
//  CardsHomeViewModelTests.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import XCTest
@testable import Bank

class CardsHomeViewModelTests: XCTestCase {
    
    var viewModel: CardsHomeViewModel!
    var viewControllerDelegate: CardsHomeViewControllerProtocolMock!
    var coordinatorDelegate: CardsCoordinatorProtocolMock!
    var api: APICardsMock!

    override func setUpWithError() throws {
        super.setUp()
        
        viewControllerDelegate = CardsHomeViewControllerProtocolMock()
        coordinatorDelegate = CardsCoordinatorProtocolMock()
        viewModel = CardsHomeViewModel(viewControllerDelegate: viewControllerDelegate, coordinatorDelegate: coordinatorDelegate)
        api = APICardsMock()
        viewModel.cardsAPI = api
    }

    override func tearDownWithError() throws {
        // Code
        api.success = true
        super.tearDown()
    }

    func test_getCards() throws {
        viewModel.getCards()
        XCTAssertEqual(api.count_getCards, 1)
        XCTAssertEqual(viewControllerDelegate.count_updateMenus, 1)
    }
    
    func test_getCards_error() throws {
        api.success = false
        viewModel.getCards()
        XCTAssertEqual(api.count_getCards, 1)
        XCTAssertEqual(viewControllerDelegate.count_updateMenus, 0)
    }
    
    func test_getCard() throws {
        viewModel.getCards()
        let card = viewModel.getCard(for: 0)
        XCTAssertEqual(card?.name, "Visa Platinum")
    }
    
    func test_getNumberOfCards() throws {
        viewModel.getCards()
        XCTAssertEqual(viewModel.getNumberOfCards(), 2)
    }
    
    func test_selectItem() throws {
        viewModel.selectItem(for: MenuMock())
        XCTAssertEqual(coordinatorDelegate.count_itemSelected, 1)
    }

}
