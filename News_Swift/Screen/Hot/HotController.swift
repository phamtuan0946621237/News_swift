//
//  HotController.swift
//  News_Swift
//
//  Created by admin on 6/21/21.
//

import UIKit

class HotController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate {
    var nibname = NibnameIdentifier()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    let screenSize:CGRect = UIScreen.main.bounds
    var data : [PostBySourceItemModel] = []
    var page : Int = 1
    var refreshControl = UIRefreshControl()
    let date = Date()
    
    @IBOutlet weak var time: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        callAPI(page : 1)
        addRefreshControl()
        // view
        let formate = date.getFormattedDate(format: "EEEE, d MMM, yyyy")
        self.time.text = formate
    }
}

// setup TableView
extension HotController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: nibname.ListVerticalViewCell, bundle: Bundle.main), forCellReuseIdentifier: nibname.ListVerticalViewCell)
        tableView.register(UINib(nibName: nibname.ListHorizontalTableViewCell, bundle: Bundle.main), forCellReuseIdentifier: nibname.ListHorizontalTableViewCell)
        tableView.register(UINib(nibName: nibname.VerticalItem, bundle: Bundle.main), forCellReuseIdentifier: nibname.VerticalItem)
        tableView.register(UINib(nibName: "HorizontalItem", bundle: Bundle.main), forCellReuseIdentifier: "HorizontalItem")
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HorizontalItem", for: indexPath) as! HorizontalItem
        
        if data.count != 0{
            let item = data[indexPath.row]
            
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: nibname.VerticalItem, for: indexPath) as! VerticalItem
            
                cell.info.text = "\(item.source!.name!) •  \("1 giờ trước")"
                cell.describle.text = item.excerpt
                cell.source.text = item.category?.name
            cell.tilteNews.text = item.title
                if let icon = item.featureImage {
                    cell.icon.sd_setImage(with: URL(string: icon), completed: nil)
                }
                return cell
            }
            
            cell.titleNews.text = item.title
            cell.info.text = "\(item.source!.name!) •  \("1 giờ trước")"
            cell.setIndex(index: indexPath.row)
            cell.source.text = item.category?.name
//            cell.source.text = "heloooo"
            if let icon = item.featureImage {
                cell.icon.sd_setImage(with: URL(string: icon), completed: nil)
            }
        }
        
        return cell
    }
}

// view
extension HotController {
    private func footerView() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        let spinner = UIActivityIndicatorView()
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        return footerView
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
}

// action
extension HotController {
    func callAPI(page : Int) {
        Service.hot(
            page: page,
            result: { [self] res in
                DispatchQueue.main.async {
                self.tableView.tableFooterView = nil
                }
                switch res.success {
                    case true :
                        if let arr = res.items {
                            for obj in arr {
                                self.data.append(obj)
                            }
                            self.perform(#selector(finishedRefreshing))
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: nibname.DetailNewsVC) as? DetailNewsVC
        self.navigationController?.pushViewController(vc!, animated: true)
        vc!.slug = data[indexPath.row].slug
//        vc?.idProduct = product[indexPath.row].idPro!
    }
}


extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
