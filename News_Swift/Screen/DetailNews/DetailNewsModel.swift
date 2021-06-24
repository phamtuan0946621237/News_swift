//
//  DetailNewsModel.swift
//  News_Swift
//
//  Created by admin on 6/22/21.
//

import UIKit
typealias HanldeBackPage = () -> ()
class DetailNewsModel: UIView {
    var handleBack : HanldeBackPage!
    func setActionImage(icBack : UIImageView) {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        icBack.isUserInteractionEnabled = true
        icBack.addGestureRecognizer(tapGestureRecognizer)
    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        handleBack()
    }
    
    func onClickBack(handle : @escaping HanldeBackPage) {
        handleBack = handle
    }
    
    let data1 : Array<DataItem> = [
        DataItem(title: "Quy định về thời hạn giữ chức vụ lãnh đạo đối với công chức", category: "Pháp luật", publishedTime: "2021-06-20T19:02:00.000Z", source: "baochinhphu.vn", excerpt: nil,featureImage : "https://storage.googleapis.com/newsapp/files/may/img/e8913678-f356-46bd-bcdd-12db4b9c4a96_1624243456254.jpg" ),
        DataItem(title: "Quy định về thời hạn giữ chức vụ lãnh đạo đối với công chức", category: "Pháp luật", publishedTime: "2021-06-20T19:02:00.000Z", source: "baochinhphu.vn", excerpt: "Nhiều năm qua, Báo Công an TPHCM góp phần thúc đẩy phong trào toàn dân bảo vệ an ninh Tổ quốc thông qua việc người dân tích cực tham gia tố giác tội phạm đến cơ quan công an.",featureImage : "https://storage.googleapis.com/newsapp/files/may/img/e8913678-f356-46bd-bcdd-12db4b9c4a96_1624243456254.jpg" ),
        DataItem(title: "Quy định về thời hạn giữ chức vụ lãnh đạo đối với công chức", category: "Pháp luật", publishedTime: "2021-06-20T19:02:00.000Z", source: "baochinhphu.vn", excerpt: "Nhiều năm qua, Báo Công an TPHCM góp phần thúc đẩy phong trào toàn dân bảo vệ an ninh Tổ quốc thông qua việc người dân tích cực tham gia tố giác tội phạm đến cơ quan công an.",featureImage : "https://storage.googleapis.com/newsapp/files/may/img/e8913678-f356-46bd-bcdd-12db4b9c4a96_1624243456254.jpg" ),
        DataItem(title: "Quy định về thời hạn giữ chức vụ lãnh đạo đối với công chức", category: "Pháp luật", publishedTime: "2021-06-20T19:02:00.000Z", source: "baochinhphu.vn", excerpt: "Nhiều năm qua, Báo Công an TPHCM góp phần thúc đẩy phong trào toàn dân bảo vệ an ninh Tổ quốc thông qua việc người dân tích cực tham gia tố giác tội phạm đến cơ quan công an.",featureImage : "https://storage.googleapis.com/newsapp/files/may/img/e8913678-f356-46bd-bcdd-12db4b9c4a96_1624243456254.jpg" ),
        DataItem(title: "Quy định về thời hạn giữ chức vụ lãnh đạo đối với công chức", category: "Pháp luật", publishedTime: "2021-06-20T19:02:00.000Z", source: "baochinhphu.vn", excerpt: "Nhiều năm qua, Báo Công an TPHCM góp phần thúc đẩy phong trào toàn dân bảo vệ an ninh Tổ quốc thông qua việc người dân tích cực tham gia tố giác tội phạm đến cơ quan công an.",featureImage : "https://storage.googleapis.com/newsapp/files/may/img/e8913678-f356-46bd-bcdd-12db4b9c4a96_1624243456254.jpg" ),
        
        ]
    let data2 : Array<DataItem> = [
        DataItem(title: "Quy định về thời hạn giữ chức vụ lãnh đạo đối với công chức", category: "Pháp luật", publishedTime: "2021-06-20T19:02:00.000Z", source: "baochinhphu.vn", excerpt: nil,featureImage : "https://storage.googleapis.com/newsapp/files/may/img/e8913678-f356-46bd-bcdd-12db4b9c4a96_1624243456254.jpg" ),
        DataItem(title: "Quy định về thời hạn giữ chức vụ lãnh đạo đối với công chức", category: "Pháp luật", publishedTime: "2021-06-20T19:02:00.000Z", source: "baochinhphu.vn", excerpt: "Nhiều năm qua, Báo Công an TPHCM góp phần thúc đẩy phong trào toàn dân bảo vệ an ninh Tổ quốc thông qua việc người dân tích cực tham gia tố giác tội phạm đến cơ quan công an.",featureImage : "https://storage.googleapis.com/newsapp/files/may/img/e8913678-f356-46bd-bcdd-12db4b9c4a96_1624243456254.jpg" ),
        DataItem(title: "Quy định về thời hạn giữ chức vụ lãnh đạo đối với công chức", category: "Pháp luật", publishedTime: "2021-06-20T19:02:00.000Z", source: "baochinhphu.vn", excerpt: "Nhiều năm qua, Báo Công an TPHCM góp phần thúc đẩy phong trào toàn dân bảo vệ an ninh Tổ quốc thông qua việc người dân tích cực tham gia tố giác tội phạm đến cơ quan công an.",featureImage : "https://storage.googleapis.com/newsapp/files/may/img/e8913678-f356-46bd-bcdd-12db4b9c4a96_1624243456254.jpg" ),
        DataItem(title: "Quy định về thời hạn giữ chức vụ lãnh đạo đối với công chức", category: "Pháp luật", publishedTime: "2021-06-20T19:02:00.000Z", source: "baochinhphu.vn", excerpt: "Nhiều năm qua, Báo Công an TPHCM góp phần thúc đẩy phong trào toàn dân bảo vệ an ninh Tổ quốc thông qua việc người dân tích cực tham gia tố giác tội phạm đến cơ quan công an.",featureImage : "https://storage.googleapis.com/newsapp/files/may/img/e8913678-f356-46bd-bcdd-12db4b9c4a96_1624243456254.jpg" ),
        DataItem(title: "Quy định về thời hạn giữ chức vụ lãnh đạo đối với công chức", category: "Pháp luật", publishedTime: "2021-06-20T19:02:00.000Z", source: "baochinhphu.vn", excerpt: "Nhiều năm qua, Báo Công an TPHCM góp phần thúc đẩy phong trào toàn dân bảo vệ an ninh Tổ quốc thông qua việc người dân tích cực tham gia tố giác tội phạm đến cơ quan công an.",featureImage : "https://storage.googleapis.com/newsapp/files/may/img/e8913678-f356-46bd-bcdd-12db4b9c4a96_1624243456254.jpg" ),
        
        ]
    

}
