//
//  ViewController.swift
//  Running~
//
//  Created by Qiansui on 2023/10/12.
//

import UIKit

class ViewController: UIViewController {
    
    //定义输出口
    @IBOutlet weak var view1: UIImageView!
    @IBOutlet weak var view2: UIImageView!
    @IBOutlet weak var view3: UIImageView!
    @IBOutlet weak var speedlider: UISlider!
    @IBOutlet weak var speedsetpper: UIStepper!
    @IBOutlet weak var togglebutton: UIButton!
    @IBOutlet weak var hopspresecond: UILabel!
    
    //切换动画状态
    @IBAction func toggleAnimation(_ sender: Any){
        if(view1.isAnimating){
            view1.stopAnimating()
            view2.stopAnimating()
            view3.stopAnimating()
            togglebutton.setTitle("Hops!", for: .normal)
        }else{
            view1.startAnimating()
            view2.startAnimating()
            view3.startAnimating()
            togglebutton.setTitle("Set still!", for: .normal)
        }
    }
    
    //设置速度
    @IBAction func setspeed(_ sender: Any?){
        // 保存当前动画状态
        let isAnimating = view1.isAnimating
        view1.animationDuration = TimeInterval(2.0 - speedlider.value)
        view2.animationDuration = TimeInterval(2.0 - speedlider.value)
        view3.animationDuration = TimeInterval(2.0 - speedlider.value)
        speedsetpper.value = Double(speedlider.value)
        let hopRateString = String(format: "%1.2f hps", 1 / (2.0 - self.speedlider.value))
        hopspresecond.text = hopRateString
        // 恢复原有的动画状态
        if isAnimating {
            view1.startAnimating()
            view2.startAnimating()
            view3.startAnimating()
        } else {
            view1.stopAnimating()
            view2.stopAnimating()
            view3.stopAnimating()
        }
    }
    @IBAction func incrementspeed(_ sender: Any){
        speedlider.value = Float(speedsetpper.value)
        setspeed(nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let hopsanimation: [UIImage] = [
            UIImage(named: "p1")!,
            UIImage(named: "p2")!,
            UIImage(named: "p3")!,
            UIImage(named: "p4")!,
            UIImage(named: "p5")!
        ]
        
        // 第一个视图从第一张图片开始播放
        view1.animationImages = hopsanimation
        // 第二个视图从第二张图片开始播放
        view2.animationImages = Array(hopsanimation.suffix(4) + hopsanimation.prefix(1))
        // 第三个视图从第三张图片开始播放
        view3.animationImages = Array(hopsanimation.suffix(3) + hopsanimation.prefix(2))
        let animationDuration:Double = 1.0
        view1.animationDuration = animationDuration
        view2.animationDuration = animationDuration
        view3.animationDuration = animationDuration
        speedsetpper.value = 1.0
        // Do any additional setup after loading the view.
    }
    


}

