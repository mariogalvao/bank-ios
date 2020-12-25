//
//  AccountHomeViewController.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit

class AccountHomeViewController: ViewController {
    
    var viewModelDelegate: AccountHomeViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Conta"
    }

}

protocol AccountHomeViewControllerProtocol: ViewControllerProtocol {}

extension AccountHomeViewController: AccountHomeViewControllerProtocol {}
