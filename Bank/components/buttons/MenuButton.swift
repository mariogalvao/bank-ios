//
//  MenuButton.swift
//  Bank
//
//  Created by Mário Galvao on 27/12/20.
//

import UIKit

class MenuButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil {
            imageEdgeInsets = UIEdgeInsets(top: 5, left: (bounds.width - 40), bottom: 5, right: 5)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: imageView?.frame.width ?? 0)
        }
        layer.cornerRadius = 10
        frame.size = CGSize(width: frame.size.width, height: 50)
        contentHorizontalAlignment = .left
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel?.textColor = UIColor.label
    }

}
