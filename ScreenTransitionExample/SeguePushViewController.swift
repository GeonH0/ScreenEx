//
//  SeguePushViewController.swift
//  ScreenTransitionExample
//
//  Created by 김건호 on 2022/11/16.
//

import UIKit

class SeguePushViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name{
            self.nameLabel.text=name
            self.nameLabel.sizeToFit()
        }

    
    }
    

    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
    }
    

}
