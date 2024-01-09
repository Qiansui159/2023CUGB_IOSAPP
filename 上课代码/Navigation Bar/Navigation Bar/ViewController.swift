//
//  ViewController.swift
//  Navigation Bar
//
//  Created by Qiansui on 2024/1/7.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var OutputLabel: UILabel!
    @IBAction func incrementLabel(_ sender: Any){
        (parent as! CountingNavigationController).pushCount += 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        OutputLabel.text = String((parent as! CountingNavigationController).pushCount)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

