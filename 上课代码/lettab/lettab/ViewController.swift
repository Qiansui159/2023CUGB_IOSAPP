//
//  ViewController.swift
//  lettab
//
//  Created by Qiansui on 2024/1/7.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var barItem: UITabBarItem!
    
    @IBAction func count_first(_ sender: Any){
        (parent as! TabBarController).First += 1
        addBadge()
        updatLabel()
    }
    @IBAction func count_second(_ sender: Any){
        (parent as! TabBarController).Second += 1
        addBadge()
        updatLabel()
    }
    @IBAction func count_third(_ sender: Any){
        (parent as! TabBarController).Third += 1
        addBadge()
        updatLabel()
    }
    @IBAction func reduce_first(){
        // 我在考虑怎么复写这一部分代码使得整体更加简洁
        // 或许在TabBarController里面采用数组表示就可以简洁了
        let temp = parent as! TabBarController
        if(temp.First > 0){
            temp.First -= 1
            if(temp.First == 0){
                barItem.badgeValue = nil
            }else{
                barItem.badgeValue = String(temp.First)
            }
            updatLabel()
        }
    }
    @IBAction func reduce_second(){
        let temp = parent as! TabBarController
        if(temp.Second > 0){
            temp.Second -= 1
            if(temp.Second == 0){
                barItem.badgeValue = nil
            }else{
                barItem.badgeValue = String(temp.Second)
            }
            updatLabel()
        }
    }
    @IBAction func reduce_third(){
        let temp = parent as! TabBarController
        if(temp.Third > 0){
            temp.Third -= 1
            if(temp.Third == 0){
                barItem.badgeValue = nil
            }else{
                barItem.badgeValue = String(temp.Third)
            }
            updatLabel()
        }
    }
    
    func updatLabel(){
        let first = (parent as! TabBarController).First
        let second = (parent as! TabBarController).Second
        let third = (parent as! TabBarController).Third
        countLabel.text = String("First: \(first)\nSecond: \(second)\nThird: \(third)")
    }
    
    func addBadge(){
        var badgeCount: Int
        if(barItem.badgeValue != nil){
            badgeCount = Int(barItem.badgeValue!)!
            badgeCount += 1
            barItem.badgeValue = String(badgeCount)
        }else{
            barItem.badgeValue = "1"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // 该方法在视图控制器的视图即将显示在屏幕上之前调用。
        updatLabel()
    }

    override func viewDidLoad() {
        // 该方法在视图控制器的视图加载到内存后调用，但尚未显示在屏幕上。
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

