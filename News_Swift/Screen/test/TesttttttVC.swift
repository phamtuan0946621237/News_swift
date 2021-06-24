//
//  TesttttttVC.swift
//  News_Swift
//
//  Created by admin on 6/24/21.
//

import UIKit
struct Dataaaaa {
    var title : String
    var value : String
}
class TesttttttVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
//    let data1 = "Từ địa phương vươn ra thế giới: Roh, Ghost Lab và loạt phim Đông Nam Á sắp góp mặt trên Netflix"
//    let data2 = "let data1 = Từ địa phương vươn ra thế giới: Roh, Ghost Lab và loạt phim Đông Nam Á sắp góp mặt trên Netflix"
//    let data3 = "Trước đây, những bộ phim hoặc chương trình truyền hình của Đông Nam Á thường ít được phát hành trên các sân chơi quốc tế. Tuy nhiên vừa qua, cơn sốt Cô gái đến từ hư vô đã khiến những tác phẩm được sản xuất tại các quốc gia Đông Nam Á nhận được chú ý nhiều hơn bao giờ hết đối với khán giả quốc tế. Gần đây, nhiều tác phẩm chất lượng thuộc nhiều thể loại phong phú được sản xuất bởi các nhà làm phim Đông Nam Á đã “dắt tay” nhau góp mặt trên Netflix. Những bộ phim này đem đến cho người xem những câu chuyện đặc sắc, giàu văn hóa bản địa đến từ Malaysia, Indonesia, Thái Lan, Philippines và Việt Nam."
//    var data : Array<String> = []
    
    var data : Array<Dataaaaa> = [
        Dataaaaa(title: "Từ địa phương vươn ra thế giới: Roh, Ghost Lab và loạt phim Đông Nam Á sắp góp mặt trên Netflix", value: "Từ địa phương vươn ra thế giới: Roh, Ghost Lab và loạt phim Đông Nam Á sắp góp mặt trên Netflix"),
        Dataaaaa(title: "Từ địa phương vươn ra thế giới: Roh, Ghost Lab và loạt phim Đông Nam Á sắp góp mặt trên Netflix let data1 = Từ địa phương vươn ra thế giới: Roh, Ghost Lab và loạt phim Đông Nam Á sắp góp mặt trên NetflixTừ địa phương vươn ra thế giới: Roh, Ghost Lab và loạt phim Đông Nam Á sắp góp mặt trên Netflix let data1 = Từ địa phương vươn ra thế giới: Roh, Ghost Lab và loạt phim Đông Nam Á sắp góp mặt trên Netflix", value: "Từ địa phương vươn ra thế giới: Roh, Ghost Lab và loạt phim Đông Nam Á sắp góp mặt trên Netflix let data1 = Từ địa phương vươn ra thế giới: Roh, Ghost Lab và loạt phim Đông Nam Á sắp góp mặt trên Netflix"),
        Dataaaaa(
            title: "Trước đây, những bộ phim hoặc chương trình truyền hình của Đông Nam Á thường ít được phát hành trên các sân chơi quốc tế. Tuy nhiên vừa qua, cơn sốt Cô gái đến từ hư vô đã khiến những tác phẩm được sản xuất tại các quốc gia Đông Nam Á nhận được chú ý nhiều hơn bao giờ hết đối với khán giả quốc tế. Gần đây, nhiều tác phẩm chất lượng thuộc nhiều thể loại phong phú được sản xuất bởi các nhà làm phim Đông Nam Á đã “dắt tay” nhau góp mặt trên Netflix. Những bộ phim này đem đến cho người xem những câu chuyện đặc sắc, giàu văn hóa bản địa đến từ Malaysia, Indonesia, Thái Lan, Philippines và Việt Nam.",
            value: "Trước đây, những bộ phim hoặc chương trình truyền hình của Đông Nam Á thường ít được phát hành trên các sân chơi quốc tế. Tuy nhiên vừa qua, cơn sốt Cô gái đến từ hư vô đã khiến những tác phẩm được sản xuất tại các quốc gia Đông Nam Á nhận được chú ý nhiều hơn bao giờ hết đối với khán giả quốc tế. Gần đây, nhiều tác phẩm chất lượng thuộc nhiều thể loại phong phú được sản xuất bởi các nhà làm phim Đông Nam Á đã “dắt tay” nhau góp mặt trên Netflix. Những bộ phim này đem đến cho người xem những câu chuyện đặc sắc, giàu văn hóa bản địa đến từ Malaysia, Indonesia, Thái Lan, Philippines và Việt Nam."
        )
    ]

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestTBVC", for: indexPath) as! TestTBVC
        cell.texttt.text = data[indexPath.row].value
        cell.tilteeeee.text = data[indexPath.row].title
        return cell
    }
}
