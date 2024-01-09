//
//  ViewController.swift
//  string a + b
//
//  Created by Qiansui on 2023/10/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var String1: UITextField!
    @IBOutlet weak var String2: UITextField!
    @IBOutlet weak var Output: UILabel!
    
    @IBAction func ConnectString(_ sender: Any) {
        Output.text = String1.text! + String2.text!
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

