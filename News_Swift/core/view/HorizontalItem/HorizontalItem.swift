//
//  HorizontalItem.swift
//  News_Swift
//
//  Created by admin on 6/24/21.
//

import UIKit

class HorizontalItem: UITableViewCell {

    @IBOutlet weak var heightTitle: NSLayoutConstraint!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var source: UILabel!
    @IBOutlet weak var titleNews: UILabel!
    @IBOutlet weak var paddingTop: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        icon.layer.cornerRadius = 8
    }
    
    func setIndex(index : Int) {
        if (index != 1) {
            self.heightTitle.constant = 0
            self.paddingTop.constant = 0
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
