//
//  CardsHomeViewModelProtocolMock.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import UIKit
import OpenAPIClient
@testable import Bank

class CardsHomeViewModelProtocolMock: CardsHomeViewModelProtocol {
    
    var count_getCards = 0
    var count_getCard = 0
    var count_getNumberOfCards = 0
    var count_selectItem = 0
    
    func getCards() {
        count_getCards += 1
    }
    
    func getCard(for row: Int) -> Card? {
        count_getCard += 1
        return CardMock().mock
    }
    
    func getNumberOfCards() -> Int {
        count_getNumberOfCards += 1
        return 0
    }
    
    func selectItem(for menu: Menu) {
        count_selectItem += 1
    }
}
