//
//  CardInfoTableViewCell.swift
//  Bank
//
//  Created by Mário Galvao on 27/12/20.
//

import UIKit

class CardInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var spentLabel: UILabel!
    @IBOutlet weak var availableLabel: UILabel!
    
    func setLimits(spentValue: Double, availableValue: Double) {
        progressView.progress = Float(spentValue / (spentValue + availableValue))
    }
    
}
