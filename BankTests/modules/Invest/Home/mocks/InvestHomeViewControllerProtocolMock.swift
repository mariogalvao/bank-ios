//
//  InvestHomeViewControllerProtocolMock.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import UIKit
@testable import Bank

class InvestHomeViewControllerProtocolMock: InvestHomeViewControllerProtocol {
    
    var count_setBalance = 0
    var count_updateMenus = 0
    
    func setBalance(_ balance: String) {
        count_setBalance += 1
    }
    
    func updateMenus(_ menus: [MenuSection]) {
        count_updateMenus += 1
    }
}
