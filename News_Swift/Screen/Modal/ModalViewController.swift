//
//  ModalViewController.swift
//  News_Swift
//
//  Created by admin on 6/27/21.
//

import UIKit
typealias CloseModal = () -> Void
class ModalViewController: UIViewController {
    var close : CloseModal!
    @IBOutlet weak var viewwww: UIView!
    @IBOutlet var viewModal: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewwww.layer.cornerRadius = 16
//        viewModal.backgroundColor = UIColor(red: 12/255, green: 13/255, blue: 14/255, alpha: 0.5)

        let dismis = UITapGestureRecognizer(target: self, action:  #selector(self.closeModal))
        self.viewModal.addGestureRecognizer(dismis)
        // Do any additional setup after loading the view.
    }
    @objc func closeModal(sender : UITapGestureRecognizer) {
        close()
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
     
     */
//    @IBAction func handleDismisModal(_ sender: UIButton) {
//        close()
//    }
    func dismisModal(handle : @escaping CloseModal) {
        self.close = handle
    }
}
