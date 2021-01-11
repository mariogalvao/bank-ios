//
//  ViewModel.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit

class ViewModel {
    
    var accountAPI: APIAccount
    var cardsAPI: APICards
    var investAPI: APIInvestments
    
    init(accountAPI: APIAccount = APIAccount(),
         cardsAPI: APICards = APICards(),
         investAPI: APIInvestments = APIInvestments()) {
        self.accountAPI = accountAPI
        self.cardsAPI = cardsAPI
        self.investAPI = investAPI
    }
    
}

protocol ViewModelProtocol {}
