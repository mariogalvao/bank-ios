//
//  NavigationControllerMock.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import UIKit
@testable import Bank

class NavigationControllerMock: NavigationController {
    
    var count_pushViewController = 0

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        count_pushViewController += 1
        super.pushViewController(viewController, animated: animated)
    }

}
