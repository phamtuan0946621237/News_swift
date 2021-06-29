//
//  WebViewVC.swift
//  News_Swift
//
//  Created by admin on 6/28/21.
//

import UIKit
import WebKit
typealias HandleBack = () -> Void
class WebViewVC: UIViewController {
    let webView = WKWebView()
    var back : HandleBack! 
    @IBOutlet weak var tilteHeader: UILabel!
    @IBOutlet weak var webview: UIView!
    var titleeee : String = ""
    var url : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webview.addSubview(webView)
        
    }
    @IBAction func onClickBack(_ sender: Any) {
        back()
    }
    
    func onBack(handle : @escaping HandleBack) {
        self.back = handle
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let url = URL(string: url) else {
            return
        }
        webView.load(URLRequest(url: url))
        webView.frame = webview.bounds
        self.tilteHeader.text = self.titleeee
    }
}
