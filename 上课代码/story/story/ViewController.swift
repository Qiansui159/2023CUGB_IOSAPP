//
//  ViewController.swift
//  story
//
//  Created by Qiansui on 2024/1/6.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var verb: UITextField!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var place: UITextField!
    @IBOutlet weak var theTemplate: UILabel!
    @IBOutlet weak var theStory: UILabel!
    @IBAction func replace(_ sender: Any){
        theStory.text = theTemplate.text
        theStory.text = theStory.text?.replacingOccurrences(of: "<verb>", with: verb.text!)
        theStory.text = theStory.text?.replacingOccurrences(of: "<number>", with: number.text!)
        theStory.text = theStory.text?.replacingOccurrences(of: "<place>", with: place.text!)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

