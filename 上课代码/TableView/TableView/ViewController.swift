//
//  ViewController.swift
//  TableView
//
//  Created by Qiansui on 2023/11/9.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate	{

    let kSectionCount:Int = 2
    let kRedSection:Int = 0
    let kBlueSection:Int = 1
    
    let redFlowers: [String] = ["Gerbera", "Peony", "Rose", "Poppy"]
    let blueFlowers: [String] = ["Hyacinth", "Hydranges", "Sea Holly", "Phlox", "Tris"]
    

    func numberOfSections(in tableView: UITableView) -> Int {// 这个函数的作用？
        return kSectionCount
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case kRedSection:
            return redFlowers.count
        case kBlueSection:
            return blueFlowers.count
        default:
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case kRedSection:
            return "Red"
        case kBlueSection:
            return "Blue"
        default:
            return "Unknown"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "flowerCell")! as UITableViewCell
        switch (indexPath.section) {
        case kRedSection:
            cell.textLabel!.text = redFlowers[indexPath.row]
        case kBlueSection:
            cell.textLabel!.text = blueFlowers[indexPath.row]
        default:
            cell.textLabel!.text = "Unknown"
        }
        let flowerImage: UIImage = UIImage(named: cell.textLabel!.text!)!
        cell.imageView!.image = flowerImage
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var flowerMessage:String
        switch indexPath.section {
        case kRedSection:
            flowerMessage = "You choose the red flower - \(redFlowers[indexPath.row])"
        case kBlueSection:
            flowerMessage = "You choose the blue flower - \(blueFlowers[indexPath.row]) "
        default:
            flowerMessage = "Unknown"
        }
        let alertController: UIAlertController = UIAlertController(title: "Flower Selected", message: flowerMessage, preferredStyle: UIAlertController.Style.alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
