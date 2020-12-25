//
//  CardsHomeViewModel.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit

class CardsHomeViewModel: ViewModel {
    
    var viewControllerDelegate: CardsHomeViewControllerProtocol
    
    init(viewControllerDelegate: CardsHomeViewControllerProtocol) {
        self.viewControllerDelegate = viewControllerDelegate
    }

}

protocol CardsHomeViewModelProtocol: ViewModelProtocol {}

extension CardsHomeViewModel: CardsHomeViewModelProtocol {}
