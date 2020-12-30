//
//  AccountHomeViewModel.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit

class AccountHomeViewModel: ViewModel {
    
    private var viewControllerDelegate: AccountHomeViewControllerProtocol
    private var coordinatorDelegate: AccountCoordinatorProtocol
    private var menuSectionList: [MenuSection]
    
    init(viewControllerDelegate: AccountHomeViewControllerProtocol, coordinatorDelegate: AccountCoordinatorProtocol, menuSectionList: [MenuSection] = MenuSection.getAccountMenuSectionList()) {
        self.viewControllerDelegate = viewControllerDelegate
        self.coordinatorDelegate = coordinatorDelegate
        self.menuSectionList = menuSectionList
    }
    
    // Substituir por requisição à API
    private func getBalance(complete: (Result<String, Error>) -> Void) {
        complete(.success("1.234,56"))
    }

}

protocol AccountHomeViewModelProtocol: ViewModelProtocol {
    
    func getBalance()
    func getMenuSectionList()
    func filterMenus(by text: String)
    func selectItem(for menu: Menu)
    
}

extension AccountHomeViewModel: AccountHomeViewModelProtocol {
    
    func getBalance() {
        getBalance { (result) in
            switch result {
            case .success(let balance):
                viewControllerDelegate.setBalance(balance)
                viewControllerDelegate.updateMenus(menuSectionList)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getMenuSectionList() {
        viewControllerDelegate.updateMenus(menuSectionList)
    }
    
    func filterMenus(by text: String) {
        menuSectionList.forEach { (menuSection) in
            menuSection.filterMenus(by: text) {
                viewControllerDelegate.updateMenus(menuSectionList)
            }
        }
    }
    
    func selectItem(for menu: Menu) {
        coordinatorDelegate.itemSelected(for: menu)
    }
    
}
