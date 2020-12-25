//
//  ProfileCoordinator.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit

class ProfileCoordinator: Coordinator {
    
    func firstViewController() -> NavigationController {
        let item = UITabBarItem(title: "Perfil", image: UIImage(systemName: "person.crop.circle.fill"), tag: 3)
        let viewController = ProfileHomeViewController()
        viewController.tabBarItem = item
        let viewModel = ProfileHomeViewModel(viewControllerDelegate: viewController)
        viewController.viewModelDelegate = viewModel
        let navigationController = NavigationController()
        navigationController.viewControllers = [viewController]
        return navigationController
    }

}
