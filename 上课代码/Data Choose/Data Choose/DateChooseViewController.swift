//
//  DateChooseViewController.swift
//  Data Choose
//
//  Created by Qiansui on 2024/1/7.
//

import UIKit

class DateChooseViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func SetDateTime(_ sender: Any){// 时间选择器触发
        // 两种方式实现设置时间，其实应该点击按钮的时候设置时间的呀
//        (presentingViewController as! ViewController).calculateDataDifference(ChosenDate: (sender as! UIDatePicker).date)
        (presentingViewController as! ViewController).calculateDataDifference(ChosenDate: datePicker.date)
    }
    
    @IBAction func dismissDateChooser(_ sender: Any){// 按钮实现返回 dismiss函数实现模式返回
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.date = Date()// 设置初始时间为当前时间

        // Do any additional setup after loading the view.
    }
}
