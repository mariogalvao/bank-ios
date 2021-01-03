//
//  InvestHomeViewModel.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit

class InvestHomeViewModel: ViewModel {
    
    private var viewControllerDelegate: InvestHomeViewControllerProtocol
    private var coordinatorDelegate: InvestCoordinatorProtocol
    private var menuSectionList: [MenuSection]
    
    init(viewControllerDelegate: InvestHomeViewControllerProtocol, coordinatorDelegate: InvestCoordinatorProtocol, menuSectionList: [MenuSection] = MenuSection.getMyInvestMenuSectionList()) {
        self.viewControllerDelegate = viewControllerDelegate
        self.coordinatorDelegate = coordinatorDelegate
        self.menuSectionList = menuSectionList
    }
    
    // Substituir por requisição à API
    private func getBalance(complete: (Result<String, Error>) -> Void) {
        complete(.success("30.000,00"))
    }
    
    private func getMyInvest(complete: (Result<[MenuSection], Error>) -> Void) {
        complete(.success(MenuSection.getMyInvestMenuSectionList()))
    }
    
    private func getInvest(complete: (Result<[MenuSection], Error>) -> Void) {
        complete(.success(MenuSection.getInvestMenuSectionList()))
    }

}

protocol InvestHomeViewModelProtocol: ViewModelProtocol {
    
    func getBalance()
    func getMyInvest()
    func getInvest()
    func selectItem(for menu: Menu)
    
}

extension InvestHomeViewModel: InvestHomeViewModelProtocol {
    
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
    
    func getMyInvest() {
        getMyInvest { (result) in
            switch result {
            case .success(let menu):
                self.menuSectionList = menu
                viewControllerDelegate.updateMenus(menuSectionList)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getInvest() {
        getInvest { (result) in
            switch result {
            case .success(let menu):
                self.menuSectionList = menu
                viewControllerDelegate.updateMenus(menuSectionList)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func selectItem(for menu: Menu) {
        coordinatorDelegate.itemSelected(for: menu)
    }
    
}
