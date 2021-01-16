//
//  ProfileCoordinatorProtocolMock.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import UIKit
@testable import Bank

class ProfileCoordinatorProtocolMock: ProfileCoordinatorProtocol {
    
    var count_support = 0
    var count_logout = 0
    var count_comingSoon = 0
    
    func support() {
        count_support += 1
    }
    
    func logout() {
        count_logout += 1
    }
    
    func comingSoon(title: String) -> UIViewController {
        count_comingSoon += 1
        return UIViewController()
    }
}
