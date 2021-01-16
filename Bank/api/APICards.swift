//
//  APICards.swift
//  Bank
//
//  Created by Mário Galvao on 10/01/21.
//

import UIKit
import OpenAPIClient

protocol APICardsProtocol: APIProtocol {
    
    func getCards(completion: @escaping (Result<[Card], APIError>) -> Void)
    
}

class APICards: API, APICardsProtocol {
    
    func getCards(completion: @escaping (Result<[Card], APIError>) -> Void) {
        CardsAPI.getMyCards { (response, error) in
            self.handleResponse(response: response, error: error, complete: completion)
        }
    }

}
