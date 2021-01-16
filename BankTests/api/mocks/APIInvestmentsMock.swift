//
//  APIInvestmentsMock.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import UIKit
import OpenAPIClient
@testable import Bank

class APIInvestmentsMock: APIInvestmentsProtocol {
    
    var success: Bool = true
    var count_getMyInvestments = 0
    var count_getInvestments = 0
    
    func getMyInvestments(completion: @escaping (Result<MyInvestments, APIError>) -> Void) {
        count_getMyInvestments += 1
        if success {
            completion(.success(MyInvestmentsMock().mock))
        } else {
            completion(.failure(APIErrorMock()))
        }
    }
    
    func getInvestments(completion: @escaping (Result<[Investment], APIError>) -> Void) {
        count_getInvestments += 1
        if success {
            completion(.success(InvestmentsMock().mock))
        } else {
            completion(.failure(APIErrorMock()))
        }
    }
    
    
    
}
