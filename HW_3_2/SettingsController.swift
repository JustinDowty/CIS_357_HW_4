//
//  SettingsController.swift
//  HW_3_2
//
//  Created by user144683 on 9/20/18.
//  Copyright © 2018 JustinDowty. All rights reserved.
//

import UIKit
protocol SettingsDelegate{
    func settingsSelection(from: String, to: String)
}

class SettingsController: UIViewController {
    var pickerData : [String] = [String]()
    var fromSetting : String = "Yards"
    var toSetting : String = "Miles"
    var fromOrTo = "From"
    var delegate : SettingsDelegate?
    var mode = "Length"
    
    @IBOutlet weak var Picker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Picker.isHidden = true
        if mode == "Length" {
            self.pickerData = ["Yards", "Meters", "Miles"]
            self.fromSetting = "Yards"
            self.toSetting = "Miles"
            FromButton.setTitle(fromSetting, for: .normal)
            ToButton.setTitle(toSetting, for: .normal)
        } else {
            self.pickerData = ["Gallons", "Liters", "Quarts"]
            self.fromSetting = "Gallons"
            self.toSetting = "Liters"
            FromButton.setTitle(fromSetting, for: .normal)
            ToButton.setTitle(toSetting, for: .normal)        }
        
        self.Picker.delegate = self
        self.Picker.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillDisappear(_ animated: Bool) {
       
    }
    
    override func touchesBegan (_ touches: Set<UITouch>,with event: UIEvent?){
        Picker.isHidden = true
    }
    @IBOutlet weak var FromButton: UIButton!
    @IBAction func FromUnitsClicked(_ sender: Any) {
        fromOrTo = "From"
        Picker.isHidden = false
    }
    
    @IBOutlet weak var ToButton: UIButton!
    @IBAction func ToUnitsClicked(_ sender: Any) {
        fromOrTo = "To"
        Picker.isHidden = false
    }
    
    @IBAction func SaveClicked(_ sender: Any) {
        if let d = self.delegate{
            d.settingsSelection(from: fromSetting, to: toSetting)
        }
        self.navigationController!.popViewController(animated: true)
    }
    @IBAction func CancelClicked(_ sender: Any) {
        self.navigationController!.popViewController(animated: true)
    }
}
extension SettingsController : UIPickerViewDelegate, UIPickerViewDataSource{

    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return self.pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        if fromOrTo == "From"{
            self.fromSetting = self.pickerData[row]
            FromButton.setTitle(fromSetting, for: .normal)
        } else {
            self.toSetting = self.pickerData[row]
            ToButton.setTitle(toSetting, for: .normal)
        }
        Picker.isHidden = true
    }
}
