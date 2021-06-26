//
//  Scrollview.swift
//  News_Swift
//
//  Created by admin on 6/25/21.
//

import UIKit

extension UIScrollView {
    func scrollToTop() {
        let desiredOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(desiredOffset, animated: true)
   }
}
