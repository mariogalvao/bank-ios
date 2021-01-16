//
//  ComingSoonViewModelProtocolMock.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import UIKit
@testable import Bank

class ComingSoonViewModelProtocolMock: ComingSoonViewModelProtocol {
    
    var count_getTitle = 0
    
    func getTitle() -> String {
        count_getTitle += 1
        return "Título"
    }
    
}
