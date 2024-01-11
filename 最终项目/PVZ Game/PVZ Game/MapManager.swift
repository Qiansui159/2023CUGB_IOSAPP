//
//  StoreManager.swift
//  PVZ Game
//
//  Created by Qiansui on 2024/1/10.
//

import UIKit

class MapManager: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var Choice: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func UpdateTabView(_ sender: Any) {
        tableView.reloadData()
    }

    var plantsName: [String] = [""]
    var zombiesName: [String] = [""]


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let choiceString: String! = Choice.titleForSegment(at: Choice.selectedSegmentIndex)!
        if(choiceString == "Plants"){
            return plantsName.count
        }else{
            return zombiesName.count
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Choice.titleForSegment(at: Choice.selectedSegmentIndex)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "modelcell")! as UITableViewCell
        let choiceString: String! = Choice.titleForSegment(at: Choice.selectedSegmentIndex)
        if(choiceString == "Plants"){
            cell.textLabel?.text = plantsName[indexPath.row]
        }else{
            cell.textLabel?.text = zombiesName[indexPath.row]
        }
        cell.imageView!.image = UIImage(named: cell.textLabel!.text!)!
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var Name:String, Sentence: String
        let choiceString: String! = Choice.titleForSegment(at: Choice.selectedSegmentIndex)
        if(choiceString == "Plants"){
            Name = plantsName[indexPath.row]
            Sentence = String("阳光花费: ") + String((parent as! TabBarController).plants.map{$0.1}[indexPath.row]) + String("\n") +  (parent as! TabBarController).plants.map{$0.3}[indexPath.row]
        }else{
            Name = zombiesName[indexPath.row]
            Sentence = (parent as! TabBarController).zombies.map{$0.2}[indexPath.row]
        }
        
        let alertController: UIAlertController = UIAlertController(title: Name, message: Sentence, preferredStyle: UIAlertController.Style.alert)
        
        // 创建一个属性字符串，用于设置文本样式
        let attributedTitle = NSAttributedString(string: Name, attributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)
        ])// 设置标题字体大小
        alertController.setValue(attributedTitle, forKey: "attributedTitle")
        let attributedMessage = NSAttributedString(string: Sentence, attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)
        ]) // 设置消息字体大小
        alertController.setValue(attributedMessage, forKey: "attributedMessage")
        
        let defaultAction: UIAlertAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let parentTabBarController = (parent as! TabBarController)
        plantsName = parentTabBarController.plants.map{$0.0}
        zombiesName = parentTabBarController.zombies.map{$0.0}
    }

}
