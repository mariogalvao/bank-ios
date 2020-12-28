//
//  CardsCoordinator.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit

class CardsCoordinator: Coordinator {
    
    var navigationController = NavigationController()
    var menus: [Menu] = []
    
    init(menus: [Menu] = Menu.getCardMenus()) {
        self.menus = menus
    }
    
    func firstViewController() -> NavigationController {
        let item = UITabBarItem(title: "Cartões", image: UIImage(systemName: "creditcard.fill"), tag: 1)
        let viewController = CardsHomeViewController()
        viewController.tabBarItem = item
        let viewModel = CardsHomeViewModel(viewControllerDelegate: viewController, coordinatorDelegate: self, menus: menus)
        viewController.viewModelDelegate = viewModel
        let navigationController = NavigationController()
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
