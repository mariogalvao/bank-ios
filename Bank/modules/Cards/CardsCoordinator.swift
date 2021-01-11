//
//  CardsCoordinator.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit

class CardsCoordinator: Coordinator {
    
    var navigationController = NavigationController()
    
    func firstViewController() -> NavigationController {
        let item = UITabBarItem(title: "Cartões", image: UIImage(systemName: "creditcard.fill"), tag: 1)
        let viewController = CardsHomeViewController()
        viewController.tabBarItem = item
        let viewModel = CardsHomeViewModel(viewControllerDelegate: viewController, coordinatorDelegate: self)
        viewController.viewModelDelegate = viewModel
        navigationController = NavigationController()
        navigationController.viewControllers = [viewController]
        return navigationController
    }

}

protocol CardsCoordinatorProtocol: CoordinatorProtocol {
    
    func itemSelected(for transaction: Menu)
    
}

extension CardsCoordinator: CardsCoordinatorProtocol {
    
    func itemSelected(for transaction: Menu) {
        navigationController.pushViewController(comingSoon(title: transaction.title), animated: true)
    }
    
}
