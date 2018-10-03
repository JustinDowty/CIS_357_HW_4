//
//  ConversionCalcLabel.swift
//  HW_3_2
//
//  Created by Workbook-01 on 10/3/18.
//  Copyright © 2018 JustinDowty. All rights reserved.
//

import Foundation
import UIKit

class ConversionCalcLabel: UILabel{
    let appDelegate = UIApplication.shared.delegate as! AppDelegate;
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.textColor = appDelegate.FOREGROUND_COLOR
    }
}
