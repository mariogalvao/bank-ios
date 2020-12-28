//
//  AccountHomeViewModel.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit

class AccountHomeViewModel: ViewModel {
    
    var viewControllerDelegate: AccountHomeViewControllerProtocol
    var coordinatorDelegate: AccountCoordinatorProtocol
    var menus: [Menu]
    var filteredMenus: [Menu]
    
    init(viewControllerDelegate: AccountHomeViewControllerProtocol, coordinatorDelegate: AccountCoordinatorProtocol, menus: [Menu]) {
        self.viewControllerDelegate = viewControllerDelegate
        self.coordinatorDelegate = coordinatorDelegate
        self.menus = menus
        self.filteredMenus = menus
    }

}

protocol AccountHomeViewModelProtocol: ViewModelProtocol {
    
    func getNumberOfMenus() -> Int
    func getMenu(for row: Int) -> Menu?
    func filterMenus(by text: String)
    func selectItem(for transaction: Menu)
    
}

extension AccountHomeViewModel: AccountHomeViewModelProtocol {
    
    func getNumberOfMenus() -> Int {
        return filteredMenus.count
    }
    
    func getMenu(for row: Int) -> Menu? {
        if filteredMenus.count > row {
            return filteredMenus[row]
        }
        return nil
    }
    
    func filterMenus(by text: String) {
        if text.isEmpty {
            filteredMenus = menus
        } else {
            filteredMenus = menus.filter({ (transaction) -> Bool in
                return transaction.title.contains(text) || transaction.details.contains(text)
            })
        }
        viewControllerDelegate.updateMenus()
    }
    
    func selectItem(for transaction: Menu) {
        coordinatorDelegate.itemSelected(for: transaction)
    }
    
}
