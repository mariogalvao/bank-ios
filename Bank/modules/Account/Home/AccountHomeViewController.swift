//
//  AccountHomeViewController.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit

class AccountHomeViewController: ViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModelDelegate: AccountHomeViewModelProtocol?
    
    let searchController = SearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Conta"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "BalanceTableViewCell", bundle: nil), forCellReuseIdentifier: "BalanceTableViewCell")
        tableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemTableViewCell")
        tableView.register(UINib(nibName: "HeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "HeaderView")
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }

}

extension AccountHomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as? HeaderView else {
            return nil
        }
        switch section {
        case 0:
            header.setTitle("Saldo Atual")
        case 1:
            header.setTitle("Menu")
        default:
            return nil
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let transaction = viewModelDelegate?.getMenu(for: indexPath.row) {
            viewModelDelegate?.selectItem(for: transaction)
        }
    }
    
}

extension AccountHomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return viewModelDelegate?.getNumberOfMenus() ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return getBalanceCell(tableView, cellForRowAt: indexPath)
        case 1:
            return getMenuCell(tableView, cellForRowAt: indexPath)
        default:
            return UITableViewCell()
        }
    }
    
    private func getBalanceCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BalanceTableViewCell", for: indexPath) as? BalanceTableViewCell else {
            return UITableViewCell()
        }
        cell.setUp(balance: "1.234,56", visible: true)
        return cell
    }
    
    private func getMenuCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as? ItemTableViewCell, let transaction = viewModelDelegate?.getMenu(for: indexPath.row) else {
            return UITableViewCell()
        }
        cell.setUp(icon: transaction.icon, title: transaction.title, details: transaction.details)
        return cell
    }
    
}

extension AccountHomeViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        viewModelDelegate?.filterMenus(by: text)
    }
    
}

protocol AccountHomeViewControllerProtocol: ViewControllerProtocol {
    
    func updateMenus()
    
}

extension AccountHomeViewController: AccountHomeViewControllerProtocol {
    
    func updateMenus() {
        tableView.reloadData()
    }
    
}
