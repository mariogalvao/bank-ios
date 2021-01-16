//
//  CardsMock.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import UIKit
import OpenAPIClient

class CardsMock {
    
    var mock: [Card]
    
    init() {
        let card1 = Card(id: 1234,
                         name: "Visa Platinum",
                         spentString: "R$ 3.000,00",
                         spentValue: 3000,
                         availableString: "R$ 1.000,00",
                         availableValue: 1000)
        let card2 = Card(id: 9876,
                         name: "Master Black",
                         spentString: "R$ 5.000,00",
                         spentValue: 5000,
                         availableString: "R$ 10.000,00",
                         availableValue: 10000)
        mock = [card1, card2]
    }

}
