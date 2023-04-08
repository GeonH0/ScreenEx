//
//  CodePresentViewController.swift
//  ScreenTransitionExample
//
//  Created by 김건호 on 2022/11/30.
//

import UIKit

protocol SendDataDelegeate: AnyObject{
    func sendData(name: String)
}

class CodePresentViewController: UIViewController {

    @IBOutlet weak var nameLable: UILabel!
    var name : String?
    weak var delegate: SendDataDelegeate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name{
            self.nameLable.text = name
            self.nameLable.sizeToFit()
        }

    
    }
    
    @IBAction func tpaBackButton(_ sender: UIButton) {
        self.delegate?.sendData(name: "Carter")
        self.presentingViewController?.dismiss(animated: true,completion: nil)
    }
    
    

}
