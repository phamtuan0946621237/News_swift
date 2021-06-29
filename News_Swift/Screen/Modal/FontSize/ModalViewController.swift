//
//  ModalViewController.swift
//  News_Swift
//
//  Created by admin on 6/27/21.
//

import UIKit

typealias CloseModal = () -> Void
typealias HandleChangeFontSize = (Float) -> Void
class ModalViewController: UIViewController {
    var close : CloseModal!
    var changeFont : HandleChangeFontSize!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var viewwww: UIView!
    @IBOutlet var viewModal: UIView!
    let total: Float = 1.4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    func initView() {
        viewwww.layer.cornerRadius = 16
        slider.maximumValue = total
        slider.minimumValue = 1
        let dismis = UITapGestureRecognizer(target: self, action:  #selector(self.closeModal))
        self.viewModal.addGestureRecognizer(dismis)
        let defaults = UserDefaults.standard
        let ratio = defaults.float(forKey: "ratio")
        slider?.value = ratio != nil ? ratio : 1.0
    }
}

// action
extension ModalViewController {
    @objc func closeModal(sender : UITapGestureRecognizer) {
        close()
    }
    func changeFontSize(handle : @escaping HandleChangeFontSize) {
        self.changeFont = handle
    }
    
    @IBAction func change(_ sender: UISlider) {
        let ratio = round(sender.value * 10)/10
        changeFont(ratio)
    }
    
    func dismisModal(handle : @escaping CloseModal) {
        self.close = handle
    }
}
