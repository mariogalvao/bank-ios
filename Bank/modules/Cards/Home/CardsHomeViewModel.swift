//
//  CardsHomeViewModel.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit

class CardsHomeViewModel: ViewModel {
    
    var viewControllerDelegate: CardsHomeViewControllerProtocol
    var coordinatorDelegate: CardsCoordinatorProtocol
    var menus: [Menu]
    var filteredMenus: [Menu]
    
    init(viewControllerDelegate: CardsHomeViewControllerProtocol, coordinatorDelegate: CardsCoordinatorProtocol, menus: [Menu]) {
        self.viewControllerDelegate = viewControllerDelegate
        self.coordinatorDelegate = coordinatorDelegate
        self.menus = menus
        self.filteredMenus = menus
    }

}

protocol CardsHomeViewModelProtocol: ViewModelProtocol {
    
    func getNumberOfCards() -> Int
    func getNumberOfMenus() -> Int
    func getMenu(for row: Int) -> Menu?
    func selectItem(for transaction: Menu)
    
}

extension CardsHomeViewModel: CardsHomeViewModelProtocol {
    
    func getNumberOfCards() -> Int {
        return 2
    }
    
    func getNumberOfMenus() -> Int {
        return filteredMenus.count
    }
    
    func getMenu(for row: Int) -> Menu? {
        if filteredMenus.count > row {
            return filteredMenus[row]
        }
        return nil
    }
    
    func selectItem(for transaction: Menu) {
        coordinatorDelegate.itemSelected(for: transaction)
    }
    
}
