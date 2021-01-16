//
//  InvestHomeViewModelProtocolMock.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import UIKit
@testable import Bank

class InvestHomeViewModelProtocolMock: InvestHomeViewModelProtocol {
    
    var count_getMyInvest = 0
    var count_getInvest = 0
    var count_selectItem = 0
    
    func getMyInvest() {
        count_getMyInvest += 1
    }
    
    func getInvest() {
        count_getInvest += 1
    }
    
    func selectItem(for menu: Menu) {
        count_selectItem += 1
    }
}
