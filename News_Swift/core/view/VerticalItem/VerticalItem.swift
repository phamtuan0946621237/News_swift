//
//  TableViewCell.swift
//  News_Swift
//
//  Created by admin on 6/24/21.
//

import UIKit

class VerticalItem: UITableViewCell {
    @IBOutlet weak var info: UILabel!
    
    @IBOutlet weak var source: UILabel! 
    @IBOutlet weak var marginTopDescrible: NSLayoutConstraint!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var tilteNews: UILabel!
    @IBOutlet weak var describle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        icon.layer.cornerRadius = 8
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
