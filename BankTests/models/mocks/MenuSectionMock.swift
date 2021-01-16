//
//  MenuSectionMock.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import UIKit
@testable import Bank

class MenuSectionMock: MenuSection {
    
    init() {
        super.init(sectionTitle: "Título",
                   type: .menu,
                   menus: [MenuMock(), MenuMock(), MenuMock()])
    }

}
