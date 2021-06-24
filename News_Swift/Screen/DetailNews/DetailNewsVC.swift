//
//  DetailNewsVC.swift
//  News_Swift
//
//  Created by admin on 6/21/21.
//

import UIKit

class DetailNewsVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var icBack: UIImageView!
    @IBOutlet weak var tableOther: UITableView!
    @IBOutlet weak var tableTincung: UITableView!
    @IBOutlet weak var tincung: UIView!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var originNews: UIView!
    var data1 : Array<DataItem> = []
    var data2 : Array<DataItem> = []
    var detailNewsModel = DetailNewsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        originNews.layer.cornerRadius = 4
        icon.layer.cornerRadius = 8
        tableTincung.dataSource = self
        tableTincung.delegate = self
        tableTincung.register(UINib(nibName: NibnameIdentifier().ListHorizontalTableViewCell, bundle: Bundle.main), forCellReuseIdentifier: NibnameIdentifier().ListHorizontalTableViewCell)
        tableTincung.showsVerticalScrollIndicator = false
        tableTincung.isScrollEnabled = false
        tableOther.dataSource = self
        tableOther.delegate = self
        tableOther.register(UINib(nibName: NibnameIdentifier().ListHorizontalTableViewCell, bundle: Bundle.main), forCellReuseIdentifier: NibnameIdentifier().ListHorizontalTableViewCell)
        tableOther.showsVerticalScrollIndicator = false
        tableOther.isScrollEnabled = false
        
        detailNewsModel.setActionImage(icBack: self.icBack)
        detailNewsModel.onClickBack(handle: { [self] () in
            navigationController?.popViewController(animated: true)
        })
        data1 = detailNewsModel.data1
        data2 = detailNewsModel.data2
        tableTincung.reloadData()
        tableOther.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableTincung {
            return data1.count
        }
        return data2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item : DataItem
        if  self.tableTincung == tableView{
            item = data1[indexPath.row] as DataItem
        }else {
            item = data2[indexPath.row] as DataItem
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: NibnameIdentifier().ListHorizontalTableViewCell, for: indexPath) as! ListHorizontalTableViewCell
        
        cell.setItemView(index : indexPath.row,showTitle: false)
        cell.info.text = "\(item.source) •  \("1 giờ trước")"
        cell.category.text = item.category
        cell.titleNews.text = item.title
        cell.icon.sd_setImage(with: URL(string: item.featureImage), completed: nil)
        cell.tilteSlug.text  = "TIN TỨC MỚI NHẤT"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: NibnameIdentifier().DetailNewsVC) as? DetailNewsVC
        self.navigationController?.pushViewController(vc!, animated: true)
//        vc?.idProduct = product[indexPath.row].idPro!
    }
}
