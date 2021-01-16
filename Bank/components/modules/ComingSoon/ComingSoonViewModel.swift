//
//  ComingSoonViewModel.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit

class ComingSoonViewModel: ViewModel {
    
    var viewControllerDelegate: ComingSoonViewControllerProtocol
    var title: String
    
    init(viewControllerDelegate: ComingSoonViewControllerProtocol, title: String) {
        self.viewControllerDelegate = viewControllerDelegate
        self.title = title
    }

}

protocol ComingSoonViewModelProtocol: ViewModelProtocol {
    
    func getTitle() -> String
    
}

extension ComingSoonViewModel: ComingSoonViewModelProtocol {
    
    func getTitle() -> String {
        return title
    }
    
}
