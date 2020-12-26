//
//  ItemTableViewCell.swift
//  Bank
//
//  Created by Mário Galvao on 26/12/20.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    func setUp(icon: UIImage?, title: String, details: String) {
        self.icon.image = icon
        self.icon.isHidden = icon == nil
        self.titleLabel.text = title
        self.detailsLabel.text = details
    }
    
}
