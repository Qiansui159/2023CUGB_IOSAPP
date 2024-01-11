//
//  Game_PictureToSentence.swift
//  PVZ Game
//
//  Created by Qiansui on 2024/1/11.
//

import Foundation
import UIKit

class Game_PictureToSentence: UIViewController {
    
    
    @IBOutlet weak var Picture: UIImageView!
    @IBOutlet var Buttons: [UIButton] = []
    var Names: [String] = [], Images: [UIImage] = [], Sentences: [String] = []
    var AnswerTag: Int = 0
    
    
    @IBAction func ChooseSentence(_ sender: Any) {
        let button = (sender as! UIButton)
        var MessageString: String, update: Bool
        if(button.tag == AnswerTag){
            MessageString = "恭喜您，选择正确！！！"
            update = true
            let all = UserManager.shared
            all.gamePictureToSentenceCount = all.gamePictureToSentenceCount + 1
        }else{
            MessageString = "再想一想～"
            update = false
        }
        
        let alertController = UIAlertController(title: "", message: "", preferredStyle: .alert)
        // 创建一个属性字符串，用于设置文本样式
        let attributedTitle = NSAttributedString(string: "提示", attributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)
        ])// 设置标题字体大小
        alertController.setValue(attributedTitle, forKey: "attributedTitle")
        let attributedMessage = NSAttributedString(string: MessageString, attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)
        ]) // 设置消息字体大小
        alertController.setValue(attributedMessage, forKey: "attributedMessage")
        
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: {_ in
            if(update){
                self.SetButtonsTitle()
            }
        })
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    
    func SetButtonsTitle(){
        var randomNumbers = [Int]()
        let range = 0...(Names.count - 1) // 范围
        while randomNumbers.count < 4 {
            let randomNumber = Int.random(in: range)
            if !randomNumbers.contains(randomNumber) {
                randomNumbers.append(randomNumber)
            }
        }
        
        for i in 0...3 {
            Buttons[i].titleLabel?.numberOfLines = 0
            Buttons[i].titleLabel?.textAlignment = .center
            Buttons[i].titleLabel?.textColor = UIColor.blue
            Buttons[i].titleLabel?.font = UIFont(name: "Helvetica", size: 19)
            Buttons[i].layer.borderWidth = 1.0
            Buttons[i].layer.borderColor = UIColor.blue.cgColor
            Buttons[i].layer.cornerRadius = 10.0
            Buttons[i].layer.masksToBounds = true
            Buttons[i].setTitle(Sentences[randomNumbers[i]], for: .normal)
        }
        AnswerTag = Int.random(in: 1...4)
        Picture.image = Images[randomNumbers[AnswerTag - 1]]
    }
    
    func Init(){
        let parentTabBarController = TabBarController.shared
        Names = parentTabBarController.plants.map{$0.0} + parentTabBarController.zombies.map{$0.0}
        Images = parentTabBarController.plants.map{$0.2} + parentTabBarController.zombies.map{$0.1}
        Sentences = parentTabBarController.plants.map{$0.3} + parentTabBarController.zombies.map{$0.2}
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Init()
        SetButtonsTitle()
    }
}
