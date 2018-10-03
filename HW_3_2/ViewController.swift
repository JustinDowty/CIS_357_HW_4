//
//  ViewController.swift
//  HW_3_2
//
//  Created by user144683 on 9/20/18.
//  Copyright © 2018 JustinDowty. All rights reserved.
//


//
//  ViewController.swift
//  HW3
//
//  Created by user144683 on 9/17/18.
//  Copyright © 2018 JustinDowty. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, SettingsDelegate {
    // Initializing label types
    var LengthFromLabel = "Yards"
    var LengthToLabel = "Meters"
    var VolumeFromLabel = "Gallons"
    var VolumeToLabel = "Liters"
    // Initializing mode
    var mode = "Length"
    
    @IBOutlet weak var FromTextField: UITextField!
    @IBOutlet weak var ToTextField: UITextField!
    @IBOutlet weak var FromLabel: UILabel!
    @IBOutlet weak var ToLabel: UILabel!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.FromTextField.delegate = self
        self.ToTextField.delegate = self
        self.view.backgroundColor = appDelegate.BACKGROUND_COLOR
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Resigning Key Input
    override func touchesBegan (_ touches: Set<UITouch>,with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    // Clearing the other text field
    func textFieldDidBeginEditing(_ textField: UITextField){
        if(textField == FromTextField){
            ToTextField.text = ""
        } else {
            FromTextField.text = ""
        }
    }
    
    @IBAction func CalcClicked(_ sender: Any) {
        self.view.endEditing(true)
        if(FromTextField.text == ""){
            if let val = Double(ToTextField.text!){
                let ans = convert(fromUnit: ToLabel.text!, toUnit: FromLabel.text!, value: val)
                FromTextField.text = String(ans)
            }
        } else {
            if let val = Double(FromTextField.text!){
                let ans = convert(fromUnit: FromLabel.text!, toUnit: ToLabel.text!, value: val)
                ToTextField.text = String(ans)
            }
        }
    }
    
    
    @IBAction func ClearClicked(_ sender: Any) {
        self.view.endEditing(true)
        FromTextField.text = ""
        ToTextField.text = ""
    }
    
    
    
    @IBAction func ModeClicked(_ sender: Any) {
        self.view.endEditing(true)
        if(mode == "Length"){
            mode = "Volume"
            FromLabel.text = VolumeFromLabel
            ToLabel.text = VolumeToLabel
        } else {
            mode = "Length"
            FromLabel.text = LengthFromLabel
            ToLabel.text = LengthToLabel
        }
    }

    func settingsSelection(from: String, to: String){
        FromLabel.text = from
        ToLabel.text = to
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let dest = segue.destination as? SettingsController {
            dest.delegate = self
            dest.mode = mode
        }
    }
    
    func convert(fromUnit: String, toUnit: String, value: Double) -> Double{
        if fromUnit == "Yards"{
            if toUnit == "Yards"{
                return value
            } else if toUnit == "Meters"{
                return value * 0.9144
            } else if toUnit == "Miles" {
                return value * 0.000568
            }
        } else if fromUnit == "Meters"{
            if toUnit == "Yards"{
                return value * 1.09361
            } else if toUnit == "Meters"{
                return value
            } else if toUnit == "Miles" {
                return value * 0.000621371
            }
        } else if fromUnit == "Miles"{
            if toUnit == "Yards"{
                return value * 1760.0
            } else if toUnit == "Meters"{
                return value * 1609.34
            } else if toUnit == "Miles" {
                return value
            }
        } else if fromUnit == "Gallons"{
            if toUnit == "Gallons"{
                return value
            } else if toUnit == "Liters"{
                return value * 3.78541
            } else if toUnit == "Quarts"{
                return value * 4.0
            }
        } else if fromUnit == "Liters"{
            if toUnit == "Gallons"{
                return value * 0.264172
            } else if toUnit == "Liters"{
                return value
            } else if toUnit == "Quarts"{
                return value * 1.05669
            }
        } else if fromUnit == "Quarts"{
            if toUnit == "Gallons"{
                return value * 0.25
            } else if toUnit == "Liters"{
                return value * 0.946353
            } else if toUnit == "Quarts"{
                return value
            }
        }
        return -1.0
    }
}
