//
//  BalanceMock.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import UIKit
import OpenAPIClient

class BalanceMock {
    
    var mock: Balance
    
    init() {
        mock = Balance(balanceString: "R$ 1.000,00",
                       balanceValue: 1000)
    }

}
