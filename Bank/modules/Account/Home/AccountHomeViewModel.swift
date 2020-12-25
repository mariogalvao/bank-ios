//
//  AccountHomeViewModel.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit

class AccountHomeViewModel: ViewModel {
    
    var viewControllerDelegate: AccountHomeViewControllerProtocol
    
    init(viewControllerDelegate: AccountHomeViewControllerProtocol) {
        self.viewControllerDelegate = viewControllerDelegate
    }

}

protocol AccountHomeViewModelProtocol: ViewModelProtocol {}

extension AccountHomeViewModel: AccountHomeViewModelProtocol {}
