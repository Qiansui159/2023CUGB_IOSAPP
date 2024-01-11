//
//  HomePageManager.swift
//  PVZ Game
//
//  Created by Qiansui on 2024/1/10.
//

import UIKit

class HomePageManager: UIViewController {
    
    @IBOutlet weak var PictureShow: UIImageView!

    
    @IBAction func ExitToHere(sender: UIStoryboardSegue){
        // nothing here
    }
    
    func PictureShowInit(_ state: Bool){
        if(state){
            let parentTabBarController = parent as! TabBarController
            PictureShow.animationImages = parentTabBarController.plants.map{$0.2} + parentTabBarController.zombies.map{$0.1}
            
            PictureShow.animationDuration = TimeInterval(parentTabBarController.plants.map{$0.2}.count + parentTabBarController.zombies.map{$0.1}.count)
            
            PictureShow.startAnimating()
        }else{
            PictureShow.stopAnimating()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        PictureShowInit(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        PictureShowInit(false)
    }
}
