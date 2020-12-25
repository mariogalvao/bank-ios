//
//  TabBarController.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [account(), cards(), invest(), profile()]
    }
    
    private func account() -> NavigationController {
        let cooordinator = AccountCoordinator()
        return cooordinator.firstViewController()
    }
    
    private func cards() -> NavigationController {
        let cooordinator = CardsCoordinator()
        return cooordinator.firstViewController()
    }
    
    private func invest() -> NavigationController {
        let cooordinator = InvestCoordinator()
        return cooordinator.firstViewController()
    }
    
    private func profile() -> NavigationController {
        let cooordinator = ProfileCoordinator()
        return cooordinator.firstViewController()
    }

}
