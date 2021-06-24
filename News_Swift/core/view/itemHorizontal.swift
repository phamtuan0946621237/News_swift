//
//  itemHorizontal.swift
//  News_Swift
//
//  Created by admin on 6/21/21.
//

import UIKit

class ItemListHorizontal: UIView {
    let ItemHorizontal = "ItemListHorizontal"
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var source: UILabel!
    @IBOutlet weak var iconNews: UIImageView!
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        let viewFromXib = Bundle.main.loadNibNamed("ItemListHorizontal", owner: self, options: nil)![0] as! UIView
        
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
    }

}
