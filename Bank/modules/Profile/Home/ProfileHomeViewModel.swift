//
//  ProfileHomeViewModel.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit

class ProfileHomeViewModel: ViewModel {
    
    var viewControllerDelegate: ProfileHomeViewControllerProtocol
    
    init(viewControllerDelegate: ProfileHomeViewControllerProtocol) {
        self.viewControllerDelegate = viewControllerDelegate
    }

}

protocol ProfileHomeViewModelProtocol: ViewModelProtocol {}

extension ProfileHomeViewModel: ProfileHomeViewModelProtocol {}
