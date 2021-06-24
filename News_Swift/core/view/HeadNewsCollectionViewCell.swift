//
//  HeadNewsCollectionViewCell.swift
//  News_Swift
//
//  Created by admin on 6/22/21.
//

import UIKit

class HeadNewsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var icon_dèault: UIImageView!
    @IBOutlet weak var widthView: NSLayoutConstraint!
    let screenSize = UIScreen.main.bounds.size
    
    @IBOutlet weak var txt: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        icon_dèault.layer.cornerRadius = 8
        widthView.constant = (screenSize.width - 32 - 20)/3
        containerView.layer.cornerRadius = 8
    }
}
