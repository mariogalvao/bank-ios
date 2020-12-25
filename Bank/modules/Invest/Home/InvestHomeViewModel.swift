//
//  InvestHomeViewModel.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit

class InvestHomeViewModel: ViewModel {
    
    var viewControllerDelegate: InvestHomeViewControllerProtocol
    
    init(viewControllerDelegate: InvestHomeViewControllerProtocol) {
        self.viewControllerDelegate = viewControllerDelegate
    }

}

protocol InvestHomeViewModelProtocol: ViewModelProtocol {}

extension InvestHomeViewModel: InvestHomeViewModelProtocol {}
