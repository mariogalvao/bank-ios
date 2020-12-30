//
//  CardsHomeViewModel.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit

class CardsHomeViewModel: ViewModel {
    
    private var viewControllerDelegate: CardsHomeViewControllerProtocol
    private var coordinatorDelegate: CardsCoordinatorProtocol
    private var menuSectionList: [MenuSection]
    
    init(viewControllerDelegate: CardsHomeViewControllerProtocol, coordinatorDelegate: CardsCoordinatorProtocol, menuSectionList: [MenuSection] = MenuSection.getCardsMenuSectionList()) {
        self.viewControllerDelegate = viewControllerDelegate
        self.coordinatorDelegate = coordinatorDelegate
        self.menuSectionList = menuSectionList
    }

}

protocol CardsHomeViewModelProtocol: ViewModelProtocol {
    
    func getNumberOfCards() -> Int
    func getMenuSectionList()
//    func getNumberOfMenus() -> Int
//    func getMenu(for row: Int) -> Menu?
    func selectItem(for menu: Menu)
    
}

extension CardsHomeViewModel: CardsHomeViewModelProtocol {
    
    func getNumberOfCards() -> Int {
        return 2
    }
    
    func getMenuSectionList() {
        viewControllerDelegate.updateMenus(menuSectionList)
    }
    
//    func getNumberOfMenus() -> Int {
//        return filteredMenus.count
//    }
//    
//    func getMenu(for row: Int) -> Menu? {
//        if filteredMenus.count > row {
//            return filteredMenus[row]
//        }
//        return nil
//    }
    
    func selectItem(for menu: Menu) {
        coordinatorDelegate.itemSelected(for: menu)
    }
    
}
