//
//  CountingNavigationController.swift
//  Navigation Bar
//
//  Created by Qiansui on 2024/1/7.
//

import UIKit

class CountingNavigationController: UINavigationController {
    
    var pushCount: Int = 1
    
    override func popViewController(animated: Bool) -> UIViewController? {
        // 重写pop函数使得点击返回按钮时pushCount - 1
        let poppedViewController = super.popViewController(animated: animated)
        if let viewController = poppedViewController as? ViewController {
            pushCount -= 1
        }
        return poppedViewController
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
