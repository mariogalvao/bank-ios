//
//  ProfileHomeViewControllerProtocolMock.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import UIKit
import OpenAPIClient
@testable import Bank

class ProfileHomeViewControllerProtocolMock: ProfileHomeViewControllerProtocol {
    
    var count_setMyInfo = 0
    
    func setMyInfo(_ myInfo: MyInfo) {
        count_setMyInfo += 1
    }
}
