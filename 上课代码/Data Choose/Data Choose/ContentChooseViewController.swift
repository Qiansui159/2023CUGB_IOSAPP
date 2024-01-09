//
//  ContentChooseViewController.swift
//  Data Choose
//
//  Created by Qiansui on 2024/1/7.
//

import UIKit

class ContentChooseViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    let kComponentCount: Int = 2
    let kAnimalComponent: Int = 0
    let kSoundComponent: Int = 1
    
    var animalNames: [String] = []
    var animalSounds: [String] = []
    
    // 处理数据源的内容
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return kComponentCount
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == kAnimalComponent {
            return animalNames.count
        }else{
            return animalSounds.count
        }
    }
    
    // 处理委托协议的内容
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        if component == kAnimalComponent {
            let nameLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 32))
            nameLabel.backgroundColor = UIColor.clear
            nameLabel.text = animalNames[row]
            return nameLabel
        }else{
            let soundLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 32))
            soundLabel.backgroundColor = UIColor.clear
            soundLabel.text = animalSounds[row]
            return soundLabel
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 55.0
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if component == kAnimalComponent{
            return 75.0
        }else{
            return 150.0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {// 执行选择操作时
        let initialView: ViewController = presentingViewController as! ViewController
        if component == kAnimalComponent {
            let chosenSound: Int = pickerView.selectedRow(inComponent: kSoundComponent)
            initialView.ContentOutputLabel.text = String(format: "Chosen animal name: \(animalNames[row]), withSound: \(animalSounds[chosenSound]), from component: The animal")
        }else{
            let chosenAnimal: Int = pickerView.selectedRow(inComponent: kAnimalComponent)
            initialView.ContentOutputLabel.text = String(format: "Chosen animal name: \(animalNames[chosenAnimal]), withSound: \(animalSounds[row]), from component: The sound")
        }
    }
    
    @IBAction func dismissContentChooset(_ sender: Any){
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        animalNames = ["Cat", "Dog", "Mouse"]
        animalSounds = ["Miao", "Wang", "Zhi"]

        // Do any additional setup after loading the view.
    }

}
