//
//  ViewModel.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit

class ViewModel {
    
    var accountAPI: APIAccountProtocol
    var cardsAPI: APICardsProtocol
    var investAPI: APIInvestmentsProtocol
    
    init(accountAPI: APIAccountProtocol = APIAccount(),
         cardsAPI: APICardsProtocol = APICards(),
         investAPI: APIInvestmentsProtocol = APIInvestments()) {
        self.accountAPI = accountAPI
        self.cardsAPI = cardsAPI
        self.investAPI = investAPI
    }
    
}

protocol ViewModelProtocol {}
