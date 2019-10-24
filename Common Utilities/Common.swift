//
//  Common.swift
//  thrive
//
//  Created by Mitch on 07/10/2019.
//  Copyright © 2019 Mitch. All rights reserved.
//

import Foundation

class Common{
    class func delay(_ delay:Double, closure:@escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }
}
