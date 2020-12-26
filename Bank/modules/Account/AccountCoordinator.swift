//
//  AccountCoordinator.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit

class AccountCoordinator: Coordinator {
    
    var navigationController = NavigationController()
    var transactions: [Transaction] = []
    
    init(transactions: [Transaction] = Transaction.getTransactions()) {
        self.transactions = transactions
    }
    
    func firstViewController() -> NavigationController {
        let item = UITabBarItem(title: "Conta", image: UIImage(systemName: "building.columns.fill"), tag: 0)
        let viewController = AccountHomeViewController()
        viewController.tabBarItem = item
        let viewModel = AccountHomeViewModel(viewControllerDelegate: viewController, coordinatorDelegate: self, transactions: transactions)
        viewController.viewModelDelegate = viewModel
        navigationController.viewControllers = [viewController]
        return navigationController
    }
    
    private func comingSoon(title: String) {
        let viewController = ComingSoonViewController()
        let viewModel = ComingSoonViewModel(viewControllerDelegate: viewController, title: title)
        viewController.viewModelDelegate = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }

}

protocol AccountCoordinatorProtocol: CoordinatorProtocol {
    
    func itemSelected(for transaction: Transaction)
    
}

extension AccountCoordinator: AccountCoordinatorProtocol {
    
    func itemSelected(for transaction: Transaction) {
        comingSoon(title: transaction.title)
    }
    
}
