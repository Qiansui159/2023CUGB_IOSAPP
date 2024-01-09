//
//  ViewController.swift
//  more_scenes
//
//  Created by Qiansui on 2024/1/6.
//

import UIKit

class Scene2ViewController: UIViewController {
    
    
    @IBOutlet weak var EmailInput: UITextField!
    
    @IBAction func Save(_ sender: Any) {
        (presentingViewController as! ViewController).emailAddress.text = EmailInput.text
    }
    
    override func viewWillAppear(_ animated: Bool) {// 实现当前视图的文本内容与原视图同步
        super.viewWillAppear(animated)
        EmailInput.text = (presentingViewController as? ViewController)?.emailAddress.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

