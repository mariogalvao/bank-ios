//
//  APIErrorMock.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import UIKit
@testable import Bank

class APIErrorMock: APIError {
    
    init() {
        super.init(.unknown)
    }

}
