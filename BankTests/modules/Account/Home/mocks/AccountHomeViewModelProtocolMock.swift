//
//  AccountHomeViewModelProtocolMock.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import UIKit
@testable import Bank

class AccountHomeViewModelProtocolMock: AccountHomeViewModelProtocol {
    
    var count_getBalance = 0
    var count_getMenuSectionList = 0
    var count_filterMenus = 0
    var count_selectItem = 0
    
    func getBalance() {
        count_getBalance += 1
    }
    
    func getMenuSectionList() {
        count_getMenuSectionList += 1
    }
    
    func filterMenus(by text: String) {
        count_filterMenus += 1
    }
    
    func selectItem(for menu: Menu) {
        count_selectItem += 1
    }
}
