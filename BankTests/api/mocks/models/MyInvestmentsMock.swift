//
//  MyInvestmentsMock.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import UIKit
import OpenAPIClient

class MyInvestmentsMock {
    
    var mock: MyInvestments
    
    init() {
        let invest1 = MyInvestment(id: 123,
                                   name: "Poupança",
                                   balanceString: "R$ 100.000,00",
                                   balanceValue: 100000,
                                   iOSImage: "centsign.circle")
        let invest2 = MyInvestment(id: 987,
                                   name: "Renda Fixa",
                                   balanceString: "R$ 30.000,00",
                                   balanceValue: 30000,
                                   iOSImage: "banknote")
        let investments = [invest1, invest2]
        mock = MyInvestments(balance: "R$ 2.000,00", investments: investments)
    }

}
