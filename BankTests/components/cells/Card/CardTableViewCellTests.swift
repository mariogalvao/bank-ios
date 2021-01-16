//
//  CardCollectionViewCellTests.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import XCTest
@testable import Bank

class CardCollectionViewCellTests: XCTestCase {
    
    var cell: CardCollectionViewCell!

    override func setUpWithError() throws {
        super.setUp()
        // Code
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.register(UINib(nibName: "CardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CardCollectionViewCell")
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: IndexPath()) as? CardCollectionViewCell
    }

    override func tearDownWithError() throws {
        // Code
        super.tearDown()
    }

    func test_setImage() throws {
        cell.setImage(UIImage(systemName: "banknote")!)
        XCTAssertNotNil(cell.cardImage.image)
    }

}
