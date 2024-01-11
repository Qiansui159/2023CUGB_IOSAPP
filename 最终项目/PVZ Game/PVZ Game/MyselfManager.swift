//
//  ViewController.swift
//  PVZ Game
//
//  Created by Qiansui on 2024/1/10.
//

import UIKit

class MyselfManager: UIViewController {
    
    @IBOutlet weak var HelloLabel: UILabel!
    @IBOutlet weak var CountPictureToSentence: UILabel!
    @IBOutlet weak var SunImageView: UIImageView!
    
    func SunImageViewInit(_ state: Bool){
        if(state){
            let sunPictures: [UIImage] = [
                UIImage(named: "Sun1")!,
                UIImage(named: "Sun2")!,
                UIImage(named: "Sun3")!
            ]
            SunImageView.animationImages = sunPictures
            SunImageView.animationDuration = Double(sunPictures.count) / 2.0
            SunImageView.startAnimating()
        }else{
            SunImageView.stopAnimating()
        }
    }
    
    @IBAction func ExitToMyselfManager(sender: UIStoryboardSegue){
        //
        
        viewWillAppear(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let all = UserManager.shared
        HelloLabel.text = "Hello!\n\(all.userName)~"
        CountPictureToSentence.text = "看图选描述正确次数：" + String(all.gamePictureToSentenceCount) + " 次"
        SunImageViewInit(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        SunImageViewInit(false)
    }
}
