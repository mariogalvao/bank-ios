//
//  MyInfoMock.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import UIKit
import OpenAPIClient

class MyInfoMock {
    
    var mock: MyInfo
    
    init() {
        mock = MyInfo(name: "Mario Galvão",
                      email: "mhcgalvao@gmail.com",
                      cpf: "123.456.789-00",
                      phone: "(99) 99999-9999",
                      bank: "999",
                      agency: "0001",
                      account: "12345-6")
    }

}
