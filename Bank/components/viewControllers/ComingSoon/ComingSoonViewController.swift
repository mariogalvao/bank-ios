//
//  ComingSoonViewController.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit

class ComingSoonViewController: ViewController {
    
    var viewModelDelegate: ComingSoonViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = viewModelDelegate?.getTitle()
    }

}

protocol ComingSoonViewControllerProtocol: ViewControllerProtocol {}

extension ComingSoonViewController: ComingSoonViewControllerProtocol {}
