//
//  InvestCoordinator.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit

class InvestCoordinator: Coordinator {
    
    func firstViewController() -> NavigationController {
        let item = UITabBarItem(title: "Investimentos", image: UIImage(systemName: "dollarsign.circle.fill"), tag: 2)
        let viewController = InvestHomeViewController()
        viewController.tabBarItem = item
        let viewModel = InvestHomeViewModel(viewControllerDelegate: viewController)
        viewController.viewModelDelegate = viewModel
        let navigationController = NavigationController()
        navigationController.viewControllers = [viewController]
        return navigationController
    }

}
