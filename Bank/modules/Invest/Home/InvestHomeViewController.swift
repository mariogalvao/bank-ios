//
//  InvestHomeViewController.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit

class InvestHomeViewController: ViewController {
    
    var viewModelDelegate: InvestHomeViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Investimentos"
    }

}

protocol InvestHomeViewControllerProtocol: ViewControllerProtocol {}

extension InvestHomeViewController: InvestHomeViewControllerProtocol {}
