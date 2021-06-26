//
//  DetailHeadNewsVC.swift
//  News_Swift
//
//  Created by admin on 6/22/21.
//

import UIKit

class DetailHeadNewsVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var data : [PostBySourceItemModel] = []
    var idNews : Int = 0
    var page : Int = 1
    var refreshControl = UIRefreshControl()
    var source : String!
    @IBAction func clickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var titlePage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        self.titlePage.text = self.source
        callAPI(source : idNews,page: 1)
        addRefreshControl()
    }
}

// setup Tableview
extension DetailHeadNewsVC {
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: NibnameIdentifier().VerticalItem, bundle: Bundle.main), forCellReuseIdentifier: NibnameIdentifier().VerticalItem)
        tableView.showsVerticalScrollIndicator = false
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NibnameIdentifier().VerticalItem, for: indexPath) as! VerticalItem
        let item = data[indexPath.row]
        cell.info.text = "\(item.source!.name!) •  \("1 giờ trước")"
        cell.describle.text = item.excerpt
        cell.source.text = item.category?.name
        cell.marginTopDescrible.constant = item.excerpt == "" || item.excerpt == nil ? 0 : 14
        cell.tilteNews.text = item.title
        if let icon = item.featureImage {
            cell.icon.sd_setImage(with: URL(string: icon), completed: nil)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: NibnameIdentifier().DetailNewsVC) as? DetailNewsVC
        self.navigationController?.pushViewController(vc!, animated: true)
        vc!.slug = data[indexPath.row].slug
        print("index :",indexPath.row)
    }
}

// action
extension DetailHeadNewsVC {
    func callAPI(source : Int,page : Int) {
        Service.detailHeadNews(
            page: page,
            source: source ,
            result: { [self] res in
                DispatchQueue.main.async {
                self.tableView.tableFooterView = nil
                }
                switch res.success {
                case true :
                    if let item = res.items {
                        for obj in item {
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
        callAPI(source : idNews,page: 1)
    }
    @objc func finishedRefreshing() {
        refreshControl.endRefreshing()
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (tableView.contentSize.height - 50 - scrollView.frame.size.height) {
            self.tableView.tableFooterView = footerView()
            callAPI(source : idNews,page: self.page + 1)
        }
    }
}

// view
extension DetailHeadNewsVC {
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
