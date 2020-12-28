//
//  Coordinator.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit

class Coordinator: NSObject {
    
    func comingSoon(title: String) -> UIViewController {
        let viewController = ComingSoonViewController()
        let viewModel = ComingSoonViewModel(viewControllerDelegate: viewController, title: title)
        viewController.viewModelDelegate = viewModel
        return viewController
    }
    
}

protocol CoordinatorProtocol {
    
    func comingSoon(title: String) -> UIViewController
    
}
