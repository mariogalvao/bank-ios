//
//  CardsHomeViewControllerTests.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import XCTest
@testable import Bank

class CardsHomeViewControllerTests: XCTestCase {
    
    var viewController: CardsHomeViewController!
    var viewModelDelegate: CardsHomeViewModelProtocolMock!

    override func setUpWithError() throws {
        super.setUp()
        
        viewController = CardsHomeViewController()
        viewModelDelegate = CardsHomeViewModelProtocolMock()
        viewController.viewModelDelegate = viewModelDelegate
        viewController.view.awakeFromNib()
    }

    override func tearDownWithError() throws {
        // Code
        
        super.tearDown()
    }

    func test_viewDidLoad() throws {
        viewController.viewDidLoad()
        XCTAssertEqual(viewController.title, "Cartões")
        checkViewVisible(false)
    }
    
    private func checkViewVisible(_ visible: Bool) {
        XCTAssertEqual(viewController.collectionView.isHidden, !visible)
        XCTAssertEqual(viewController.pageControl.isHidden, !visible)
        XCTAssertEqual(viewController.tableView.isHidden, !visible)
    }
    
    func test_viewWillAppear() throws {
        viewController.viewWillAppear(true)
        XCTAssertEqual(viewModelDelegate.count_getCards, 1)
    }
    
    // UICollectionViewDataSource
    
    func test_numberOfItemsInSection() throws {
        let rows = viewController.collectionView(viewController.collectionView, numberOfItemsInSection: 0)
        XCTAssertEqual(viewModelDelegate.count_getNumberOfCards, 1)
        XCTAssertEqual(rows, 0)
    }
    
    func test_cellForItemAt() throws {
        let cell = viewController.collectionView(viewController.collectionView, cellForItemAt: IndexPath(row: 0, section: 0))
        XCTAssert(cell is CardCollectionViewCell)
    }
    
    // UICollectionViewDelegateFlowLayout
    
    func test_sizeForItemAt() throws {
        let size = viewController.collectionView(viewController.collectionView, layout: UICollectionViewLayout(), sizeForItemAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(size.height, 200)
        XCTAssertEqual(size.width, UIScreen.main.bounds.width)
    }
    
    // UIScrollViewDelegate
    
    func test_scrollViewDidEndDecelerating() throws {
        viewController.scrollViewDidEndDecelerating(viewController.collectionView)
        XCTAssertEqual(viewController.pageControl.currentPage, Int(viewController.collectionView.contentOffset.x) / Int(viewController.collectionView.frame.width))
    }
    
    // MenuTableViewProtocol
    
    func test_getCustomCellForRowAt() throws {
        let cell = viewController.getCustomCellForRowAt(viewController.tableView, indexPath: IndexPath(row: 0, section: 0)) as? CardInfoTableViewCell
        XCTAssertEqual(cell?.cardLabel.text, "Visa Platinum")
        XCTAssertEqual(cell?.spentLabel.text, "R$ 3.000,00")
        XCTAssertEqual(cell?.availableLabel.text, "R$ 1.000,00")
        XCTAssertEqual(cell?.progressView.progress, 0.75)
    }
    
    func test_didSelect() throws {
        viewController.didSelect(menu: MenuMock())
        XCTAssertEqual(viewModelDelegate.count_selectItem, 1)
    }
    
    // CardsHomeViewControllerProtocol
    
    func test_updateMenus() {
        viewController.updateMenus([MenuSectionMock()])
        checkViewVisible(true)
        XCTAssertEqual(viewController.tableView.menuSectionList.count, 1)
    }

}
