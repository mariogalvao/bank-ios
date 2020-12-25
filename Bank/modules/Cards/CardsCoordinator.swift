//
//  CardsCoordinator.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit

class CardsCoordinator: Coordinator {
    
    func firstViewController() -> NavigationController {
        let item = UITabBarItem(title: "Cartões", image: UIImage(systemName: "creditcard.fill"), tag: 1)
        let viewController = CardsHomeViewController()
        viewController.tabBarItem = item
        let viewModel = CardsHomeViewModel(viewControllerDelegate: viewController)
        viewController.viewModelDelegate = viewModel
        let navigationController = NavigationController()
        navigationController.viewControllers = [viewController]
        return navigationController
    }

}
