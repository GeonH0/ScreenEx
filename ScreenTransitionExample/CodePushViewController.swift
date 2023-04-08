//
//  CodePushViewController.swift
//  ScreenTransitionExample
//
//  Created by 김건호 on 2022/11/28.
//

import UIKit

class CodePushViewController: UIViewController {
    @IBOutlet weak var nameLable: UILabel!
    var name : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name{
            self.nameLable.text=name
            self.nameLable.sizeToFit()
        }

    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    

}
