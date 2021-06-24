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
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: NibnameIdentifier().ListVerticalViewCell, bundle: Bundle.main), forCellReuseIdentifier: NibnameIdentifier().ListVerticalViewCell)
        tableView.showsVerticalScrollIndicator = false
//        print("idNews : ",self.idNews)
        callAPI(source : idNews)
    }
    func callAPI(source : Int) {
        Service.detailHeadNews(
            page: 1,
            source: source ,
            result: { res in
            if res.success == true {
                if let item = res.items {
                    self.data = item
                    self.tableView.reloadData()
                }
            }else {
                print("fail")
            }
        })
    }
    
}

extension DetailHeadNewsVC {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NibnameIdentifier().ListVerticalViewCell, for: indexPath) as! ListVerticalViewCell
        let item = data[indexPath.row]
        cell.info.text = "\(item.source!.name!) •  \("1 giờ trước")"
        cell.describle.text = ""
        cell.source.text = item.category?.name
        cell.sourceTitle.text = item.title
        cell.marginTopDescrible.constant = cell.describle.text == "" || cell.describle.text == nil ? 0 : 14
        cell.heightView.constant = cell.describle.text == "" || cell.describle.text == nil ? 320 : 415
        cell.icon.sd_setImage(with: URL(string: item.featureImage!), completed: nil)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("index :",indexPath.row)
    }
}
