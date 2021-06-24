//
//  ListVerticalViewCell.swift
//  News_Swift
//
//  Created by admin on 6/21/21.
//

import UIKit

class ListVerticalViewCell: UITableViewCell {

    @IBOutlet weak var heightView: NSLayoutConstraint!
    @IBOutlet weak var marginTopDescrible: NSLayoutConstraint!
    var excerpt : String = ""
    @IBOutlet weak var describle: UILabel!
    @IBOutlet weak var sourceTitle: UILabel!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var source: UILabel!
    @IBOutlet weak var icon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        icon.layer.cornerRadius = 8
//        self.frame.size.height = 100
//        marginTopDescrible.constant = excerpt == "" ? 0 : 14
//        heightView.constant = excerpt == ""  ? 330 : 430
//        describle.font
//        describle.font = UIFont.systemFont(ofSize: 1.0)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
