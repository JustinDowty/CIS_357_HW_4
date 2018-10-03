//
//  ConversionCalcTextField.swift
//  HW_3_2
//
//  Created by Workbook-01 on 10/3/18.
//  Copyright © 2018 JustinDowty. All rights reserved.
//

import Foundation
import UIKit

class ConversionCalcTextField: DecimalMinusTextField {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate;
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor(white: 1,alpha: 0.0)
        self.textColor = appDelegate.FOREGROUND_COLOR
        self.layer.borderWidth = 1.0
        self.layer.borderColor = appDelegate.FOREGROUND_COLOR.cgColor
        self.layer.cornerRadius = 2.0;
    }
    
    
}
