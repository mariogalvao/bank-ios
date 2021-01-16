//
//  APIAccountMock.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import UIKit
import OpenAPIClient
@testable import Bank

class APIAccountMock: APIAccountProtocol {
    
    var success: Bool = true
    var count_getBalance = 0
    var count_getMyInfo = 0
    
    func getBalance(completion: @escaping (Result<Balance, APIError>) -> Void) {
        count_getBalance += 1
        if success {
            completion(.success(BalanceMock().mock))
        } else {
            completion(.failure(APIErrorMock()))
        }
    }
    
    func getMyInfo(completion: @escaping (Result<MyInfo, APIError>) -> Void) {
        count_getMyInfo += 1
        if success {
            completion(.success(MyInfoMock().mock))
        } else {
            completion(.failure(APIErrorMock()))
        }
    }
    
}
