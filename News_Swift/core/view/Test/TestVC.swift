//
//  TestVC.swift
//  News_Swift
//
//  Created by admin on 6/22/21.
//

import Foundation
import UIKit

typealias Hanlde = (Int) -> ()
class TestView : UIView {
//    override init(frame : CGRect) {
//        super.init(frame: frame)
    @IBOutlet weak var btn: UIButton!
    var indexSelected : Int = 70
    //
//    }
    var onClick : Hanlde!
    
    @IBAction func handleBtn(_ sender: Any) {
//        onClick(self.indexSelected!)
        onClick(indexSelected)
    }
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        print("oooo : ",indexSelected)
        
        commonInit()
        
    }
    
    func setttt(handle : @escaping Hanlde) {
        self.onClick = handle
    }
    
    
    
    func _settt(index : Int) {
        print("aaaaa : ",index)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        
        
        let viewFromXib = Bundle.main.loadNibNamed("TestVC", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
    }
    
}
