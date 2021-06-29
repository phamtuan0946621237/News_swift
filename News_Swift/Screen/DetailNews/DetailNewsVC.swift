//
//  DetailNewsVC.swift
//  News_Swift
//
//  Created by admin on 6/21/21.
//

import UIKit
import WebKit

class DetailNewsVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var icBack: UIImageView!
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var tableOther: UITableView!
    @IBOutlet weak var tableTincung: UITableView!
    @IBOutlet weak var tincung: UIView!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var originNews: UIView!
    var data = PostBySourceItemModel()
    @IBOutlet weak var titleNews: UILabel!
    @IBOutlet weak var heightTableTincung: NSLayoutConstraint!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var describle: UILabel!
    var dataSameSource : [PostBySourceItemModel] = []
    var dataTinlienquan : [PostBySourceItemModel] = []
    var data2 : Array<DataItem> = []
    var page : Int = 1
    var pageTinLienquan : Int = 1
    var slug : String!
    var detailNewsModel = DetailNewsModel()
    var heightTableView = 720
    @IBOutlet weak var webview: WKWebView!
    @IBOutlet weak var heightTinlienquan: NSLayoutConstraint!
    let screenSize = UIScreen.main.bounds.size
    @IBOutlet weak var titleOriginNews: UILabel!
    @IBOutlet weak var fontSizeView: UILabel!
    @IBOutlet weak var shareView: UIView!
    @IBOutlet weak var htmlView: UIView!
    
//    @IBOutlet weak var heightHtml: NSLayoutConstraint!
    // life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        initView()
        callAPI(slug: self.slug)
        callAPISameSource(slug: self.slug, page: self.page)
        callAPITinlienquan(slug: self.slug, page: self.pageTinLienquan)
        let defaults = UserDefaults.standard
        let ratio = defaults.float(forKey: "ratio")
        getFontSizeTilte(ratio : ratio)
//        heightHtml.constant = 0
        
    }
    
    
}


// view
extension DetailNewsVC {
    func initView() {
        originNews.layer.cornerRadius = 4
        icon.layer.cornerRadius = 8
        self.heightTableTincung.constant = CGFloat(self.heightTableView)
        self.heightTinlienquan.constant = CGFloat(self.heightTableView)
        
        // iconBack
        detailNewsModel.setActionImage(icBack: self.icBack)
        detailNewsModel.onClickBack(handle: { [self] () in
            navigationController?.popViewController(animated: true)
        })
        
        let share = UITapGestureRecognizer(target: self, action:  #selector(self.shareAction))
        self.shareView.addGestureRecognizer(share)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(DetailNewsVC.changeFontSize))
        fontSizeView.isUserInteractionEnabled = true
        fontSizeView.addGestureRecognizer(tap)
        
        let originAction = UITapGestureRecognizer(target: self, action:  #selector(self.onClickOriginNews))
        self.originNews.addGestureRecognizer(originAction)
        
    }
    
    @objc func onClickOriginNews(sender : UITapGestureRecognizer) {
        let vc = WebViewVC()
        vc.titleeee = self.data.source!.name!
        vc.url = self.data.sourceLink!
        vc.modalPresentationStyle = .pageSheet
        present(vc,animated: true)
        vc.onBack(handle: { [self] in
            vc.dismiss(animated: true, completion: nil)
        })
    }
    
    func getFontSizeTilte(ratio : Float) {
        titleNews.font = UIFont.systemFont(ofSize: 22.0 * CGFloat(ratio),weight : .bold)
        describle.font = UIFont.systemFont(ofSize: 18 * CGFloat(ratio), weight: .semibold)
        info.font = UIFont.systemFont(ofSize: 13 * CGFloat(ratio), weight: .regular)
        titleOriginNews.font = UIFont.systemFont(ofSize: 12 * CGFloat(ratio), weight: .regular)
    }
    
    @objc func changeFontSize(sender:UITapGestureRecognizer) {
        let vc = ModalViewController()
        vc.modalPresentationStyle = .overFullScreen
        present(vc,animated: true)
        self.changeFont(vc: vc)
        vc.dismisModal(handle: { [self]  in
            vc.dismiss(animated: true, completion: nil)
        })
        
    }
    
    func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
        return false
    }
    
    func setupTableView() {
        tableTincung.dataSource = self
        tableTincung.delegate = self
        tableTincung.register(UINib(nibName: "HorizontalItem", bundle: Bundle.main), forCellReuseIdentifier: "HorizontalItem")
        tableTincung.showsVerticalScrollIndicator = false
        tableTincung.isScrollEnabled = false
        tableOther.dataSource = self
        tableOther.delegate = self
        tableOther.register(UINib(nibName: "HorizontalItem", bundle: Bundle.main), forCellReuseIdentifier: "HorizontalItem")
        tableOther.showsVerticalScrollIndicator = false
        tableOther.isScrollEnabled = false
    }
}

// setupTableview
extension DetailNewsVC {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableTincung {
            return dataSameSource.count
        }
        return dataTinlienquan.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HorizontalItem", for: indexPath) as! HorizontalItem
        let item : PostBySourceItemModel
        if  self.tableTincung == tableView{
            item = dataSameSource[indexPath.row]
        }else {
            item = dataTinlienquan[indexPath.row]
        }
        cell.setIndex(index : 0)
        cell.info.text = "\((item.source?.name)!) •  \("1 giờ trước")"
        cell.source.text = item.category?.name
        cell.titleNews.text = item.title
        cell.titleNews.numberOfLines = 2
        if let img = item.featureImage {
            cell.icon.sd_setImage(with: URL(string: img), completed: nil)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        scrollview.scrollToTop()
        let slug : String
        if tableOther == tableView {
            slug = self.dataTinlienquan[indexPath.row].slug!
        }else{
            slug = self.dataSameSource[indexPath.row].slug!
        }
        self.dataTinlienquan = []
        self.dataSameSource = []
        self.page = 1
        self.pageTinLienquan = 1
        self.heightTableTincung.constant = CGFloat(self.heightTableView)
        self.heightTinlienquan.constant = CGFloat(self.heightTableView)
        DispatchQueue.main.async {
            self.callAPI(slug: slug)
            self.callAPISameSource(slug: slug, page: self.page)
            self.callAPITinlienquan(slug: slug, page: self.pageTinLienquan)
        }
    }
}

// call api
extension DetailNewsVC {
    func callAPI(slug : String) {
        Service.detailNews(
            slug : slug,
            result: { [self] res in
                switch res.success {
                case true :
                    print("self.data.html",self.data.html)
                    if let response = res.data {
                        self.data = response
                        self.titleNews.text = self.data.title
                        self.describle.text = self.data.excerpt
                        self.info.text = "\((self.data.source!.name)!) •  \("1 giờ trước")"
                        if let icon = self.data.featureImage {
                            self.icon.sd_setImage(with: URL(string: icon), completed: nil)
                        }
                        
//                        let body = """
//                            \((self.data.html)!)
//                            """
//                        let html = """
//                            <!DOCTYPE html>
//                            <html lang="en">
//                            <style>
//                            p {
//                                        margin: 2px;
//                                        padding : 2px;
//                                        /* fontSize: fontsize.text18 * ratioFontSize, */
//                                        font-weight: "normal";
//                                        font-style: "normal";
//                                        line-height: 36;
//                                        color: black
//                                    }
//                                    ul {
//                                        margin: 2px;
//                                        padding : 2px;
//                                        /* font-size: fontsize.text19 * ratioFontSize; */
//                                        font-weight: "normal";
//                                        font-style: "normal";
//                                        line-height: 36;
//                                        color: black
//                                    }
//                                    strong{
//                                        font-weight: bold;
//                                    }
//                                    em {
//                                        text-decoration : 'underline'
//                                    }
//                            </style>
//                            <head>
//                                <meta charset="UTF-8">
//                                <meta name="viewport" content="width=device-width, initial-scale=1.0">
//                                <title>Document</title>
//                            </head>
//                            <body>
//                                \(body)
//                            </body>
//                            </html>
//                            """
//                        webview.loadHTMLString(html, baseURL: nil)
                    }
                    
                    break;
                case false :
                    print("fail")
                    break;
                default :
                    break
                }
        })
    }
    
    func callAPISameSource(slug : String,page : Int) {
        Service.sameSource(
            page : page,
            slug : slug,
            result: { [self] res in
                switch res.success {
                case true :
                    if let arr = res.items {
                        for obj in arr {
                            self.dataSameSource.append(obj)
                        }
                        DispatchQueue.main.async {
                            self.tableTincung.reloadData()
                        }
                    }
                    break;
                case false :
                    print("fail")
                    break;
                default :
                    break
                }
        })
    }
    func callAPITinlienquan(slug : String,page : Int) {
        Service.tinlienquan(
            page : page,
            slug : slug,
            result: { [self] res in
                switch res.success {
                case true :
                    if let arr = res.items {
                        for obj in arr {
                            self.dataTinlienquan.append(obj)
                        }
                        DispatchQueue.main.async {
                            self.tableOther.reloadData()
                        }
                    }
                    break;
                case false :
                    print("fail")
                    break;
                default :
                    break
                }
        })
    }
}
// action
extension DetailNewsVC {
    func changeFont(vc : ModalViewController) {
        vc.changeFontSize(handle: { [self] (size) in
            let defaults = UserDefaults.standard
            defaults.set(size, forKey: "ratio")
            getFontSizeTilte(ratio: size)
        })
    }
    @objc func shareAction(sender : UITapGestureRecognizer) {
        let text = self.data.title
        let myWebsite = NSURL(string: self.data.sourceLink!)
        let shareAll = [text, myWebsite] as [Any]
            let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController, animated: true, completion: nil)
    }
    
//    @objc func hanldeChangeFontSize(sender : UITapGestureRecognizer) {
//        print("heloo")
//    }
    
    @IBAction func handleAddSameSource(_ sender: Any) {
        self.page += 1
        self.heightTableTincung.constant = self.heightTableTincung.constant + CGFloat(self.heightTableView)
        callAPISameSource(slug: self.slug, page: self.page)
    }
    
    @IBAction func clickAddTinlienquan(_ sender: Any) {
        self.pageTinLienquan += 1
        self.heightTinlienquan.constant = self.heightTinlienquan.constant + CGFloat(self.heightTableView)
        callAPITinlienquan(slug: self.slug, page: self.pageTinLienquan)
    }
}



