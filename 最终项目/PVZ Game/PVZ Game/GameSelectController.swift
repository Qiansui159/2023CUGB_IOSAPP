//
//  GameSelectController.swift
//  PVZ Game
//
//  Created by Qiansui on 2024/1/11.
//

import Foundation
import UIKit

class GameSelectController: UIViewController{
    
    @IBOutlet weak var PictureToSentence: UIButton!
    
    
    @IBAction func PictureToSentenceExit(sender: UIStoryboardSegue){
        // nothing here
    }


    
    func PictureToSentenceInit(){
        PictureToSentence.layer.borderWidth = 1.0
        PictureToSentence.layer.borderColor = UIColor.red.cgColor
        PictureToSentence.layer.cornerRadius = 10.0
        PictureToSentence.layer.masksToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        PictureToSentenceInit()
    }
}
