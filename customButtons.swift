//
//  customButtons.swift
//  thrive
//
//  Created by dan on 9/30/19.
//  Copyright © 2019 dan. All rights reserved.
//

import UIKit

@IBDesignable class customButtons: UIButton {

    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
             layer.borderColor = borderColor.cgColor
          }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
       didSet {
          layer.borderWidth = borderWidth
       }
    }
    @IBInspectable var cornerRadius: CGFloat = 0 {
       didSet {
          layer.cornerRadius = cornerRadius
       }
    }

}
