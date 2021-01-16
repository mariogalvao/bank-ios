//
//  MenuTableViewProtocolMock.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import UIKit
@testable import Bank

class MenuTableViewProtocolMock: MenuTableViewProtocol {
    
    var count_getCustomCellForRowAt = 0
    var count_didSelect = 0
    
    func getCustomCellForRowAt(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell? {
        count_getCustomCellForRowAt += 1
        return nil
    }
    
    func didSelect(menu: Menu) {
        count_didSelect += 1
    }

}
