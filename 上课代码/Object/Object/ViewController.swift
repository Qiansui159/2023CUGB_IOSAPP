//
//  ViewController.swift
//  Object
//
//  Created by Qiansui on 2024/1/8.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorChoice: UISegmentedControl!
    @IBOutlet weak var flowerView: UIWebView!
    @IBOutlet weak var flowerDetailView: UIWebView!
    // 'UIWebView' was deprecated in iOS 12.0: No longer supported; please adopt WKWebView.
    
    @IBAction func getFlower(_ sender: Any) {
        var imageURL: NSURL
//        var detailURL: NSURL
        var imageURLString: String
//        var detailURLString: String
        var color: String
        color = colorChoice.titleForSegment(at: colorChoice.selectedSegmentIndex)!
        if(color == "Red"){// 网址这里需要自己写
            imageURLString = "https://s2.loli.net/2024/01/09/ps7nlUKj6dNxMPf.png"
        }else if(color == "Blue"){
            imageURLString = "https://s2.loli.net/2024/01/09/Ctdaeu8UJiPZIkh.png"
        }else if(color == "Green"){
            imageURLString = "https://s2.loli.net/2024/01/09/y5TAXlR14LZFeti.png"
        }else{
            imageURLString = "https://s2.loli.net/2024/01/09/mW1NPrdjnUySlV2.png"
        }
        
        imageURL = NSURL(string: imageURLString)!
        flowerView.loadRequest(NSURLRequest(url: imageURL as URL) as URLRequest)
        
//        detailURLString = "https://teachyourselfios.info/?hour=9&session=\(sessionID)&type=detail"
//        detailURL = NSURL(string: detailURLString)!
//        flowerDetailView.loadRequest(NSURLRequest(url: detailURL as URL) as URLRequest)
    }
    
    
    @IBAction func toggleFlowerDetail(_ sender: Any) {
        flowerDetailView.isHidden = (sender as! UISwitch).isHidden
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

