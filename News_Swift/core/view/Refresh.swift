//
//  Refresh.swift
//  News_Swift
//
//  Created by admin on 6/23/21.
//

import Foundation
import UIKit

typealias HanldeReFreshPage = () -> Void
class RefreshView {
    var handleRefresh : HanldeReFreshPage!
    var tableView = UITableView()
    var refreshControl = UIRefreshControl()
    
    func addRefreshControl() {
        refreshControl.tintColor = UIColor.main
        refreshControl.addTarget(self, action: #selector(refreshContents), for: .valueChanged)
        if #available(ios 10.0,*) {
            tableView.refreshControl = refreshControl
        }else {
            tableView.addSubview(refreshControl)
        }
    }
    
    func refreshHandleCompiler(handle : @escaping HanldeReFreshPage) {
        self.handleRefresh = handle
    }
    
    
    @objc func refreshContents() {
        handleRefresh()
//        handleRefresh = handle
    }
    
    @objc func finishedRefreshing() {
        refreshControl.endRefreshing()
    }
}
