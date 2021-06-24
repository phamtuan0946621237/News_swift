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
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var time: UILabel!
    var entertaimentModal = EntertainmentMoal()
    var data : Array<DataItem> = []
    override func viewDidLoad() {
        super.viewDidLoad()
        data = entertaimentModal.data // getData
        initView() // initView
    }
    
    func initView() {
        location.text = "Hà Nội: 35ºC"
        time.text = "Thứ 5 ngày 03/06/21 (23/04 âm lịch)"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: NibnameIdentifier().ListVerticalViewCell, bundle: Bundle.main), forCellReuseIdentifier: NibnameIdentifier().ListVerticalViewCell)
        tableView.showsVerticalScrollIndicator = false
    }
}

extension EntertainmentVC {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NibnameIdentifier().ListVerticalViewCell, for: indexPath) as! ListVerticalViewCell
        let item = data[indexPath.row] as DataItem
        cell.info.text = "\(item.source) •  \("1 giờ trước")"
        cell.describle.text = ""
        if let ex = item.excerpt {
            cell.excerpt = ex
        }
        
        cell.source.text = item.category
        cell.sourceTitle.text = item.title
        cell.marginTopDescrible.constant = item.excerpt == "" || item.excerpt == nil ? 0 : 14
//        cell.heightView.constant = item.excerpt == "" || item.excerpt == nil ? 315 : 415
        cell.icon.sd_setImage(with: URL(string: item.featureImage), completed: nil)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        entertaimentModal.handleRow(index : indexPath.row)
        let vc = storyboard?.instantiateViewController(withIdentifier: NibnameIdentifier().DetailNewsVC) as? DetailNewsVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let lastElement = dataSource.count - 1
        print("111111")
    }
}
