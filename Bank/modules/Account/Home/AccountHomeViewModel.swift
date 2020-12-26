//
//  AccountHomeViewModel.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit

class AccountHomeViewModel: ViewModel {
    
    var viewControllerDelegate: AccountHomeViewControllerProtocol
    var coordinatorDelegate: AccountCoordinatorProtocol
    var transactions: [Transaction]
    var filteredTransactions: [Transaction]
    
    init(viewControllerDelegate: AccountHomeViewControllerProtocol, coordinatorDelegate: AccountCoordinatorProtocol, transactions: [Transaction]) {
        self.viewControllerDelegate = viewControllerDelegate
        self.coordinatorDelegate = coordinatorDelegate
        self.transactions = transactions
        self.filteredTransactions = transactions
    }

}

protocol AccountHomeViewModelProtocol: ViewModelProtocol {
    
    func getNumberOfTransactions() -> Int
    func getTransaction(for row: Int) -> Transaction?
    func filterTransactions(by text: String)
    func selectItem(for transaction: Transaction)
    
}

extension AccountHomeViewModel: AccountHomeViewModelProtocol {
    
    func getNumberOfTransactions() -> Int {
        return filteredTransactions.count
    }
    
    func getTransaction(for row: Int) -> Transaction? {
        if filteredTransactions.count > row {
            return filteredTransactions[row]
        }
        return nil
    }
    
    func filterTransactions(by text: String) {
        if text.isEmpty {
            filteredTransactions = transactions
        } else {
            filteredTransactions = transactions.filter({ (transaction) -> Bool in
                return transaction.title.contains(text) || transaction.details.contains(text)
            })
        }
        viewControllerDelegate.updateTransactions()
    }
    
    func selectItem(for transaction: Transaction) {
        coordinatorDelegate.itemSelected(for: transaction)
    }
    
}
