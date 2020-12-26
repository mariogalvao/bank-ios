//
//  HeaderView.swift
//  Bank
//
//  Created by Mário Galvao on 26/12/20.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var titleLabel: UILabel!

    func setTitle(_ title: String) {
        self.titleLabel.text = title.uppercased()
    }
    
}
