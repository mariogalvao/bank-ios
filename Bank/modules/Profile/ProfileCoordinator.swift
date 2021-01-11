//
//  ProfileCoordinator.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit

class ProfileCoordinator: Coordinator {
    
    var navigationController = NavigationController()
    
    func firstViewController() -> NavigationController {
        let item = UITabBarItem(title: "Perfil", image: UIImage(systemName: "person.crop.circle.fill"), tag: 3)
        let viewController = ProfileHomeViewController()
        viewController.tabBarItem = item
        let viewModel = ProfileHomeViewModel(viewControllerDelegate: viewController, coordinatorDelegate: self)
        viewController.viewModelDelegate = viewModel
        navigationController = NavigationController()
        navigationController.viewControllers = [viewController]
        return navigationController
    }

}

protocol ProfileCoordinatorProtocol: CoordinatorProtocol {
    
    func support()
    func logout()
    
}

extension ProfileCoordinator: ProfileCoordinatorProtocol {
    
    func support() {
        navigationController.pushViewController(comingSoon(title: "Suporte"), animated: true)
    }
    func logout() {
        navigationController.pushViewController(comingSoon(title: "Logout"), animated: true)
    }
    
}
