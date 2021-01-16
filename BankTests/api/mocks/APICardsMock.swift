//
//  APICardsMock.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import UIKit
import OpenAPIClient
@testable import Bank

class APICardsMock: APICardsProtocol {
    
    var success: Bool = true
    var count_getCards = 0
    
    func getCards(completion: @escaping (Result<[Card], APIError>) -> Void) {
        count_getCards += 1
        if success {
            completion(.success(CardsMock().mock))
        } else {
            completion(.failure(APIErrorMock()))
        }
    }
    
}
