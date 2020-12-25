//
//  ProfileHomeViewController.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit

class ProfileHomeViewController: ViewController {
    
    var viewModelDelegate: ProfileHomeViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Perfil"
    }

}

protocol ProfileHomeViewControllerProtocol: ViewControllerProtocol {}

extension ProfileHomeViewController: ProfileHomeViewControllerProtocol {}
