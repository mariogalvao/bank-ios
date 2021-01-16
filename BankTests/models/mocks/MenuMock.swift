//
//  MenuMock.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import UIKit
@testable import Bank

class MenuMock: Menu {
    
    init() {
        super.init(type: .payment,
                   icon: UIImage(systemName: "barcode.viewfinder"),
                   title: "Pagamento",
                   details: "Pague seu boleto.")
    }

}
