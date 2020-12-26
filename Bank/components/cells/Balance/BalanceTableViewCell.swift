//
//  BalanceTableViewCell.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit

class BalanceTableViewCell: UITableViewCell {

    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var visibleButton: UIButton!
    
    private var balance: String = ""
    private var visible: Bool = false {
        didSet {
            update()
        }
    }
    
    private func update() {
        if visible {
            visibleButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            balanceLabel.text = balance
        } else {
            visibleButton.setImage(UIImage(systemName: "eye"), for: .normal)
            balanceLabel.text = "---"
        }
    }
    
    func setUp(balance: String, visible: Bool) {
        self.balance = balance
        self.visible = visible
    }
    
    @IBAction func setVisible(_ sender: UIButton) {
        visible = !visible
    }
    
}
