//
//  CardsHomeViewController.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit

class CardsHomeViewController: ViewController {
    
    var viewModelDelegate: CardsHomeViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Cartões"
    }

}

protocol CardsHomeViewControllerProtocol: ViewControllerProtocol {}

extension CardsHomeViewController: CardsHomeViewControllerProtocol {}
