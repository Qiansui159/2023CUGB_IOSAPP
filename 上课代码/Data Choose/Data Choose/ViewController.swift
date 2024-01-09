//
//  ViewController.swift
//  Data Choose
//
//  Created by Qiansui on 2024/1/7.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var DateOutputLabel: UILabel!
    @IBOutlet weak var ContentOutputLabel: UILabel!
    
    
    func calculateDataDifference(ChosenDate: Date){// 显示日期选择后的结果
        let todayDate: Date = Date()
        let difference: TimeInterval = todayDate.timeIntervalSince(ChosenDate) / 86400
        let dateFormat: DateFormatter = DateFormatter()
        dateFormat.dateFormat = "MMMM d, yyyy hh:mm:ssa"
        
        let todayDateString: String = dateFormat.string(from: todayDate)
        let chosenDateString: String = dateFormat.string(from: ChosenDate)
        let differenceOutput: String = String(format: "Difference between chosen date \(chosenDateString) and today \(todayDateString) in days : \(fabs(difference))")
        
        DateOutputLabel.text = differenceOutput
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

