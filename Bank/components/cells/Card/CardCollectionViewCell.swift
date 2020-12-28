//
//  CardCollectionViewCell.swift
//  Bank
//
//  Created by Mário Galvao on 27/12/20.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cardImage: UIImageView!
    
    func setImage(_ image: UIImage) {
        cardImage.image = image
    }

}
