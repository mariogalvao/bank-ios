//
//  CardsHomeViewControllerProtocolMock.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import UIKit
@testable import Bank

class CardsHomeViewControllerProtocolMock: CardsHomeViewControllerProtocol {
    
    var count_updateMenus = 0
    
    func updateMenus(_ menus: [MenuSection]) {
        count_updateMenus += 1
    }
}
