//
//  CardMock.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import UIKit
import OpenAPIClient

class CardMock {
    
    var mock: Card
    
    init() {
        mock = Card(id: 1234,
                    name: "Visa Platinum",
                    spentString: "R$ 3.000,00",
                    spentValue: 3000,
                    availableString: "R$ 1.000,00",
                    availableValue: 1000)
    }

}
