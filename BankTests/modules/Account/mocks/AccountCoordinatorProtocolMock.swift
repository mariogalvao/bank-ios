//
//  AccountCoordinatorProtocolMock.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import UIKit
@testable import Bank

class AccountCoordinatorProtocolMock: AccountCoordinatorProtocol {
    
    var count_itemSelected = 0
    var count_comingSoon = 0
    
    func itemSelected(for transaction: Menu) {
        count_itemSelected += 1
    }
    
    func comingSoon(title: String) -> UIViewController {
        count_comingSoon += 1
        return UIViewController()
    }

}
