//
//  AccountCoordinator.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit

class AccountCoordinator: Coordinator {
    
    func firstViewController() -> NavigationController {
        let item = UITabBarItem(title: "Conta", image: UIImage(systemName: "building.columns.fill"), tag: 0)
        let viewController = AccountHomeViewController()
        viewController.tabBarItem = item
        let viewModel = AccountHomeViewModel(viewControllerDelegate: viewController, coordinatorDelegate: self)
        viewController.viewModelDelegate = viewModel
        navigationController.viewControllers = [viewController]
        return navigationController
    }

}

protocol AccountCoordinatorProtocol: CoordinatorProtocol {
    
    func itemSelected(for transaction: Menu)
    
}

extension AccountCoordinator: AccountCoordinatorProtocol {
    
    func itemSelected(for transaction: Menu) {
        navigationController.pushViewController(comingSoon(title: transaction.title), animated: true)
    }
    
}
