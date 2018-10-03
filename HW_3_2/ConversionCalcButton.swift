//
//  ConversionCalcButton.swift
//  HW_3_2
//
//  Created by Workbook-01 on 10/3/18.
//  Copyright © 2018 JustinDowty. All rights reserved.
//

import Foundation

import UIKit

class ConversionCalcButton: UIButton {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate;
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = appDelegate.FOREGROUND_COLOR
        self.tintColor = appDelegate.BACKGROUND_COLOR
        self.layer.cornerRadius = 5.0;
    }
    
    
}
