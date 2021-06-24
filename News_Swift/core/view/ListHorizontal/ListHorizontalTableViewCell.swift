//
//  ListHorizontalTableViewCell.swift
//  News_Swift
//
//  Created by admin on 6/21/21.
//

import UIKit
typealias HandleGetItemView = (Int) -> ()
class ListHorizontalTableViewCell: UITableViewCell {
//    var isShowTitle = false
    @IBOutlet weak var tilteSlug: UILabel!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var titleNews: UILabel!
    var indexPath : Int!
//    {
//        didSet {
//            setItemView(index: self.indexPath)
//        }
//    }
    @IBOutlet weak var heightItem: NSLayoutConstraint!
    @IBOutlet weak var marginTopTItle: NSLayoutConstraint!
    @IBOutlet weak var heightTItle: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        icon.layer.cornerRadius = 8
    }
    func setItemView(index : Int,showTitle : Bool! = true) {
        heightTItle.constant = index == 1 && showTitle == true ? 18 : 0
        marginTopTItle.constant = index == 1 && showTitle == true ?  35 : 0
//        heightItem.constant = index == 1 && showTitle == true ?  204 : 151
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
