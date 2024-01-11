//
//  SelfInfoController.swift
//  PVZ Game
//
//  Created by Qiansui on 2024/1/11.
//

import Foundation
import UIKit

class SelfInfoController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var birthdayPicker: UIDatePicker!
    @IBOutlet weak var age: UITextField!
    
    
    @IBAction func SaveInfo(_ sender: Any) {
        let all = UserManager.shared
        all.userName = userName.text!
        all.age = Int(age.text!)!
        all.birthday = birthdayPicker.date
        dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let all = UserManager.shared
        userName.text = all.userName
        age.text = String(all.age)
        birthdayPicker.date = all.birthday
    }
}
