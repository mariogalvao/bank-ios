//
//  InvestCoordinator.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit

class InvestCoordinator: Coordinator {
    
    var navigationController = NavigationController()
    
    func firstViewController() -> NavigationController {
        let item = UITabBarItem(title: "Investimentos", image: UIImage(systemName: "dollarsign.circle.fill"), tag: 2)
        let viewController = InvestHomeViewController()
        viewController.tabBarItem = item
        let viewModel = InvestHomeViewModel(viewControllerDelegate: viewController, coordinatorDelegate: self)
        viewController.viewModelDelegate = viewModel
        navigationController = NavigationController()
        navigationController.viewControllers = [viewController]
        return navigationController
    }

}

protocol InvestCoordinatorProtocol: CoordinatorProtocol {
    
    func itemSelected(for transaction: Menu)
    
}

extension InvestCoordinator: InvestCoordinatorProtocol {
    
    func itemSelected(for transaction: Menu) {
        navigationController.pushViewController(comingSoon(title: transaction.title), animated: true)
    }
    
}
