//
//  NewsRetageVC.swift
//  News_Swift
//
//  Created by admin on 6/21/21.
//

import UIKit

class NewsRetageVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "ListHorizontalTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "ListHorizontalTableViewCell")
        tableView.showsVerticalScrollIndicator = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListHorizontalTableViewCell", for: indexPath) as! ListHorizontalTableViewCell
        let item = data[indexPath.row] as DataItem
        cell.setItemView(index : indexPath.row)
        cell.info.text = "\(item.source) •  \("1 giờ trước")"
        cell.category.text = item.category
        cell.titleNews.text = item.title
        cell.icon.sd_setImage(with: URL(string: item.featureImage), completed: nil)
        cell.tilteSlug.text  = "TIN TỨC MỚI NHẤT"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailNewsVC") as? DetailNewsVC
        self.navigationController?.pushViewController(vc!, animated: true)
//        vc?.idProduct = product[indexPath.row].idPro!
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    let data : Array<DataItem> = [
        DataItem(title: "Quy định về thời hạn giữ chức vụ lãnh đạo đối với công chức", category: "Pháp luật", publishedTime: "2021-06-20T19:02:00.000Z", source: "baochinhphu.vn", excerpt: nil,featureImage : "https://storage.googleapis.com/newsapp/files/may/img/e8913678-f356-46bd-bcdd-12db4b9c4a96_1624243456254.jpg" ),
        DataItem(title: "Quy định về thời hạn giữ chức vụ lãnh đạo đối với công chức", category: "Pháp luật", publishedTime: "2021-06-20T19:02:00.000Z", source: "baochinhphu.vn", excerpt: "Nhiều năm qua, Báo Công an TPHCM góp phần thúc đẩy phong trào toàn dân bảo vệ an ninh Tổ quốc thông qua việc người dân tích cực tham gia tố giác tội phạm đến cơ quan công an.",featureImage : "https://storage.googleapis.com/newsapp/files/may/img/e8913678-f356-46bd-bcdd-12db4b9c4a96_1624243456254.jpg" ),
        DataItem(title: "Quy định về thời hạn giữ chức vụ lãnh đạo đối với công chức", category: "Pháp luật", publishedTime: "2021-06-20T19:02:00.000Z", source: "baochinhphu.vn", excerpt: "Nhiều năm qua, Báo Công an TPHCM góp phần thúc đẩy phong trào toàn dân bảo vệ an ninh Tổ quốc thông qua việc người dân tích cực tham gia tố giác tội phạm đến cơ quan công an.",featureImage : "https://storage.googleapis.com/newsapp/files/may/img/e8913678-f356-46bd-bcdd-12db4b9c4a96_1624243456254.jpg" ),
        DataItem(title: "Quy định về thời hạn giữ chức vụ lãnh đạo đối với công chức", category: "Pháp luật", publishedTime: "2021-06-20T19:02:00.000Z", source: "baochinhphu.vn", excerpt: "Nhiều năm qua, Báo Công an TPHCM góp phần thúc đẩy phong trào toàn dân bảo vệ an ninh Tổ quốc thông qua việc người dân tích cực tham gia tố giác tội phạm đến cơ quan công an.",featureImage : "https://storage.googleapis.com/newsapp/files/may/img/e8913678-f356-46bd-bcdd-12db4b9c4a96_1624243456254.jpg" ),
        ]

}
