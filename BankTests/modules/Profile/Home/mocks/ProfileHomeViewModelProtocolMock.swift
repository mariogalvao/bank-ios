//
//  ProfileHomeViewModelProtocolMock.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import UIKit
@testable import Bank

class ProfileHomeViewModelProtocolMock: ProfileHomeViewModelProtocol {
    
    var count_getMyInfo = 0
    var count_needHelp = 0
    var count_logout = 0
    
    func getMyInfo() {
        count_getMyInfo += 1
    }
    
    func needHelp() {
        count_needHelp += 1
    }
    
    func logout() {
        count_logout += 1
    }
}
