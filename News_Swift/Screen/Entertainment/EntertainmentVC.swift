//
//  EntertainmentVC.swift
//  News_Swift
//
//  Created by admin on 6/21/21.
//

import UIKit
import SDWebImage

struct DataItem {
    var title : String;
    var category : String;
    var publishedTime : String;
    var source : String;
    var excerpt : String?;
    var featureImage : String;
    
}
class EntertainmentVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var data : [PostBySourceItemModel] = []
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var time: UILabel!
    var entertaimentModal = EntertainmentMoal()
    var page : Int = 1
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView() // initView
        callAPI(page: 1)
        addRefreshControl()
    }
}
// view
extension EntertainmentVC {
    func initView() {
        location.text = "Hà Nội: 35ºC"
        time.text = "Thứ 5 ngày 03/06/21 (23/04 âm lịch)"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "VerticalItem", bundle: Bundle.main), forCellReuseIdentifier: "VerticalItem")
        tableView.showsVerticalScrollIndicator = false
    }
    func addRefreshControl() {
        refreshControl.tintColor = UIColor.main
        refreshControl.addTarget(self, action: #selector(refreshContents), for: .valueChanged)
        if #available(ios 10.0,*) {
            tableView.refreshControl = refreshControl
        }else {
            tableView.addSubview(refreshControl)
        }
    }
    
    private func footerView() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        let spinner = UIActivityIndicatorView()
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        return footerView
    }
}

// action
extension EntertainmentVC {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        entertaimentModal.handleRow(index : indexPath.row)
        let vc = storyboard?.instantiateViewController(withIdentifier: NibnameIdentifier().DetailNewsVC) as? DetailNewsVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func callAPI(page : Int) {
        Service.entertainment(
            page: page,
            result: { [self] res in
                DispatchQueue.main.async {
                self.tableView.tableFooterView = nil
                }
            if res.success == true {
                if let arr = res.items {
                    for obj in arr {
                        self.data.append(obj)
                    }
                    self.perform(#selector(finishedRefreshing))
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }else {
                print("fail")
            }
        })
    }
    
    @objc func refreshContents() {
        self.data = []
        callAPI(page : 1)
    }
    @objc func finishedRefreshing() {
        refreshControl.endRefreshing()
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (tableView.contentSize.height - 50 - scrollView.frame.size.height) {
            self.tableView.tableFooterView = footerView()
            callAPI(page: self.page + 1)
        }
    }
}

// tableview
extension EntertainmentVC {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VerticalItem", for: indexPath) as! VerticalItem
        let item = data[indexPath.row]
        cell.info.text = "\((item.source?.name)!) •  \("1 giờ trước")"
        cell.describle.text = item.excerpt
        cell.source.text = item.category?.name
        cell.tilteNews.text = item.title
        if let icon = item.featureImage {
            cell.icon.sd_setImage(with: URL(string: icon), completed: nil)
        }
        return cell
    }
}
