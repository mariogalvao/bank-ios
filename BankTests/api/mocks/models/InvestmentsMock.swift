//
//  InvestmentsMock.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import UIKit
import OpenAPIClient

class InvestmentsMock {
    
    var mock: [Investment]
    
    init() {
        let invest1 = Investment(id: 123,
                                 name: "Poupança",
                                 description: "O mais seguro dos investimentos.",
                                 iOSImage: "centsign.circle")
        
        let invest2 = Investment(id: 987,
                                 name: "Renda Fixa",
                                 description: "Tesouro direto.",
                                 iOSImage: "banknote")
        mock = [invest1, invest2]
    }

}
