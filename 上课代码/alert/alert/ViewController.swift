//
//  ViewController.swift
//  alert
//
//  Created by Qiansui on 2024/1/6.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userOutput: UILabel!
    
    // 第一种方式：弹窗确认式
    @IBAction func doAler(sender: AnyObject){
        let alertController = UIAlertController(title: "Alert Me Button Selected!", message: "I need your attention now", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
    
    // 第二种方式：弹窗多种选择
    @IBAction func doMultiButtonAlert(sender: AnyObject){
        let alertcontroller = UIAlertController(title: "Alert with Buttons Selected", message: "Options are good for all people!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style:.default){
            (alertAction) in
            self.userOutput.text = "OK"
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel){_ in
            self.userOutput.text = "Cancel"
        }
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (action) in self.userOutput.text = "Deleted"
        }
        alertcontroller.addAction(okAction)
        alertcontroller.addAction(cancelAction)
        alertcontroller.addAction(deleteAction)
        present(alertcontroller, animated: true, completion: nil)
    }
    
    // 第三种：需要输入
    @IBAction func doAlertInput(sender: AnyObject){
        let alertController = UIAlertController(title: "Email Address", message: "Please enter your email address below:", preferredStyle: .alert)
        alertController.addTextField(configurationHandler: {
            (textField: UITextField) in
            textField.placeholder = "Emali"
            textField.keyboardType = .emailAddress
        })
        let defaultAction = UIAlertAction(title: "ok", style: .default, handler: {
            (alertAction) in
            let emailAddress: String = alertController.textFields![0].text!
            self.userOutput.text = emailAddress
        })
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
    
    // 第四种：底部弹窗
    @IBAction func doActionSheet(sender: AnyObject){
        let alertController = UIAlertController(title: "Available actions", message: "Choose from the list!", preferredStyle: .actionSheet)
        let negotiateAction = UIAlertAction(title: "Negotiate", style: .default, handler: {
            (alertAction: UIAlertAction) in
            self.userOutput.text = "Negotiate"
        })
        let destroyAction = UIAlertAction(title: "Destroy", style: .default, handler: {
            (alertAction: UIAlertAction) in
            self.userOutput.text = "Destroy"
        })
        alertController.addAction(negotiateAction)
        alertController.addAction(destroyAction)
        if(alertController.popoverPresentationController != nil){// 此代码的作用是面向ipad用户的优化，可以不管
            alertController.popoverPresentationController!.sourceView = sender as! UIButton
            alertController.popoverPresentationController!.sourceRect = (sender as! UIButton).bounds
        }
        present(alertController, animated: true, completion: nil)
    }
    
    /*
     第五种：Play Sound
     第六种：Play Alert Sound
     第七种：Vibrate Device
     这三种详见ppt，暂不摘记
    */
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

