//
//  HeadNewsVC.swift
//  News_Swift
//
//  Created by admin on 6/22/21.
//

import UIKit

class HeadNewsVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    let screenSize = UIScreen.main.bounds.size
    var dataRes : [SourceResItem] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        callAPI()
        // Do any additional setup after loading the view.
//        let testView = TestView(frame: CGRect(x: 20, y: 100, width: screenSize.width - 40, height: 100))
//        testView.btn.setTitle("Heloo", for: .normal)
//        testView.indexSelected = 10
//        testView._settt(index: 990)
//        testView.setttt(handle: { [self] (index : Int) in
//            print("oooo : ",index)
//
//        })
//        self.view.addSubview(testView)
    }
    func initView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
    }
    
    func callAPI() {
        Service.source(
            page: 1,
            result: { res in
            if res.success == true {
                self.dataRes = res.items!
                self.collectionView.reloadData()
            }else {
                print("fail")
            }
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return self.dataRes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        print("helooo")
//            if elementKind == UICollectionView.elementKindSectionFooter {
//                self.loadingView?.activityIndicator.startAnimating()
//            }
        }

        func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath) {
            print("hiii")
//            if elementKind == UICollectionView.elementKindSectionFooter {
//                self.loadingView?.activityIndicator.stopAnimating()
//            }
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NibnameIdentifier().HeadNewsCollectionViewCell, for: indexPath) as! HeadNewsCollectionViewCell
        let item = self.dataRes[indexPath.row]
        cell.txt.text = item.name
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: NibnameIdentifier().DetailHeadNewsVC) as? DetailHeadNewsVC
        self.navigationController?.pushViewController(vc!, animated: true)
        if let id = dataRes[indexPath.row].id {
            vc?.idNews = id
        }
        
    }
}
